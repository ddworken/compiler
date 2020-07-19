open Exprs
open Pretty
open Printf
open String
open Errors
open TypeCheck

(* This data type lets us keep track of how a binding was introduced.
   We'll use it to discard unnecessary Seq bindings, and to distinguish 
   letrec from let. Essentially, it accumulates just enough information 
   in our binding list to tell us how to reconstruct an appropriate aexpr. *)
type 'a anf_bind =
  | BSeq of 'a cexpr
  | BLet of string * 'a cexpr
  | BLetRec of (string * 'a cexpr) list

(* And for debugging: *)
let string_of_anf_bind (ab : 'a anf_bind) : string =
  match ab with
  | BSeq exp -> sprintf "BSeq(%s)" (string_of_cexpr exp)
  | BLet (name, exp) -> sprintf "BLet(%s, %s)" name (string_of_cexpr exp)
  | BLetRec names ->
    sprintf
      "BLetRec([%s])"
      (ExtString.String.join ", " (List.map (fun (n, c) -> "(" ^ n ^ ", " ^ string_of_cexpr c ^ ")") names))
;;

let bind_to_name (b : 'a bind) : string =
  match b with
  | BName (a, _, _) -> a
  | BBlank _ -> "_"
  | _ -> raise (InternalCompilerError "Tuple bindings should have been desugared away")
;;

let anf (p : tag program) : sourcespan aprogram =
  let rec helpP (p : tag program) : sourcespan aprogram =
    match p with
    | Program (_, [], body, t) -> AProgram ([], helpA body, get_sourcespan t)
    | Program _ -> raise (InternalCompilerError "anf found decls when they should have been desugared away!")
  and helpC (e : tag expr) : sourcespan cexpr * sourcespan anf_bind list =
    match e with
    | EString (s, t) -> CString (s, get_sourcespan t), []
    | EAnnot (e, _, _) -> helpC e
    | EPrim1 (op, _, arg, t) ->
      let arg_imm, arg_setup = helpI arg in
      CPrim1 (op, arg_imm, get_sourcespan t), arg_setup
    | EPrim2 (((And | Or) as op), _, left, right, t) -> CPrim2 (op, helpA left, helpA right, get_sourcespan t), []
    | EPrim2 (op, _, left, right, t) ->
      let left_imm, left_setup = helpI left in
      let right_imm, right_setup = helpI right in
      CPrim2 (op, ACExpr (CImmExpr left_imm), ACExpr (CImmExpr right_imm), get_sourcespan t), left_setup @ right_setup
    | EIf (cond, _then, _else, t) ->
      let cond_imm, cond_setup = helpI cond in
      CIf (cond_imm, helpA _then, helpA _else, get_sourcespan t), cond_setup
    | ELet ([], body, _) -> helpC body
    | ELet ((BBlank (_, _), exp, _) :: rest, body, pos) ->
      let exp_ans, exp_setup = helpC exp in
      let body_ans, body_setup = helpC (ELet (rest, body, pos)) in
      body_ans, exp_setup @ [ BSeq exp_ans ] @ body_setup
    | ELet ((BName (bind, _, _), exp, _) :: rest, body, pos) ->
      let exp_ans, exp_setup = helpC exp in
      let body_ans, body_setup = helpC (ELet (rest, body, pos)) in
      body_ans, exp_setup @ [ BLet (bind, exp_ans) ] @ body_setup
    | ELetRec (binds, body, _) ->
      let processBind (bind, rhs, _) =
        match bind with
        | BName (name, _, _) -> name, helpC rhs
        | _ ->
          raise
            (InternalCompilerError
               (sprintf "Encountered a non-simple binding in ANFing a let-rec: %s" (string_of_bind bind)))
      in
      let names, new_binds_setup = List.split (List.map processBind binds) in
      let new_binds, new_setup = List.split new_binds_setup in
      let body_ans, body_setup = helpC body in
      body_ans, BLetRec (List.combine names new_binds) :: body_setup
    | ELambda (args, body, t) ->
      let processBind bind =
        match bind with
        | BName (name, _, _) -> name
        | BBlank _ -> "_"
        | _ ->
          raise
            (InternalCompilerError
               (sprintf "Encountered a non-simple binding in ANFing a lambda: %s" (string_of_bind bind)))
      in
      CLambda (List.map processBind args, helpA body, get_sourcespan t), []
    | ELet ((BTuple (binds, _), exp, _) :: rest, body, pos) ->
      raise (InternalCompilerError "Tuple bindings should have been desugared away")
    | EApp (func, args, native, t) ->
      let func_ans, func_setup = helpI func in
      let new_args, new_setup = List.split (List.map helpI args) in
      CApp (func_ans, new_args, native, get_sourcespan t), func_setup @ List.concat new_setup
    | ESeq (e1, e2, _) ->
      let e1_ans, e1_setup = helpC e1 in
      let e2_ans, e2_setup = helpC e2 in
      e2_ans, e1_setup @ [ BSeq e1_ans ] @ e2_setup
    | ETuple (args, t) ->
      let new_args, new_setup = List.split (List.map helpI args) in
      CTuple (new_args, get_sourcespan t), List.concat new_setup
    | EGetItem (tup, idx, len, t) ->
      let tup_imm, tup_setup = helpI tup in
      CGetItem (tup_imm, idx, get_sourcespan t), tup_setup
    | ESetItem (tup, idx, len, newval, t) ->
      let tup_imm, tup_setup = helpI tup in
      let new_imm, new_setup = helpI newval in
      CSetItem (tup_imm, idx, new_imm, get_sourcespan t), tup_setup @ new_setup
    | ETryCatch (e1, n, e2, t) -> CTryCatch (helpA e1, n, helpA e2, get_sourcespan t), []
    | EThrow (n, t) -> CThrow (n, get_sourcespan t), []
    | _ ->
      let imm, setup = helpI e in
      CImmExpr imm, setup
  and helpI (e : tag expr) : sourcespan immexpr * sourcespan anf_bind list =
    match e with
    | EString (s, tag) ->
      let tmp = sprintf "string_%d" (get_int tag) in
      ImmId (tmp, get_sourcespan tag), [ BLet (tmp, CString (s, get_sourcespan tag)) ]
    | ENumber (n, t) -> ImmNum (n, get_sourcespan t), []
    | EBool (b, t) -> ImmBool (b, get_sourcespan t), []
    | EId (name, t) -> ImmId (name, get_sourcespan t), []
    | ENil (_, t) -> ImmNil (get_sourcespan t), []
    | EAnnot (e, _, _) -> helpI e
    | ESeq (e1, e2, _) ->
      let e1_imm, e1_setup = helpI e1 in
      let e2_imm, e2_setup = helpI e2 in
      e2_imm, e1_setup @ e2_setup
    | ETuple (args, tag) ->
      let tmp = sprintf "tup_%d" (get_int tag) in
      let new_args, new_setup = List.split (List.map helpI args) in
      ImmId (tmp, get_sourcespan tag), List.concat new_setup @ [ BLet (tmp, CTuple (new_args, get_sourcespan tag)) ]
    | EGetItem (tup, idx, len, tag) ->
      let tmp = sprintf "get_%d" (get_int tag) in
      let tup_imm, tup_setup = helpI tup in
      ImmId (tmp, get_sourcespan tag), tup_setup @ [ BLet (tmp, CGetItem (tup_imm, idx, get_sourcespan tag)) ]
    | ESetItem (tup, idx, len, newval, tag) ->
      let tmp = sprintf "set_%d" (get_int tag) in
      let tup_imm, tup_setup = helpI tup in
      let new_imm, new_setup = helpI newval in
      ( ImmId (tmp, get_sourcespan tag)
      , tup_setup @ new_setup @ [ BLet (tmp, CSetItem (tup_imm, idx, new_imm, get_sourcespan tag)) ] )
    | ETryCatch (e1, n, e2, tag) ->
      let tmp = sprintf "trycatch_%d" (get_int tag) in
      ImmId (tmp, get_sourcespan tag), [ BLet (tmp, CTryCatch (helpA e1, n, helpA e2, get_sourcespan tag)) ]
    | EThrow (n, tag) ->
      let tmp = sprintf "throw_%d" (get_int tag) in
      ImmId (tmp, get_sourcespan tag), [ BLet (tmp, CThrow (n, get_sourcespan tag)) ]
    | EPrim1 (op, _, arg, tag) ->
      let tmp = sprintf "unary_%d" (get_int tag) in
      let arg_imm, arg_setup = helpI arg in
      ImmId (tmp, get_sourcespan tag), arg_setup @ [ BLet (tmp, CPrim1 (op, arg_imm, get_sourcespan tag)) ]
    | EPrim2 (((And | Or) as op), _, left, right, tag) ->
      let tmp = sprintf "binop_and_or_%d" (get_int tag) in
      ImmId (tmp, get_sourcespan tag), [ BLet (tmp, CPrim2 (op, helpA left, helpA right, get_sourcespan tag)) ]
    | EPrim2 (op, _, left, right, tag) ->
      let tmp = sprintf "binop_%d" (get_int tag) in
      let left_imm, left_setup = helpI left in
      let right_imm, right_setup = helpI right in
      ( ImmId (tmp, get_sourcespan tag)
      , left_setup
        @ right_setup
        @ [ BLet (tmp, CPrim2 (op, ACExpr (CImmExpr left_imm), ACExpr (CImmExpr right_imm), get_sourcespan tag)) ] )
    | EIf (cond, _then, _else, tag) ->
      let tmp = sprintf "if_%d" (get_int tag) in
      let cond_imm, cond_setup = helpI cond in
      ( ImmId (tmp, get_sourcespan tag)
      , cond_setup @ [ BLet (tmp, CIf (cond_imm, helpA _then, helpA _else, get_sourcespan tag)) ] )
    | EApp (func, args, native, tag) ->
      let tmp = sprintf "app_%d" (get_int tag) in
      let new_func, func_setup = helpI func in
      let new_args, new_setup = List.split (List.map helpI args) in
      ( ImmId (tmp, get_sourcespan tag)
      , func_setup @ List.concat new_setup @ [ BLet (tmp, CApp (new_func, new_args, native, get_sourcespan tag)) ] )
    | EGenApp (func, _, args, native, tag) ->
      let tmp = sprintf "app_%d" (get_int tag) in
      let new_func, func_setup = helpI func in
      let new_args, new_setup = List.split (List.map helpI args) in
      ( ImmId (tmp, get_sourcespan tag)
      , func_setup @ List.concat new_setup @ [ BLet (tmp, CApp (new_func, new_args, native, get_sourcespan tag)) ] )
    | ELet ([], body, _) -> helpI body
    | ELet ((BBlank (_, _), exp, _) :: rest, body, pos) ->
      let exp_ans, exp_setup = helpC exp in
      let body_ans, body_setup = helpI (ELet (rest, body, pos)) in
      body_ans, exp_setup @ [ BSeq exp_ans ] @ body_setup
    | ELetRec (binds, body, tag) ->
      let tmp = sprintf "lam_%d" (get_int tag) in
      let processBind (bind, rhs, _) =
        match bind with
        | BName (name, _, _) -> name, helpC rhs
        | _ ->
          raise
            (InternalCompilerError
               (sprintf "Encountered a non-simple binding in ANFing a let-rec: %s" (string_of_bind bind)))
      in
      let names, new_binds_setup = List.split (List.map processBind binds) in
      let new_binds, new_setup = List.split new_binds_setup in
      let body_ans, body_setup = helpC body in
      ( ImmId (tmp, get_sourcespan tag)
      , List.concat new_setup @ [ BLetRec (List.combine names new_binds) ] @ body_setup @ [ BLet (tmp, body_ans) ] )
    | ELambda (args, body, tag) ->
      let tmp = sprintf "lam_%d" (get_int tag) in
      let processBind bind =
        match bind with
        | BName (name, _, _) -> name
        | BBlank _ -> "_"
        | _ ->
          raise
            (InternalCompilerError
               (sprintf "Encountered a non-simple binding in ANFing a lambda: %s" (string_of_bind bind)))
      in
      ( ImmId (tmp, get_sourcespan tag)
      , [ BLet (tmp, CLambda (List.map processBind args, helpA body, get_sourcespan tag)) ] )
    | ELet ((BName (bind, _, _), exp, _) :: rest, body, pos) ->
      let exp_ans, exp_setup = helpC exp in
      let body_ans, body_setup = helpI (ELet (rest, body, pos)) in
      body_ans, exp_setup @ [ BLet (bind, exp_ans) ] @ body_setup
    | ELet ((BTuple (binds, _), exp, _) :: rest, body, pos) ->
      raise (InternalCompilerError "Tuple bindings should have been desugared away")
    | ETryCatchFinally _ -> raise (NotYetImplemented "ETryCatchFinally")
  and helpA e : sourcespan aexpr =
    (* TODO: loc: Could have Bseq, blet, and bletrec hold spans! *)
    let ans, ans_setup = helpC e in
    List.fold_right
      (fun bind body ->
        match bind with
        | BSeq exp -> ASeq (exp, body, dummy_span)
        | BLet (name, exp) -> ALet (name, exp, body, dummy_span)
        | BLetRec names -> ALetRec (names, body, dummy_span))
      ans_setup
      (ACExpr ans)
  in
  helpP p
;;
