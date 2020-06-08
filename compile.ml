open Printf
open Pretty
open Phases
open Exprs
open Assembly
open Errors
open ExtLib
open TypeCheck
module StringSet = Set.Make (String)
module StringMap = Map.Make (String)

(* TODO: don't be a bad person and use a global here: *)
let global_defined_exns = ref [] 

type 'a sm_envt = 'a StringMap.t

type 'a envt = (string * 'a) list

(*
All data types are tagged in order to support runtime type checking

Tags:
0bxx0   --> Int63
0b111   --> Boolean
0b101   --> Closure
0b001   --> Tuple 
0b011   --> String
*)

let bool_tag = 0x0000000000000007L
let bool_tag_mask = 0x0000000000000007L
let num_tag = 0x0000000000000000L
let num_tag_mask = 0x0000000000000001L
let closure_tag = 0x0000000000000005L
let closure_tag_mask = 0x0000000000000007L
let tuple_tag = 0x0000000000000001L
let tuple_tag_mask = 0x0000000000000007L
let string_tag = 0x0000000000000003L
let string_tag_mask = 0x0000000000000007L
let const_nil = HexConst (Int64.add 0x0L tuple_tag)
let const_true = HexConst 0xFFFFFFFFFFFFFFFFL
let const_false = HexConst 0x7FFFFFFFFFFFFFFFL
let bool_mask = HexConst 0x8000000000000000L
let err_COMP_NOT_NUM = 1L
let err_ARITH_NOT_NUM = 2L
let err_LOGIC_NOT_BOOL = 3L
let err_IF_NOT_BOOL = 4L
let err_OVERFLOW = 5L
let err_GET_NOT_TUPLE = 6L
let err_GET_LOW_INDEX = 7L
let err_GET_HIGH_INDEX = 8L
let err_NIL_DEREF = 9L
let err_OUT_OF_MEMORY = 10L
let err_CALL_NOT_CLOSURE = 11L
let err_CALL_ARITY_ERR = 12L
let err_OUT_OF_STACK_MEMORY = 13L
let err_EXPECTED_STRING = 14L
let first_six_args_registers = [ RDI; RSI; RDX; RCX; R8; R9 ]

(* Functions to convert snake values to ocaml values *)
let int64_to_snake_int (c_int : int64) : arg = Const (Int64.shift_left c_int 1)
let bool_to_snake_bool (b : bool) : arg = if b then const_true else const_false
let is_snake_int (c_int : int64) : bool = Int64.logand c_int num_tag_mask = num_tag
let is_snake_bool (c_int : int64) : bool = Int64.logand c_int bool_tag_mask = bool_tag

(* Global labels in the assembly for error handling *)
let overflow_label = "_global_overflow_abort"
let assertion_failed_comparison_not_num = "_global_assertion_failed_comparison_not_num"
let assertion_failed_arith_not_num = "_global_assertion_failed_arith_not_num"
let assertion_failed_logic_not_bool = "_global_assertion_failed_logic_not_bool"
let assertion_failed_if_not_bool = "_global_assertion_failed_if_not_bool"
let assertion_failed_not_tuple = "_global_assertion_failed_not_tuple"
let assertion_failed_get_index_too_large = "_global_assertion_failed_index_too_large"
let assertion_failed_get_index_too_small = "_global_assertion_failed_index_too_small"
let assertion_failed_index_nil = "_global_assertion_failed_index_nil"
let assertion_failed_no_more_heap_space = "_global_assertion_failed_no_more_heap_space"
let assertion_failed_not_a_closure = "_global_assertion_failed_not_a_closure"
let assertion_failed_arity_error = "_global_assertion_failed_arity_error"
let assertion_failed_out_of_stack_memory = "_global_assertion_failed_out_of_stack_memory"

(* Round up the given number to the next multiple of 16 *)
let round_up_to_multiple_of_16 (n : int) : int =
  match n mod 16 with
  | 0 -> n
  | remainder -> n + (16 - remainder)
;;

let rec list_truncate (l : 'a list) (n : int) : 'a list =
  if n = 0
  then []
  else (
    match l with
    | f :: r -> f :: list_truncate r (n - 1)
    | [] -> [])
;;

let rec find_opt ls x =
  match ls with
  | [] -> None
  | (y, v) :: rest -> if y = x then Some v else find_opt rest x
;;

(* You may find some of these helpers useful *)
let rec find ls x =
  match ls with
  | [] -> raise (InternalCompilerError (sprintf "Name %s not found" x))
  | (y, v) :: rest -> if y = x then v else find rest x
;;

(* Returns the numbers from 1 to n (inclusive of 1 and n) *)
let range (n : int) = List.init n (fun x -> x + 1)

let count_vars e =
  let rec helpA e =
    match e with
    | ASeq (e1, e2, _) -> max (helpC e1) (helpA e2)
    | ALet (_, bind, body, _) -> 1 + max (helpC bind) (helpA body)
    | ALetRec (binds, body, _) ->
      List.length binds + List.fold_left max (helpA body) (List.map (fun (_, rhs) -> helpC rhs) binds)
    | ACExpr e -> helpC e
  and helpC e =
    match e with
    | CIf (_, t, f, _) -> max (helpA t) (helpA f)
    | CPrim2 ((And | Or), l, r, _) -> max (helpA l) (helpA r)
    | _ -> 0
  in
  helpA e
;;

let rename_and_tag (p : tag program) : tag program =
  let rec rename env p =
    match p with
    | Program (tydecls, [], body, tag) -> Program (tydecls, [], helpE env body, tag)
    | Program (_, _, _, _) ->
      raise (InternalCompilerError "Found decls in rename_and_tag when they should have been desugared away")
  and helpB env b =
    match b with
    | BBlank (typ, tag) -> b, env
    | BName (name, typ, tag) ->
      let name' = sprintf "%s_%d" name tag in
      BName (name', typ, tag), (name, name') :: env
    | BTuple (binds, tag) ->
      let binds', env' = helpBS env binds in
      BTuple (binds', tag), env'
  and helpBS env (bs : tag bind list) =
    match bs with
    | [] -> [], env
    | b :: bs ->
      let b', env' = helpB env b in
      let bs', env'' = helpBS env' bs in
      b' :: bs', env''
  and helpBG env (bindings : tag binding list) =
    match bindings with
    | [] -> [], env
    | (b, e, a) :: bindings ->
      let b', env' = helpB env b in
      let e' = helpE env e in
      let bindings', env'' = helpBG env' bindings in
      (b', e', a) :: bindings', env''
  and helpE env e =
    let get_ct f =
      match f with
      | EId (name, _) ->
        (match find_opt TypeCheck.initial_fun_env name with
        | Some (_, ct) -> ct
        | None -> Snake)
      | _ -> Snake
    in
    match e with
    | EAnnot (e, t, tag) -> helpE env e
    | ESeq (e1, e2, tag) -> ESeq (helpE env e1, helpE env e2, tag)
    | ETuple (es, tag) -> ETuple (List.map (helpE env) es, tag)
    | EGetItem (e, idx, len, tag) -> EGetItem (helpE env e, idx, len, tag)
    | ESetItem (e, idx, len, newval, tag) -> ESetItem (helpE env e, idx, len, helpE env newval, tag)
    | EPrim1 (op, typs, arg, tag) -> EPrim1 (op, typs, helpE env arg, tag)
    | EPrim2 (op, typs, left, right, tag) -> EPrim2 (op, typs, helpE env left, helpE env right, tag)
    | ETryCatch(e1, n, e2, tag) -> ETryCatch(helpE env e1, n, helpE env e2, tag)
    | EThrow(n, tag) -> EThrow(n, tag)
    | EIf (c, t, f, tag) -> EIf (helpE env c, helpE env t, helpE env f, tag)
    | EString _ | ENumber _ | EBool _ | ENil _ -> e 
    | EId (name, tag) ->
      (try EId (find env name, tag) with
      | InternalCompilerError _ -> e)
    | EApp (func, args, _, tag) ->
      let func = helpE env func in
      let call_type = get_ct func in
      EApp (func, List.map (helpE env) args, call_type, tag)
    | EGenApp (func, tyargs, args, _, tag) ->
      let func = helpE env func in
      let call_type = get_ct func in
      EGenApp (func, tyargs, List.map (helpE env) args, call_type, tag)
    | ELet (binds, body, tag) ->
      let binds', env' = helpBG env binds in
      let body' = helpE env' body in
      ELet (binds', body', tag)
    | ELetRec (bindings, body, tag) ->
      let revbinds, env =
        List.fold_left
          (fun (revbinds, env) (b, e, t) ->
            let b, env = helpB env b in
            (b, e, t) :: revbinds, env)
          ([], env)
          bindings
      in
      let bindings' = List.fold_left (fun bindings (b, e, tag) -> (b, helpE env e, tag) :: bindings) [] revbinds in
      let body' = helpE env body in
      ELetRec (bindings', body', tag)
    | ELambda (binds, body, tag) ->
      let binds', env' = helpBS env binds in
      let body' = helpE env' body in
      ELambda (binds', body', tag)
  in
  rename [] p
;;

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
    sprintf "BLetRec([%s])" (String.join ", " (List.map (fun (n, c) -> "(" ^ n ^ ", " ^ string_of_cexpr c ^ ")") names))
;;

let bind_to_name (b : 'a bind) : string =
  match b with
  | BName (a, _, _) -> a
  | BBlank _ -> "_"
  | _ -> raise (InternalCompilerError "Tuple bindings should have been desugared away")
;;

let anf (p : tag program) : unit aprogram =
  let rec helpP (p : tag program) : unit aprogram =
    match p with
    | Program (_, [], body, _) -> AProgram ([], helpA body, ())
    | Program _ -> raise (InternalCompilerError "anf found decls when they should have been desugared away!")
  and helpC (e : tag expr) : unit cexpr * unit anf_bind list =
    match e with
    | EString (s, _) -> CString(s, ()), []
    | EAnnot (e, _, _) -> helpC e
    | EPrim1 (op, _, arg, _) ->
      let arg_imm, arg_setup = helpI arg in
      CPrim1 (op, arg_imm, ()), arg_setup
    | EPrim2 (((And | Or) as op), _, left, right, tag) -> CPrim2 (op, helpA left, helpA right, ()), []
    | EPrim2 (op, _, left, right, _) ->
      let left_imm, left_setup = helpI left in
      let right_imm, right_setup = helpI right in
      CPrim2 (op, ACExpr (CImmExpr left_imm), ACExpr (CImmExpr right_imm), ()), left_setup @ right_setup
    | EIf (cond, _then, _else, _) ->
      let cond_imm, cond_setup = helpI cond in
      CIf (cond_imm, helpA _then, helpA _else, ()), cond_setup
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
    | ELambda (args, body, _) ->
      let processBind bind =
        match bind with
        | BName (name, _, _) -> name
        | BBlank _ -> "_"
        | _ ->
          raise
            (InternalCompilerError
               (sprintf "Encountered a non-simple binding in ANFing a lambda: %s" (string_of_bind bind)))
      in
      CLambda (List.map processBind args, helpA body, ()), []
    | ELet ((BTuple (binds, _), exp, _) :: rest, body, pos) ->
      raise (InternalCompilerError "Tuple bindings should have been desugared away")
    | EApp (func, args, native, _) ->
      let func_ans, func_setup = helpI func in
      let new_args, new_setup = List.split (List.map helpI args) in
      CApp (func_ans, new_args, native, ()), func_setup @ List.concat new_setup
    | ESeq (e1, e2, _) ->
      let e1_ans, e1_setup = helpC e1 in
      let e2_ans, e2_setup = helpC e2 in
      e2_ans, e1_setup @ [ BSeq e1_ans ] @ e2_setup
    | ETuple (args, _) ->
      let new_args, new_setup = List.split (List.map helpI args) in
      CTuple (new_args, ()), List.concat new_setup
    | EGetItem (tup, idx, len, _) ->
      let tup_imm, tup_setup = helpI tup in
      CGetItem (tup_imm, idx, ()), tup_setup
    | ESetItem (tup, idx, len, newval, _) ->
      let tup_imm, tup_setup = helpI tup in
      let new_imm, new_setup = helpI newval in
      CSetItem (tup_imm, idx, new_imm, ()), tup_setup @ new_setup
    | ETryCatch(e1, n, e2, _) -> CTryCatch(helpA e1, n, helpA e2, ()), [] 
    | EThrow(n, _) -> CThrow(n, ()), [] 
    | _ ->
      let imm, setup = helpI e in
      CImmExpr imm, setup
  and helpI (e : tag expr) : unit immexpr * unit anf_bind list =
    match e with
    | EString (s, tag) -> 
    let tmp = sprintf "string_%d" tag in 
    ImmId(tmp, ()), [BLet(tmp, CString(s, ()))]
    | ENumber (n, _) -> ImmNum (n, ()), []
    | EBool (b, _) -> ImmBool (b, ()), []
    | EId (name, _) -> ImmId (name, ()), []
    | ENil _ -> ImmNil (), []
    | EAnnot (e, _, _) -> helpI e
    | ESeq (e1, e2, _) ->
      let e1_imm, e1_setup = helpI e1 in
      let e2_imm, e2_setup = helpI e2 in
      e2_imm, e1_setup @ e2_setup
    | ETuple (args, tag) ->
      let tmp = sprintf "tup_%d" tag in
      let new_args, new_setup = List.split (List.map helpI args) in
      ImmId (tmp, ()), List.concat new_setup @ [ BLet (tmp, CTuple (new_args, ())) ]
    | EGetItem (tup, idx, len, tag) ->
      let tmp = sprintf "get_%d" tag in
      let tup_imm, tup_setup = helpI tup in
      ImmId (tmp, ()), tup_setup @ [ BLet (tmp, CGetItem (tup_imm, idx, ())) ]
    | ESetItem (tup, idx, len, newval, tag) ->
      let tmp = sprintf "set_%d" tag in
      let tup_imm, tup_setup = helpI tup in
      let new_imm, new_setup = helpI newval in
      ImmId (tmp, ()), tup_setup @ new_setup @ [ BLet (tmp, CSetItem (tup_imm, idx, new_imm, ())) ]
    | ETryCatch(e1, n, e2, tag) -> 
      let tmp = sprintf "trycatch_%d" tag in 
      ImmId(tmp, ()), [ BLet(tmp, CTryCatch(helpA e1, n, helpA e2, ()))]
    | EThrow(n, tag) -> 
      let tmp = sprintf "throw_%d" tag in 
      ImmId(tmp, ()), [BLet(tmp, CThrow(n, ()))]
    | EPrim1 (op, _, arg, tag) ->
      let tmp = sprintf "unary_%d" tag in
      let arg_imm, arg_setup = helpI arg in
      ImmId (tmp, ()), arg_setup @ [ BLet (tmp, CPrim1 (op, arg_imm, ())) ]
    | EPrim2 (((And | Or) as op), _, left, right, tag) ->
      let tmp = sprintf "binop_and_or_%d" tag in
      ImmId (tmp, ()), [ BLet (tmp, CPrim2 (op, helpA left, helpA right, ())) ]
    | EPrim2 (op, _, left, right, tag) ->
      let tmp = sprintf "binop_%d" tag in
      let left_imm, left_setup = helpI left in
      let right_imm, right_setup = helpI right in
      ( ImmId (tmp, ())
      , left_setup
        @ right_setup
        @ [ BLet (tmp, CPrim2 (op, ACExpr (CImmExpr left_imm), ACExpr (CImmExpr right_imm), ())) ] )
    | EIf (cond, _then, _else, tag) ->
      let tmp = sprintf "if_%d" tag in
      let cond_imm, cond_setup = helpI cond in
      ImmId (tmp, ()), cond_setup @ [ BLet (tmp, CIf (cond_imm, helpA _then, helpA _else, ())) ]
    | EApp (func, args, native, tag) ->
      let tmp = sprintf "app_%d" tag in
      let new_func, func_setup = helpI func in
      let new_args, new_setup = List.split (List.map helpI args) in
      ImmId (tmp, ()), func_setup @ List.concat new_setup @ [ BLet (tmp, CApp (new_func, new_args, native, ())) ]
    | EGenApp (func, _, args, native, tag) ->
      let tmp = sprintf "app_%d" tag in
      let new_func, func_setup = helpI func in
      let new_args, new_setup = List.split (List.map helpI args) in
      ImmId (tmp, ()), func_setup @ List.concat new_setup @ [ BLet (tmp, CApp (new_func, new_args, native, ())) ]
    | ELet ([], body, _) -> helpI body
    | ELet ((BBlank (_, _), exp, _) :: rest, body, pos) ->
      let exp_ans, exp_setup = helpC exp in
      let body_ans, body_setup = helpI (ELet (rest, body, pos)) in
      body_ans, exp_setup @ [ BSeq exp_ans ] @ body_setup
    | ELetRec (binds, body, tag) ->
      let tmp = sprintf "lam_%d" tag in
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
      ( ImmId (tmp, ())
      , List.concat new_setup @ [ BLetRec (List.combine names new_binds) ] @ body_setup @ [ BLet (tmp, body_ans) ] )
    | ELambda (args, body, tag) ->
      let tmp = sprintf "lam_%d" tag in
      let processBind bind =
        match bind with
        | BName (name, _, _) -> name
        | BBlank _ -> "_"
        | _ ->
          raise
            (InternalCompilerError
               (sprintf "Encountered a non-simple binding in ANFing a lambda: %s" (string_of_bind bind)))
      in
      ImmId (tmp, ()), [ BLet (tmp, CLambda (List.map processBind args, helpA body, ())) ]
    | ELet ((BName (bind, _, _), exp, _) :: rest, body, pos) ->
      let exp_ans, exp_setup = helpC exp in
      let body_ans, body_setup = helpI (ELet (rest, body, pos)) in
      body_ans, exp_setup @ [ BLet (bind, exp_ans) ] @ body_setup
    | ELet ((BTuple (binds, _), exp, _) :: rest, body, pos) ->
      raise (InternalCompilerError "Tuple bindings should have been desugared away")
  and helpA e : unit aexpr =
    let ans, ans_setup = helpC e in
    List.fold_right
      (fun bind body ->
        match bind with
        | BSeq exp -> ASeq (exp, body, ())
        | BLet (name, exp) -> ALet (name, exp, body, ())
        | BLetRec names -> ALetRec (names, body, ()))
      ans_setup
      (ACExpr ans)
  in
  helpP p
;;

(* Returns whether or not the given option holds a value *)
let is_value (x : 'a option) : bool =
  match x with
  | Some _ -> true
  | None -> false
;;

(* Extract all variable names from the given list of defined functions and variables *)
let rec extract_names (l : (string * 'a) list) : string list =
  let names, _ = List.split l in
  names
;;

(* Gets the assembly for the function argument of index i.  Specific to the calling convention.
 * idx + 2 to skip over the first thing (the old RBP) and the second thing (the saved ret) *)
let get_fn_arg_asm (i : int) : arg = RegOffset (i + 2, RBP)

let rec get_expected_arity (fn : string) (initial_fun_env : funenvt) : int option =
  match initial_fun_env with
  | (n, (SForall (_, TyArr (lhs, _, _), _), ct)) :: rest when fn = n -> Some (List.length lhs)
  | _ :: rest -> get_expected_arity fn rest
  | [] -> None
;;

(* Get the location of the given variable from the given list of defined functions and variables. 
Returns None if there is no variable with that name defined *)
let rec get_location_of_variable (v : string) (l : sourcespan binding list) : sourcespan option =
  match l with
  | (BName (var, _, loc), _, _) :: rest when var = v -> Some loc
  | (BBlank (_, loc), _, _) :: rest when v = "_" -> Some loc
  | (BTuple _, _, _) :: rest -> raise (InternalCompilerError "get_location_of_variable found an illegal BTuple")
  | _ :: rest -> get_location_of_variable v rest
  | [] -> None
;;

(* From a given list of variable names (ie used within a single let binding or within a single function), 
  generate DuplicateId errors if any variable names are reused.  *)
let rec get_arg_errors (args : (string * sourcespan) list) : exn list =
  match args with
  | (s, loc) :: rest ->
    (match List.mem s (List.map (fun (a, b) -> a) rest) with
    | true -> DuplicateId (s, List.assoc s rest, loc) :: get_arg_errors rest
    | false -> get_arg_errors rest)
  | [] -> []
;;

let from_bindings bindings =
  List.fold_left
    (fun acc (name, (scheme, ct)) ->
      StringMap.add (if ct = Native then List.nth (String.split_on_char '#' name) 1 else name) (scheme, ct) acc)
    StringMap.empty
    bindings
;;

(* Prepends a list-like env onto an envt *)
let merge_envs list_env1 env2 = List.fold_right (fun (id, offset) env -> StringMap.add id offset env) list_env1 env2

(* Combines two envts into one, preferring the first one *)
let prepend env1 env2 = StringMap.union (fun _ a _ -> Some a) env1 env2
let env_keys e = List.map fst (StringMap.bindings e)

(* Scope_info stores the location where something was defined,
   and if it was a function declaration, then its type arity and argument arity *)
type scope_info = sourcespan * int option * int option

let is_well_formed (p : sourcespan program) : sourcespan program fallible =
  let rec wf_E e (env : scope_info sm_envt) (tyenv : StringSet.t) =
    debug_printf "In wf_E: %s\n" (ExtString.String.join ", " (env_keys env));
    match e with
    | EString _ -> [] 
    | ESeq (e1, e2, _) -> wf_E e1 env tyenv @ wf_E e2 env tyenv
    | ETuple (es, _) -> List.concat (List.map (fun e -> wf_E e env tyenv) es)
    | EGetItem (e, idx, len, pos) ->
      (if idx >= len || len < 0 || idx < 0 then [ IndexOutOfBounds (idx, len, pos) ] else []) @ wf_E e env tyenv
    | ESetItem (e, idx, len, newval, pos) ->
      (if idx >= len || len < 0 || idx < 0 then [ IndexOutOfBounds (idx, len, pos) ] else [])
      @ wf_E e env tyenv
      @ wf_E newval env tyenv
    | EAnnot (e, t, _) -> wf_E e env tyenv @ wf_T tyenv t
    | ENil _ -> []
    | EBool _ -> []
    | ENumber (n, loc) ->
      if n > Int64.div Int64.max_int 2L || n < Int64.div Int64.min_int 2L then [ Overflow (n, loc) ] else []
    | EId (x, loc) -> if StringMap.mem x env then [] else [ UnboundId (x, loc) ]
    | EPrim1 (_, _, e, _) -> wf_E e env tyenv
    | EPrim2 (_, _, l, r, _) -> wf_E l env tyenv @ wf_E r env tyenv
    (* TODO: check that the exception being caught actually exists *)
    | EThrow(n, _) -> [] 
    | ETryCatch(e1, _, e2, _) -> wf_E e1 env tyenv @ wf_E e2 env tyenv 
    | EIf (c, t, f, _) -> wf_E c env tyenv @ wf_E t env tyenv @ wf_E f env tyenv
    | ELet (bindings, body, _) ->
      let rec find_locs x (binds : 'a bind list) : 'a list =
        match binds with
        | [] -> []
        | BBlank _ :: rest -> find_locs x rest
        | BName (y, _, loc) :: rest -> if x = y then loc :: find_locs x rest else find_locs x rest
        | BTuple (binds, _) :: rest -> find_locs x binds @ find_locs x rest
      in
      let rec find_dupes (binds : 'a bind list) : exn list =
        match binds with
        | [] -> []
        | BBlank _ :: rest -> find_dupes rest
        | BName (x, _, def) :: rest -> List.map (fun use -> DuplicateId (x, use, def)) (find_locs x rest)
        | BTuple (binds, _) :: rest -> find_dupes (binds @ rest)
      in
      let dupeIds = find_dupes (List.map (fun (b, _, _) -> b) bindings) in
      let rec process_binds (rem_binds : 'a bind list) (env : scope_info sm_envt) =
        match rem_binds with
        | [] -> env, []
        | BBlank _ :: rest -> process_binds rest env
        | BTuple (binds, _) :: rest -> process_binds (binds @ rest) env
        | BName (x, typ, xloc) :: rest ->
          let new_env = StringMap.add x (xloc, None, None) env in
          let newer_env, errs = process_binds rest new_env in
          newer_env, errs
      in
      let rec process_bindings bindings (env : scope_info sm_envt) =
        match bindings with
        | [] -> env, []
        | (b, e, loc) :: rest ->
          let env', errs = process_binds [ b ] env in
          let errs_e = wf_E e env tyenv in
          let env'', errs' = process_bindings rest env' in
          env'', errs @ errs_e @ errs'
      in
      let env2, errs = process_bindings bindings env in
      dupeIds @ errs @ wf_E body env2 tyenv
    | EApp (func, args, native, loc) ->
      let rec_errors = List.concat (List.map (fun e -> wf_E e env tyenv) (func :: args)) in
      (match func with
      | EId (funname, _) ->
        (match StringMap.find_opt funname env with
        | Some (_, _, Some arg_arity) ->
          let actual = List.length args in
          if actual != arg_arity then [ Arity (arg_arity, actual, loc) ] else []
        | _ -> [])
      | _ -> [])
      @ rec_errors
    | EGenApp (func, typs, args, native, loc) ->
      let rec_errors = List.concat (List.map (fun e -> wf_E e env tyenv) (func :: args)) in
      (match func with
      | EId (funname, _) ->
        (match StringMap.find_opt funname env with
        | Some (_, Some typ_arity, Some arg_arity) ->
          let actual_args = List.length args in
          if actual_args != arg_arity
          then [ Arity (arg_arity, actual_args, loc) ]
          else (
            let actual_typs = List.length typs in
            if actual_typs != typ_arity then [ Arity (typ_arity, actual_typs, loc) ] else [])
        | _ -> [])
      | _ -> [])
      @ rec_errors
    | ELetRec (binds, body, _) ->
      let nonfuns =
        List.find_all
          (fun b ->
            match b with
            | BName _, ELambda _, _ -> false
            | _ -> true)
          binds
      in
      let nonfun_errs = List.map (fun (b, _, where) -> LetRecNonFunction (b, where)) nonfuns in
      let rec find_locs x (binds : 'a bind list) : 'a list =
        match binds with
        | [] -> []
        | BBlank _ :: rest -> find_locs x rest
        | BName (y, _, loc) :: rest -> if x = y then loc :: find_locs x rest else find_locs x rest
        | BTuple (binds, _) :: rest -> find_locs x binds @ find_locs x rest
      in
      let rec find_dupes (binds : 'a bind list) : exn list =
        match binds with
        | [] -> []
        | BBlank _ :: rest -> find_dupes rest
        | BName (x, _, def) :: rest -> List.map (fun use -> DuplicateId (x, use, def)) (find_locs x rest)
        | BTuple (binds, _) :: rest -> find_dupes (binds @ rest)
      in
      let dupeIds = find_dupes (List.map (fun (b, _, _) -> b) binds) in
      let rec process_binds (rem_binds : sourcespan bind list) (env : scope_info sm_envt) =
        match rem_binds with
        | [] -> env, []
        | BBlank _ :: rest -> process_binds rest env
        | BTuple (binds, _) :: rest -> process_binds (binds @ rest) env
        | BName (x, typ, xloc) :: rest ->
          let new_env = StringMap.add x (xloc, None, None) env in
          let newer_env, errs = process_binds rest new_env in
          newer_env, errs
      in
      let env, bind_errs = process_binds (List.map (fun (b, _, _) -> b) binds) env in
      let rec process_bindings bindings env =
        match bindings with
        | [] -> env, []
        | (b, e, loc) :: rest ->
          let env, errs = process_binds [ b ] env in
          let errs_e = wf_E e env tyenv in
          let env', errs' = process_bindings rest env in
          env', errs @ errs_e @ errs'
      in
      let new_env, binding_errs = process_bindings binds env in
      let rhs_problems = List.map (fun (_, rhs, _) -> wf_E rhs new_env tyenv) binds in
      let body_problems = wf_E body new_env tyenv in
      nonfun_errs @ dupeIds @ bind_errs @ binding_errs @ List.flatten rhs_problems @ body_problems
    | ELambda (binds, body, _) ->
      let rec dupe x args =
        match args with
        | [] -> None
        | BName (y, _, loc) :: _ when x = y -> Some loc
        | BTuple (binds, _) :: rest -> dupe x (binds @ rest)
        | _ :: rest -> dupe x rest
      in
      let rec process_args rem_args =
        match rem_args with
        | [] -> []
        | BBlank _ :: rest -> process_args rest
        | BName (x, _, loc) :: rest ->
          (match dupe x rest with
          | None -> []
          | Some where -> [ DuplicateId (x, where, loc) ])
          @ process_args rest
        | BTuple (binds, loc) :: rest -> process_args (binds @ rest)
      in
      let rec flatten_bind (bind : sourcespan bind) : (string * scope_info) list =
        match bind with
        | BBlank _ -> []
        | BName (x, _, xloc) -> [ x, (xloc, None, None) ]
        | BTuple (args, _) -> List.concat (List.map flatten_bind args)
      in
      process_args binds @ wf_E body (merge_envs (List.concat (List.map flatten_bind binds)) env) tyenv
  and wf_D d (env : scope_info sm_envt) (tyenv : StringSet.t) =
    match d with
    | DFun (_, args, typ, body, _) ->
      let rec dupe x args =
        match args with
        | [] -> None
        | BName (y, _, loc) :: _ when x = y -> Some loc
        | BTuple (binds, _) :: rest -> dupe x (binds @ rest)
        | _ :: rest -> dupe x rest
      in
      let rec process_args rem_args =
        match rem_args with
        | [] -> []
        | BBlank _ :: rest -> process_args rest
        | BName (x, _, loc) :: rest ->
          (match dupe x rest with
          | None -> []
          | Some where -> [ DuplicateId (x, where, loc) ])
          @ process_args rest
        | BTuple (binds, loc) :: rest -> process_args (binds @ rest)
      in
      let rec arg_env args (env : scope_info sm_envt) =
        match args with
        | [] -> env
        | BBlank _ :: rest -> arg_env rest env
        | BName (name, _, loc) :: rest -> StringMap.add name (loc, None, None) (arg_env rest env)
        | BTuple (binds, _) :: rest -> arg_env (binds @ rest) env
      in
      wf_S tyenv typ @ process_args args @ wf_E body (arg_env args env) tyenv
  and wf_G (g : sourcespan decl list) (env : scope_info sm_envt) (tyenv : StringSet.t) =
    let add_funbind (env : scope_info sm_envt) d =
      match d with
      | DFun (name, args, SForall (tyargs, _, _), _, loc) ->
        StringMap.add name (loc, Some (List.length tyargs), Some (List.length args)) env
    in
    let env = List.fold_left add_funbind env g in
    let errs = List.concat (List.map (fun d -> wf_D d env tyenv) g) in
    errs, env
  and wf_T (tyenv : StringSet.t) (t : sourcespan typ) =
    match t with
    | TyBlank _ -> []
    | TyCon (name, loc) -> if StringSet.mem name tyenv then [] else [ UnboundTyId (name, loc) ]
    | TyArr (args, ret, _) -> List.flatten (List.map (wf_T tyenv) (ret :: args))
    | TyApp (scheme, args, loc) ->
      (if StringSet.mem scheme tyenv then [] else [ UnboundTyId (scheme, loc) ])
      @ List.flatten (List.map (wf_T tyenv) args)
    | TyVar (name, loc) -> if StringSet.mem name tyenv then [] else [ UnboundTyId (name, loc) ]
    | TyTup (args, _) -> List.flatten (List.map (wf_T tyenv) args)
  and wf_S (tyenv : StringSet.t) (s : sourcespan scheme) =
    match s with
    | SForall (args, typ, _) -> wf_T (StringSet.union tyenv (StringSet.of_list args)) typ
  and wf_TD (t : sourcespan tydecl) (tyenv : StringSet.t) =
    match t with
    | TyDecl (name, tyargs, args, _) ->
      let tyenv =
        match tyargs with
        | None -> StringSet.add name tyenv
        | Some tyargs -> StringSet.union (StringSet.add name tyenv) (StringSet.of_list tyargs)
      in
      let errs = List.flatten (List.map (wf_T tyenv) args) in
      errs, tyenv
    (* TODO: wf for defined exceptions *)
    | ExceptionDecl(name, _) -> [], tyenv

  in
  match p with
  | Program (tydecls, decls, body, _) ->
    let initial_env = StringMap.mapi (fun name typ -> get_tag_T typ, None, None) StringMap.empty in
    let initial_env =
      StringMap.fold
        (fun name (scheme, call_type) env ->
          match scheme with
          | SForall (tyargs, TyArr (args, _, _), pos) ->
            StringMap.add name (pos, Some (List.length tyargs), Some (List.length args)) env
          | _ -> raise (InternalCompilerError ("Found non SForall(TyArr) for function " ^ name)))
        (from_bindings TypeCheck.initial_fun_env)
        initial_env
    in
    let rec find name (decls : 'a decl list) =
      match decls with
      | [] -> None
      | DFun (n, args, _, _, loc) :: rest when n = name -> Some loc
      | _ :: rest -> find name rest
    in
    let rec dupe_funbinds decls =
      match decls with
      | [] -> []
      | DFun (name, args, _, _, loc) :: rest ->
        (match find name rest with
        | None -> []
        | Some where -> [ DuplicateFun (name, where, loc) ])
        @ dupe_funbinds rest
    in
    let all_decls = List.flatten decls in
    let helpTD (exns, tyenv) td =
      let td_exns, tyenv = wf_TD td tyenv in
      exns @ td_exns, tyenv
    in
    let initial_tyenv = StringSet.of_list [ "Int"; "Bool" ] in
    let tydecl_errs, initial_tyenv = List.fold_left helpTD ([], initial_tyenv) tydecls in
    let help_G (env, exns) g =
      let g_exns, funbinds = wf_G g env initial_tyenv in
      StringMap.fold StringMap.add funbinds env, exns @ g_exns
    in
    let env, exns = List.fold_left help_G (initial_env, dupe_funbinds all_decls) decls in
    debug_printf "In wf_P: %s\n" (ExtString.String.join ", " (env_keys env));
    let exns = tydecl_errs @ exns @ wf_E body env initial_tyenv in
    (match exns with
    | [] -> Ok p
    | _ -> Error exns)
;;

let rec typeof_bind (b : 'a bind) : 'a typ =
  match b with
  | BBlank (t, _) -> t
  | BName (_, t, _) -> t
  | BTuple (ts, ss) -> TyTup (List.map typeof_bind ts, ss)
;;

(* Recursively extract a typ from the given bind (assumes that the given bind has useful type annotations) *)
let rec extract_typ (b : 'a bind) : 'a typ =
  match b with
  | BTuple (binds, loc) -> TyTup (List.map extract_typ binds, loc)
  | BName (_, t, _) -> t
  | BBlank (t, _) -> t
;;

let desugar (p : sourcespan program) : sourcespan program fallible =
  let gensym =
    let next = ref 0 in
    fun name ->
      next := !next + 1;
      sprintf "%s_%d" name !next
  in
  let rec helpE (e : sourcespan expr) (tyenv : sourcespan scheme envt) : sourcespan expr =
    match e with
    (* If there is an EAnnot around e1, preserve that type information in the let *)
    | ESeq (EAnnot (e1, t, l1), e2, l2) ->
      ELet ([ BBlank (expand_t t tyenv, l1), helpE e1 tyenv, l1 ], helpE e2 tyenv, l2)
    | ESeq (e1, e2, loc) -> ELet ([ BBlank (TyBlank dummy_span, loc), helpE e1 tyenv, loc ], helpE e2 tyenv, loc)
    | EString (s, loc) -> EString(s, loc)
    | ENumber (n, loc) -> ENumber (n, loc)
    | EBool (b, loc) -> EBool (b, loc)
    | EId (n, loc) -> EId (n, loc)
    | EPrim1 (ops, Some typs, e, loc) ->
      EPrim1 (ops, Some (List.map (fun t -> expand_t t tyenv) typs), helpE e tyenv, loc)
    | EPrim1 (ops, None, e, loc) -> EPrim1 (ops, None, helpE e tyenv, loc)
    | EPrim2 (ops, Some typs, e1, e2, loc) ->
      EPrim2 (ops, Some (List.map (fun t -> expand_t t tyenv) typs), helpE e1 tyenv, helpE e2 tyenv, loc)
    | EPrim2 (ops, None, e1, e2, loc) -> EPrim2 (ops, None, helpE e1 tyenv, helpE e2 tyenv, loc)
    | EIf (e1, e2, e3, loc) -> EIf (helpE e1 tyenv, helpE e2 tyenv, helpE e3 tyenv, loc)
    | EApp (fn, args, call_type, loc) -> EApp (helpE fn tyenv, List.map (fun e -> helpE e tyenv) args, call_type, loc)
    | EGenApp (fn, typs, args, call_type, loc) ->
      EGenApp
        ( helpE fn tyenv
        , List.map (fun t -> expand_t t tyenv) typs
        , List.map (fun e -> helpE e tyenv) args
        , call_type
        , loc )
    | EAnnot (e, t, loc) -> EAnnot (helpE e tyenv, expand_t t tyenv, loc)
    | ENil (t, loc) -> ENil (expand_t t tyenv, loc)
    | ELet (bindings, expr, loc) ->
      let binds = List.map (fun b -> helpBinding b tyenv) bindings in
      ELet (List.flatten binds, helpE expr tyenv, loc)
    | ETuple (exprs, loc) -> ETuple (List.map (fun e -> helpE e tyenv) exprs, loc)
    | EGetItem (expr, idx, len, loc) -> EGetItem (helpE expr tyenv, idx, len, loc)
    | ESetItem (expr, idx, len, new_val, loc) -> ESetItem (helpE expr tyenv, idx, len, helpE new_val tyenv, loc)
    | ELambda (args, e, loc) ->
      let dsed_args, dsed_new_binds_2d = List.split (List.map (fun a -> helpDeclArg a tyenv) args) in
      let dsed_new_binds = List.flatten dsed_new_binds_2d in
      let dsing_body = if List.length dsed_new_binds > 0 then ELet (dsed_new_binds, e, loc) else e in
      ELambda (dsed_args, helpE dsing_body tyenv, loc)
    | ELetRec (bindings, body, loc) ->
      let binds = List.map (fun b -> helpBinding b tyenv) bindings in
      ELetRec (List.flatten binds, helpE body tyenv, loc)
    | ETryCatch(e1, n, e2, loc) -> ETryCatch(helpE e1 tyenv, n, helpE e2 tyenv, loc)
    | EThrow(n, loc) -> EThrow(n, loc)
  and helpBindsFlatten (tuplebind : string) (binds : sourcespan bind list) (tyenv : sourcespan scheme envt)
      : sourcespan binding list
    =
    let ncomponents = List.length binds in
    List.flatten
      (List.mapi
         (fun i subb ->
           match subb with
           | BBlank (_, _) -> []
           | BName (n, t, ss) ->
             [ BName (n, expand_t t tyenv, ss), EGetItem (EId (tuplebind, ss), i, ncomponents, ss), ss ]
           | BTuple (subbinds, ss) ->
             let subname = sprintf "%s_%d" tuplebind i in
             let tuple_type = typeof_bind subb in
             let tuplebind =
               BName (subname, expand_t tuple_type tyenv, ss), EGetItem (EId (tuplebind, ss), i, ncomponents, ss), ss
             in
             tuplebind :: helpBindsFlatten subname subbinds tyenv)
         binds)
  and helpBinding (b : sourcespan binding) (tyenv : sourcespan scheme envt) : sourcespan binding list =
    match b with
    | BBlank (t, l1), e, l2 -> [ BBlank (expand_t t tyenv, l1), helpE e tyenv, l2 ]
    | BName (n, t, l1), e, l2 -> [ BName (n, expand_t t tyenv, l1), helpE e tyenv, l2 ]
    (* If the expression references a variable, no need to create a new variable *)
    | BTuple (binds, _), EId (var_name, _), l2 -> helpBindsFlatten var_name binds tyenv
    (* otherwise create a new variable and try to conjure a type from the annotations on the binds *)
    | (BTuple (binds, _) as bt), e, l2 ->
      let tuple_bind_name = gensym "gen#untuple" in
      (BName (tuple_bind_name, expand_t (extract_typ bt) tyenv, dummy_span), e, l2)
      :: helpBindsFlatten tuple_bind_name binds tyenv
  and helpDeclArg (arg : sourcespan bind) (tyenv : sourcespan scheme envt) : sourcespan bind * sourcespan binding list =
    let argty = typeof_bind arg in
    match arg with
    | BBlank (_, _) -> arg, []
    | BName (_, _, _) -> arg, []
    | BTuple (binds, ss) ->
      let tuple_bind_name = gensym "gen#untuple_arg" in
      BName (tuple_bind_name, expand_t argty tyenv, ss), helpBindsFlatten tuple_bind_name binds tyenv
  and generate_init_tyenv (tyds : sourcespan tydecl list) (tyenv : sourcespan scheme envt) : sourcespan scheme envt =
    match tyds with
    | TyDecl (name, generics, typs, loc) :: rest ->
      let generics_list =
        match generics with
        | Some l -> l
        | None -> []
      in
      let new_tyenv_elem = name, SForall (generics_list, TyTup (List.map (fun t -> expand_t t tyenv) typs, loc), loc) in
      let new_tyenv = new_tyenv_elem :: tyenv in
      generate_init_tyenv rest new_tyenv
    | ExceptionDecl _ :: rest -> generate_init_tyenv rest tyenv 
    | [] -> tyenv
  and expand_t (t : sourcespan typ) (tyenv : sourcespan scheme envt) : sourcespan typ =
    match t with
    | TyCon ("Int", _) -> t
    | TyCon ("Bool", _) -> t
    | TyCon (t_name, t_loc) ->
      (match tyenv with
      | (name, SForall (_, typ, _)) :: rest when t_name = name -> typ
      | (name, SForall _) :: rest -> expand_t t rest
      | [] -> raise (UnboundTyId (t_name, t_loc)))
    | TyArr (lhs, rhs, loc) -> TyArr (List.map (fun t -> expand_t t tyenv) lhs, expand_t rhs tyenv, loc)
    | TyTup (tps, loc) -> TyTup (List.map (fun t -> expand_t t tyenv) tps, loc)
    | TyApp (typ_name, instantiations, loc) ->
      let typ_scheme = List.assoc typ_name tyenv in
      let (SForall (generics, typ, _)) = typ_scheme in
      if List.length generics != List.length instantiations
      then raise (BadTypeAppTyDecl (typ_name, loc, List.length generics, List.length instantiations))
      else (
        let generic_to_typ g =
          match g with
          | TyVar (gs, _) -> List.assoc gs (List.combine generics instantiations)
          | (TyCon _ | TyBlank _ | TyTup _) as t -> t
          | t ->
            raise
              (InternalCompilerError
                 (sprintf "Argument to function was not a concrete type or a type variable: %s" (string_of_typ t)))
        in
        match typ with
        | TyCon _ | TyBlank _ | TyVar _ | TyApp _ ->
          raise (InternalCompilerError "Found type generics (TyApp) on a non-(TyTup | TyArr)")
        | TyTup (typs, loc) -> TyTup (List.map generic_to_typ typs, loc)
        | TyArr (lhs, rhs, loc) -> TyArr (List.map generic_to_typ lhs, generic_to_typ rhs, loc))
    | TyBlank _ | TyVar _ -> t
  and desugar_decls_to_lambdas (groups : sourcespan decl list list) (body : sourcespan expr) : sourcespan expr =
    let group_to_letrec (g : sourcespan decl list) (body : sourcespan expr) =
      let bindings : sourcespan binding list =
        List.map
          (fun (d : sourcespan decl) ->
            let (DFun (fn, args, _, body, loc)) = d in
            BName (fn, TyBlank dummy_span, dummy_span), ELambda (args, body, dummy_span), loc)
          g
      in
      ELetRec (bindings, body, dummy_span)
    in
    match groups with
    | g :: rest -> group_to_letrec g (desugar_decls_to_lambdas rest body)
    | [] -> body
  and add_native_funcs (body : sourcespan expr) : sourcespan expr =
    let bindings =
      List.filter_map
        (fun (name, (scheme, call_type)) ->
          if call_type = Native
          then (
            let snake_name = List.nth (String.split_on_char '#' name) 1 in
            let num_args =
              match scheme with
              | SForall (_, TyArr (lhs, _, _), _) -> List.length lhs
              | _ -> raise (InternalCompilerError "Found non-TyArr for a Native function TypeCheck.initial_fun_env")
            in
            let all_possible_arg_names = [ "a"; "b"; "c"; "d"; "e"; "f" ] in
            if num_args > List.length all_possible_arg_names
            then
              raise
                (InternalCompilerError
                   (sprintf
                      "Native function requires %d args which is more than the 6 args supported for native functions"
                      num_args));
            let args = list_truncate all_possible_arg_names num_args in
            let bargs = List.map (fun s -> BName (s, TyBlank dummy_span, dummy_span)) args in
            let iargs = List.map (fun s -> EId (s, dummy_span)) args in
            Some
              ( BName (snake_name, TyBlank dummy_span, dummy_span)
              , ELambda (bargs, EApp (EId (name, dummy_span), iargs, Native, dummy_span), dummy_span)
              , dummy_span ))
          else None)
        TypeCheck.initial_fun_env
    in
    ELet (bindings, body, dummy_span)
  in
  match p with
  | Program (tydecls, decls, body, loc) ->
  global_defined_exns := List.flatten (List.map (fun (d) -> match d with | TyDecl _ -> [] | ExceptionDecl(n, _) -> [n]) tydecls); 
    (try
       let init_tyenv = generate_init_tyenv tydecls [] in
       let body' = desugar_decls_to_lambdas decls body in
       let body'' = add_native_funcs body' in
       Ok (Program ([], [], helpE body'' init_tyenv, loc))
     with
    | exn -> Error [ exn ])
;;

let freevars (e : 'a cexpr) : string list =
  let rec freevars_c (e : 'a cexpr) (known_variables : string list) : string list =
    match e with
    | CIf (cond, thn, els, _) ->
      freevars_i cond known_variables @ freevars_a thn known_variables @ freevars_a els known_variables
    | CPrim1 (_, body, _) -> freevars_i body known_variables
    | CPrim2 (_, lhs, rhs, _) -> freevars_a lhs known_variables @ freevars_a rhs known_variables
    | CImmExpr body -> freevars_i body known_variables
    | CApp (func, args, _, _) ->
      freevars_i func known_variables @ List.flatten (List.map (fun a -> freevars_i a known_variables) args)
    | CTuple (parts, _) -> List.flatten (List.map (fun a -> freevars_i a known_variables) parts)
    | CGetItem (lhs, _, _) -> freevars_i lhs known_variables
    | CSetItem (lhs, _, rhs, _) -> freevars_i lhs known_variables @ freevars_i rhs known_variables
    | CLambda (args, body, _) -> freevars_a body (known_variables @ args)
    | CString _ -> [] 
    | CTryCatch(e1, n, e2, _) -> freevars_a e1 known_variables @ freevars_a e2 known_variables
    | CThrow _ -> [] 
  and freevars_a (e : 'a aexpr) (known_variables : string list) : string list =
    match e with
    | ALet (n, v, body, _) -> freevars_c v known_variables @ freevars_a body (n :: known_variables)
    | ASeq (e1, e2, _) -> freevars_c e1 known_variables @ freevars_a e2 known_variables
    | ACExpr c -> freevars_c c known_variables
    | ALetRec (defs, body, _) ->
      let new_known_variables = List.map (fun (a, _) -> a) defs @ known_variables in
      let function_free_vars = List.flatten (List.map (fun (_, c) -> freevars_c c new_known_variables) defs) in
      function_free_vars @ freevars_a body new_known_variables
  and freevars_i (e : 'a immexpr) (known_variables : string list) : string list =
    match e with
    | ImmBool _ | ImmNil _ | ImmNum _ -> []
    | ImmId (x, _) -> if List.mem x known_variables then [] else [ x ]
  in
  let rec remove_duplicates (l : string list) : string list =
    match l with
    | x :: rest -> if List.mem x rest then remove_duplicates rest else x :: remove_duplicates rest
    | [] -> []
  in
  remove_duplicates (freevars_c e [])
;;

let rec set_subtraction (l1 : string list) (l2 : string list) : string list =
  match l1 with
  | f :: rest -> if List.mem f l2 then set_subtraction rest l2 else f :: set_subtraction rest l2
  | [] -> []
;;

(* Compile the given aexpr to a list of instructions *)
let rec compile_aexpr
    (* The expr to compile *)
      (e : tag aexpr)
    (* The next unused stack index *)
      (si : int)
    (* The environment mapping from variable name to arg *)
      (env : arg envt)
    (* The number of arguments passed to the current function (zero if not in a function) *)
      (num_args : int)
    (* Whether or not the type checker has run and approved the given code *)
      (was_typechecked : bool)
    : instruction list
  =
  (* Returns a list of instructions *)
  match e with
  | ALet ("_", var_val, body, _) ->
    [ ILineComment "A blank binding:" ]
    @ compile_cexpr var_val si env num_args was_typechecked
    @ [ ILineComment "The body of the blank binding:" ]
    @ compile_aexpr body si env num_args was_typechecked
  | ALet (var_name, var_val, body, _) ->
    let prelude = compile_cexpr var_val (si + 1) env num_args was_typechecked in
    let stack_reg = RegOffset (~-si, RBP) in
    let body = compile_aexpr body (si + 1) ((var_name, stack_reg) :: env) num_args was_typechecked in
    prelude
    @ [ IInstrComment (IMov (stack_reg, Reg RAX), sprintf "%s holds the variable %s" (arg_to_asm stack_reg) var_name) ]
    @ body
  | ACExpr cexpr -> compile_cexpr cexpr si env num_args was_typechecked
  | ASeq (e1, e2, _) ->
    compile_cexpr e1 si env num_args was_typechecked @ compile_aexpr e2 si env num_args was_typechecked
  | ALetRec (_, _, _) -> compile_letrec e si env num_args was_typechecked []

(* Generate the instructions necessary to setup the stack for the given aexpr to run*)
and generate_stack_setup (e : 'a aexpr) (additional_space : int) (check_stack_space : bool) : instruction list =
  let num_vars = count_vars e + additional_space in
  let stack_size = round_up_to_multiple_of_16 (num_vars * word_size) in
  (if check_stack_space
  then
    [ ILineComment "Make sure we have space left on the stack:"
    ; IMov (Reg reserved_temp_register_1, Reg RBP)
    ; ISub (Reg reserved_temp_register_1, Const (Int64.of_int stack_size))
    ; IMov (Reg reserved_temp_register_2, LabelContents "STACK_BOTTOM")
    ; ISub (Reg reserved_temp_register_2, LabelContents "STACK_SIZE")
    ; ICmp (Reg reserved_temp_register_1, Reg reserved_temp_register_2)
    ; CMovle (Reg RSI, Reg reserved_temp_register_1)
    ; IJle (Label assertion_failed_out_of_stack_memory)
    ]
  else [])
  (* We set up the stack via simply using the IEnter instruction which automatically manages RSP and RBP *)
  @ [ IEnter (stack_size, 0) ]
  (* We increment the depth of all the exception handlers so that we can properly unwind the stack when handling
   * nested exceptions *)
   @  compile_native_call "increment_exn_depths" []
  (* And for debugging purposes we want all the stack registers to be zeroed out, so mov 0 into all of them *)
  @
  if stack_size > 0
  then
    List.map
      (fun n ->
        IInstrComment (IMov (Sized (QWORD_PTR, RegOffset (~-n, RBP)), Sized (QWORD_PTR, Const 0L)), "Zero out the stack"))
      (range (stack_size / word_size))
  else []

(* Helper method for compiling letrec expressions *)
and compile_letrec
    (* The expression to compile (must be a letrec) *)
      (e : tag aexpr)
    (* The next available stack index to use *)
      (si : int)
    (* The current environment *)
      (env : arg envt)
    (* The number of args passed to the current function *)
      (num_args : int)
    (* Whether or not this code was typechecked *)
      (was_typechecked : bool)
    (* An association list from function name to the slot on the heap that should be filled 
     * in with that function's tagged value. Can contain duplicate function names. *)
      (slots_to_be_filled : (string * arg) list)
    : instruction list
  =
  match e with
  | ALetRec ((name, lam) :: rest_bindings, body, tag) ->
    (* The names of functions later on that need to have space reserved in lam: *)
    let reserved_names = List.map (fun (n, _) -> n) rest_bindings in
    (* The locations that lam needs to place itself into after compiling lam *)
    let _, slots_to_be_filled_by_lam = List.split (List.filter (fun (n, l) -> n = name) slots_to_be_filled) in
    (* The code, the size of lam, and the slots that lam needs filled when we compile rest_bindings *)
    let lam_compiled, heap_size, additional_slots_to_be_filled =
      compile_lam_helper lam env was_typechecked slots_to_be_filled_by_lam reserved_names (Some name)
    in
    (* The register to place lam into *)
    let stack_reg = RegOffset (~-si, RBP) in
    (* Update the slots to be filled by subtracting the heap size of lam from every offset *)
    let updated_slots_to_be_filled : (string * arg) list =
      List.map
        (fun (name, arg) ->
          match arg with
          | RegOffset (os, reg) -> name, RegOffset (os - heap_size, reg)
          | _ -> raise (InternalCompilerError "Found non-RegOffset while incrementing heap offsets in compile_letrec"))
        (slots_to_be_filled @ additional_slots_to_be_filled)
    in
    (* Compile the rest  *)
    let rest_compiled =
      compile_letrec
        (ALetRec (rest_bindings, body, tag))
        (si + 1)
        ((name, stack_reg) :: env)
        num_args
        was_typechecked
        updated_slots_to_be_filled
    in
    (* And turn it into actual code *)
    lam_compiled @ [ IInstrComment (IMov (stack_reg, Reg RAX), "Store letrec-ed function " ^ name) ] @ rest_compiled
  | ALetRec ([], body, tag) -> compile_aexpr body si env num_args was_typechecked
  | ASeq _ | ALet _ | ACExpr _ -> raise (InternalCompilerError "compile_letrec called on non-ALetRec")

(* Helper method to compile CLambas that handles both recursive and non-recursive lambda compilation *)
and compile_lam_helper
    (* The cexpr that is a CLambda to compile *)
      (e : tag cexpr)
    (* The environment to compile it in  *)
      (env : arg envt)
    (* Whether or not the given program has been type checked *)
      (was_typechecked : bool)
    (* A list of other locations to move this lambda into after the lambda has been defined *)
      (other_locations : arg list)
    (* A list of reserved argument names that the lambda will close over and space should be allocated for on the heap *)
      (reserved_args : string list)
    (* Whether or not this CLambda should close over itself. If so, allow this function to call itself by including the 
    * provided string in the env when compiling the body of the lambda *)
      (close_over_self : string option)
    : instruction list * int * (string * arg) list
  =
  match e with
  | CLambda (args, body, tag) ->
    (* Labels used for the lambda: *)
    let end_label = sprintf "lambda_end_%d" tag in
    let lambda_label = sprintf "lambda_%d" tag in
    (* The location of this function on the stack (by our calling convention functions
     * are always passed as the last argument to themselves) *)
    let self_location = get_fn_arg_asm (List.length args) in
    (* The free variables in the body of the lambda (doesn't include reserved_args or self) *)
    let free_vars =
      set_subtraction
        (set_subtraction (freevars e) reserved_args)
        (List.map (fun (n, _) -> n) TypeCheck.initial_fun_env
        @
        match close_over_self with
        | Some n -> [ n ]
        | None -> [])
    in
    (* The new argument environment with all the stack locations that will be used in the body *)
    let new_arg_env =
      List.mapi (fun i arg -> arg, get_fn_arg_asm i) args
      @ List.mapi (fun i fv -> fv, RegOffset (~-(i + 1), RBP)) free_vars
      @ List.mapi (fun i rv -> rv, RegOffset (~-(i + 1 + List.length free_vars), RBP)) reserved_args
    in
    (* And add self to it if supplied  *)
    let new_arg_env =
      match close_over_self with
      | Some n -> (n, self_location) :: new_arg_env
      | None -> new_arg_env
    in
    (* Calculate the size of the lambda on the heap *)
    let used_heap_slots = 3 + List.length free_vars + List.length reserved_args in
    let used_heap_slots = used_heap_slots + Int.rem used_heap_slots 2 in
    let function_size_on_heap = Int64.of_int (used_heap_slots * word_size) in
    (* And the locations of the reserved arguments on the heap *)
    let reserved_arg_heap_locations =
      List.mapi (fun i rv -> RegOffset (i + 3 + List.length free_vars, R15)) reserved_args
    in
    let code =
      [ ILineComment (sprintf "Define lambda-%d {" tag); IJmp (Label end_label); ILabel lambda_label ]
      @ generate_stack_setup body (List.length (free_vars @ reserved_args)) true
      @ [ ILineComment
            "Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {"
        ; IInstrComment
            ( IMov (Reg RAX, self_location)
            , "Move the last argument of the function which is the function itself into RAX so we "
              ^ "can unpack closed over values" )
        ; IInstrComment
            ( ISub (Reg RAX, HexConst closure_tag)
            , "And detag it. Our compiler guarantees that it will be a lambda so no need to tag check" )
        ]
      @ List.flatten
          (List.mapi
             (fun i fv ->
               [ IMov (Reg reserved_temp_register_1, RegOffset (i + 3, RAX))
               ; IInstrComment
                   ( IMov (List.assoc fv new_arg_env, Reg reserved_temp_register_1)
                   , "Holds the closed over variable: " ^ fv )
               ])
             (free_vars @ reserved_args))
      @ [ ILineComment "} Copy the free variables off the heap onto the stack" ]
      (* And then compile the actual body *)
      @ compile_aexpr body (List.length (free_vars @ reserved_args) + 1) new_arg_env (List.length args) was_typechecked
      (* After we finish executing the body, we need to decrement our counter of the number of stack frames in order
       * to properly support unwinding the stack for exceptions *)
      @ [IMov(Reg reserved_temp_register_1, Reg RAX)]
      @ compile_native_call "decrement_exn_depths" []
      @ [ IMov(Reg RAX, Reg reserved_temp_register_1)
        ; ILeave
        ; IRet
        ; ILineComment (sprintf "} define lambda-%d" tag)
        ; ILabel end_label
        ; ILineComment
            (sprintf "Check if we have space on the heap to store our function of size %Ld: " function_size_on_heap)
        ]
      @ reserve function_size_on_heap tag
      @ [ ILineComment (sprintf "Store lambda-%d on the heap {" tag)
          (* We store the arity and number of closed over variables as snake integers *)
        ; IInstrComment
            ( IMov
                ( Sized (QWORD_PTR, RegOffset (0, reserved_heap_reg))
                , int64_to_snake_int (Int64.of_int (List.length args)) )
            , "Store the arity" )
        ; IInstrComment
            ( IMov (Sized (QWORD_PTR, RegOffset (1, reserved_heap_reg)), Label lambda_label)
            , "Store the function pointer" )
        ; IInstrComment
            ( IMov
                ( Sized (QWORD_PTR, RegOffset (2, reserved_heap_reg))
                , int64_to_snake_int (Int64.of_int (List.length free_vars + List.length reserved_args)) )
            , "Store the number of closed variables" )
        ; ILineComment "Store all the closed over variables {"
        ]
      @ List.flatten
          (List.mapi
             (fun i var_name ->
               [ IInstrComment
                   (IMov (Reg reserved_temp_register_1, List.assoc var_name env), sprintf "Store %s" var_name)
               ; IMov (Sized (QWORD_PTR, RegOffset (3 + i, reserved_heap_reg)), Reg reserved_temp_register_1)
               ])
             free_vars)
      @ List.flatten
          (List.map
             (fun (loc, rv) ->
               [ IInstrComment
                   (IMov (Sized (QWORD_PTR, loc), Const 24690L), "reserved space, will be filled in with: " ^ rv)
               ])
             (List.combine reserved_arg_heap_locations reserved_args))
      @ [ ILineComment "} Store all the closed over variables"
        ; IInstrComment (IMov (Reg RAX, Reg reserved_heap_reg), "Move the address of the tuple into RAX")
        ; IInstrComment (IAdd (Reg RAX, HexConst closure_tag), "Tag it as a closure")
        ]
      @ List.map
          (fun loc -> IInstrComment (IMov (loc, Reg RAX), "Fill in the gap in a previously defined lambda"))
          other_locations
      @ [ IInstrComment (IAdd (Reg reserved_heap_reg, Const function_size_on_heap), "Bump the heap register")
        ; ILineComment (sprintf "} store lambda-%d" tag)
        ]
    in
    code, used_heap_slots, List.combine reserved_args reserved_arg_heap_locations
  | CIf _ | CPrim1 _ | CPrim2 _ | CTuple _ | CImmExpr _ | CApp _ | CGetItem _ | CSetItem _ | CString _ ->
    raise (InternalCompilerError "compile_lam_helper called on a non-CLambda")

(* Compile the given cexpr to a list of instructions *)
and compile_cexpr (e : tag cexpr) (si : int) (env : arg envt) (num_args : int) (was_typechecked : bool)
    : instruction list
  =
  match e with
  | CString(s, tag) -> 
  let string_size_on_heap = Int64.of_int (round_up_to_multiple_of_16 (String.length s + 1)) in 
  let explode s = List.init (String.length s) (String.get s) in 
  [ ILineComment (sprintf "Allocate space for the string '%s' on the heap:" s)]
  @ reserve string_size_on_heap tag 
  @ [ILineComment (sprintf "And put it on the heap:")]
  @ List.flatten (List.mapi (fun i (char) -> [
    IMov(Sized(BYTE_PTR, RegByteOffset(i, reserved_heap_reg)), Const(Int64.of_int (Char.code char)))
  ]) (explode s))
  @ [ IMov(Sized(BYTE_PTR, RegByteOffset(String.length s, reserved_heap_reg)), Const(0L))
    ; ILineComment "Then tag it and move it to RAX"; IMov (Reg RAX, Reg reserved_heap_reg)
      ; IAdd (Reg RAX, HexConst string_tag)
      ; IAdd (Reg reserved_heap_reg, Const string_size_on_heap)
      ]
  | CIf (cond, thn, els, tag) ->
    let else_label = sprintf "if_false_%d" tag in
    let done_label = sprintf "done_%d" tag in
    [ IMov (Reg RAX, compile_imm cond env) ]
    @ compile_assert_is_bool (Reg RAX) assertion_failed_if_not_bool was_typechecked
    @ [ ICmp (Reg RAX, const_true); IJne (Label else_label) ]
    @ compile_aexpr thn si env num_args was_typechecked
    @ [ IJmp (Label done_label); ILabel else_label ]
    @ compile_aexpr els si env num_args was_typechecked
    @ [ ILabel done_label ]
  | CPrim1 _ -> compile_prim1 e si env num_args was_typechecked
  | CPrim2 _ -> compile_prim2 e si env num_args was_typechecked
  | CApp _ -> compile_fun_app e env was_typechecked
  | CImmExpr e -> [ IMov (Reg RAX, compile_imm e env) ]
  | CTuple (exprs, tag) ->
    let tuple_size_on_heap = Int64.of_int (round_up_to_multiple_of_16 ((List.length exprs + 1) * 8)) in
    [ ILineComment (sprintf "Check if we have space on the heap to store our tuple of size %Ld: " tuple_size_on_heap) ]
    @ reserve tuple_size_on_heap tag
    @ [ ILineComment "Creating a tuple: "
      ; IInstrComment
          ( IMov
              ( Sized (QWORD_PTR, RegOffset (0, reserved_heap_reg))
              , int64_to_snake_int (Int64.of_int (List.length exprs)) )
          , "tuple size" )
      ]
    @ List.flatten
        (List.mapi
           (fun i e ->
             [ IMov (Sized (QWORD_PTR, Reg RAX), Sized (QWORD_PTR, compile_imm e env))
             ; IMov (Sized (QWORD_PTR, RegOffset (i + 1, reserved_heap_reg)), Sized (QWORD_PTR, Reg RAX))
             ])
           exprs)
    @ [ IMov (Reg RAX, Reg reserved_heap_reg)
      ; IAdd (Reg RAX, HexConst tuple_tag)
      ; IAdd (Reg reserved_heap_reg, Const tuple_size_on_heap)
      ]
  | CGetItem (expr, idx, tag) ->
    [ IMov (Reg RAX, compile_imm expr env) ]
    @ compile_assert_is_tuple (Reg RAX) assertion_failed_not_tuple was_typechecked
    @
    if idx < 0
    then
      [ ILineComment "At compile time the idx was too small, so hard code the error"
      ; IMov (Reg RSI, Const (Int64.of_int idx))
      ; IJmp (Label assertion_failed_get_index_too_small)
      ]
    else
      [ IInstrComment (ISub (Reg RAX, HexConst tuple_tag), "detag")
      ; ILineComment (sprintf "Check if the tuple is nil")
      ; ICmp (Reg RAX, HexConst 0L)
      ; IJe (Label assertion_failed_index_nil)
      ; ILineComment (sprintf "Check if the idx %d is too large:" idx)
      ; ICmp (Sized (QWORD_PTR, RegOffset (0, RAX)), int64_to_snake_int (Int64.of_int idx))
      ; CMovle (Reg RSI, Const (Int64.of_int idx))
      ; IJle (Label assertion_failed_get_index_too_large)
      ; ILineComment (sprintf "Get the %d-th item from the tuple: " idx)
      ; IMov (Reg RAX, RegOffset (idx + 1, RAX))
      ]
  | CSetItem (tup, idx, new_val, tag) ->
    [ IMov (Reg RAX, compile_imm tup env) ]
    @ compile_assert_is_tuple (Reg RAX) assertion_failed_not_tuple was_typechecked
    @
    if idx < 0
    then
      [ ILineComment "At compile time the idx was too small, so hard code the error"
      ; IMov (Reg RSI, Const (Int64.of_int idx))
      ; IJmp (Label assertion_failed_get_index_too_small)
      ]
    else
      [ IInstrComment (ISub (Reg RAX, HexConst tuple_tag), "detag")
      ; ILineComment (sprintf "Check if the tuple is nil")
      ; ICmp (Reg RAX, HexConst 0L)
      ; IJe (Label assertion_failed_index_nil)
      ; ILineComment (sprintf "Check if the idx %d is too large:" idx)
      ; ICmp (Sized (QWORD_PTR, RegOffset (0, RAX)), int64_to_snake_int (Int64.of_int idx))
      ; CMovle (Reg RSI, Const (Int64.of_int idx))
      ; IJle (Label assertion_failed_get_index_too_large)
      ; ILineComment (sprintf "Set the %d-th item from the tuple: " idx)
      ; IMov (Reg reserved_temp_register_1, compile_imm new_val env)
      ; IMov (RegOffset (idx + 1, RAX), Reg reserved_temp_register_1)
      ; IMov (Reg RAX, compile_imm tup env)
      ]
  | CLambda (args, body, tag) ->
    let code, _, _ = compile_lam_helper e env was_typechecked [] [] None in
    code
 | CTryCatch (body, exn, catch, tag) ->
   let catch_start = sprintf "trycatch_start_%d" tag in
   let catch_end = sprintf "trycatch_end_%d" tag in
   (* Add this exception handler to the exception handler table before running the body *)
   compile_native_call "add_to_exn_table" [ compile_exn exn; Label catch_start ]
   @ compile_aexpr body si env num_args was_typechecked
   (* After running the body, we stash RAX, clear this exception handler, and restore RAX *)
   @ [ IMov (Reg reserved_temp_register_1, Reg RAX) ]
   @ compile_native_call "clear_from_exn_table" [ Label catch_start ]
   @ [ IMov (Reg RAX, Reg reserved_temp_register_1)
     (* The body executed without error so jump past the exception handler *)
     ; IJmp (Label catch_end)
     ; ILabel catch_start ]
   (* Before we start executing the exception handler itself, we clear itself from the table
    * so that exception handlers don't catch exceptions that they themselves throw *) 
   @ compile_native_call "clear_from_exn_table" [ Label catch_start ]
   @ compile_aexpr catch si env num_args was_typechecked
   @ [ ILabel catch_end ]

 | CThrow (exn, tag) ->
   let done_leaving = sprintf "cthrow_done_leaving_%d" tag in
   let loop_start = sprintf "cthrow_loop_start_%d" tag in
   (* Get the depth of the handler by calling into the runtime *) 
   compile_native_call "get_exn_depth" [ compile_exn exn ]
   (* A small assembly gadget to `leave` n times *) 
   @ [ ILabel loop_start
     ; ICmp (Reg RAX, Const 0L)
     ; IJe (Label done_leaving)
     ; ILeave
     (* After each leave instruction, we need to decrement the depths of all the handlers
      * to keep the table of depths up to date. Stash RAX so it doesn't get clobbered. *)
     ; IMov (Reg reserved_temp_register_1, Reg RAX)]
   @ compile_native_call "decrement_exn_depths" []
   @ [ IMov (Reg RAX, Reg reserved_temp_register_1)
     ; ISub (Reg RAX, Const 1L)
     ; IJmp (Label loop_start)
     ; ILabel done_leaving
     ]
   (* Once we have left enough stack frames, we're almost ready to jump. But before we can
    * jump we need to clear all of the exception handlers that we are jumping "over". For 
    * example, if there are two nested exception handlers and we are jumping to the outer
    * one, we need to clear the inner one to ensure it is no longer in effect. Since we only
    * ever append to our list of exception handlers, this can be done simply by clearing
    * all exception handlers from the end of the list to exn. This code lives in the 
    * runtime. *) 
   @ compile_native_call "clear_exn_table_before_jmp" [ compile_exn exn ]
   (* And then finally, we can just jump straight to the exception handler (aka the
    * "trycatch_start_%d" label from above) and resume execution directly *) 
   @ compile_native_call "get_exn_location" [ compile_exn exn ]
   @ [ IJmp (Reg RAX) ]

(* Compile the given immexpr to a list of instructions *)
and compile_imm (e : tag immexpr) (env : arg envt) : arg =
  match e with
  | ImmNum (n, _) -> Const (Int64.shift_left n 1)
  | ImmBool (true, _) -> const_true
  | ImmBool (false, _) -> const_false
  | ImmId (x, _) -> find env x
  | ImmNil _ -> const_nil

and compile_exn (exn: string) : arg = 
  let rec find x lst =
    match lst with
    | [] -> raise (InternalCompilerError (sprintf "Failed to find exception %s" x))
    | first :: rest -> if x = first then 0 else 1 + find x rest
  in Const (Int64.of_int (find exn !global_defined_exns))

(* Compile the given cexpr which must be a prim1 to a list of instructions *)
and compile_prim1 (e : tag cexpr) (si : int) (env : arg envt) (num_args : int) (was_typechecked : bool)
    : instruction list
  =
  match e with
  | CPrim1 (((Add1 | Sub1) as op), body, tag) ->
    [ IMov (Reg RAX, compile_imm body env) ]
    @ compile_assert_is_int (Reg RAX) assertion_failed_arith_not_num was_typechecked
    @ [ ILineComment "add1(...)"
      ; (match op with
        | Add1 -> IAdd (Reg RAX, int64_to_snake_int 1L)
        | Sub1 -> ISub (Reg RAX, int64_to_snake_int 1L)
        | err ->
          raise
            (InternalCompilerError
               (sprintf "Found a not add1/sub1 while compiling an add1/sub1: %s" (string_of_op1 err))))
      ; IJo (Label overflow_label)
      ]
  | CPrim1 (IsBool, body, tag) ->
    (* Note that we have to use branching here since we want to verify that it is bool where a bool
       is either 0x7FFF...FFF or 0xFFF...FFF *)
    let found_bool = sprintf "_is_bool_found_bool_%d" tag in
    let done_label = sprintf "_is_bool_done_%d" tag in
    [ IMov (Reg RAX, compile_imm body env)
    ; ILineComment "IsBool(...)"
    ; ICmp (Reg RAX, const_true)
    ; IJe (Label found_bool)
    ; ICmp (Reg RAX, const_false)
    ; IJe (Label found_bool)
    ; IMov (Reg RAX, const_false)
    ; IJmp (Label done_label)
    ; ILabel found_bool
    ; IMov (Reg RAX, const_true)
    ; ILabel done_label
    ]
  | CPrim1 (IsNum, body, tag) ->
    [ IMov (Reg RAX, compile_imm body env) ]
    @ (* Bit shifting hacks! Anding with 1 guarantees that only the LSB remains
       * set, then XORing it flips the bit. Shifting left by 63 means the MSB 
       * now may or may not be set. The MSB will be set if it is a number, 
       * otherwise it will not be set. And then ORing with 0x7fff..fff sets 
       * all the other bits to 1 which yields a snake boolean. *)
    [ ILineComment "IsNum(...)"
    ; IAnd (Reg RAX, HexConst num_tag_mask)
    ; IXor (Reg RAX, HexConst num_tag_mask)
    ; IShl (Reg RAX, Const 63L)
    ; IOr (Reg RAX, const_false)
    ]
  | CPrim1 (IsTuple, body, tag) ->
    let true_label = sprintf "is_tuple_true_%d" tag in
    let done_label = sprintf "is_tuple_done_%d" tag in
    [ IMov (Reg RAX, compile_imm body env)
    ; ILineComment "IsBool(...)"
    ; IShl (Reg RAX, Const 61L)
    ; IShr (Reg RAX, Const 61L)
    ; ICmp (Reg RAX, HexConst tuple_tag)
    ; IMov (Reg RAX, const_false)
    ; IJe (Label true_label)
    ; IJmp (Label done_label)
    ; ILabel true_label
    ; IMov (Reg RAX, const_true)
    ; ILabel done_label
    ]
  | CPrim1 (Not, body, tag) ->
    [ IMov (Reg RAX, compile_imm body env) ]
    @ compile_assert_is_bool (Reg RAX) assertion_failed_logic_not_bool was_typechecked
    (* We implement not by XORing with 0x800... which flips the MSB *)
    @ [ ILineComment "not(...)"; IXor (Reg RAX, bool_mask) ]
  | CPrim1 (PrintStack, body, tag) ->
    (* print_stack takes in RSP, RBP, number of arguments passed to the function, requested return value *)
    [ IMov (Reg RDI, Reg RSP)
    ; IMov (Reg RSI, Reg RBP)
    ; IMov (Reg RDX, Const (Int64.of_int num_args))
    ; IMov (Reg RCX, compile_imm body env)
    ; ICall (Label "print_stack")
    ]
  | (CIf _ | CPrim2 _ | CApp _ | CImmExpr _ | CSetItem _ | CTuple _ | CGetItem _ | CLambda _ | CString _) as err ->
    raise (InternalCompilerError (sprintf "compile_prim1 called on a non-prim1: %s" (string_of_cexpr err)))

(* Compile the given cexpr which must be a prim2 to a list of instructions *)
and compile_prim2 (e : tag cexpr) (si : int) (env : arg envt) (num_args : int) (was_typechecked : bool)
    : instruction list
  =
  match e with
  | CPrim2 (((Plus | Minus | Times) as op), lhs, rhs, tag) ->
    compile_aexpr lhs si env num_args was_typechecked
    @ [ IMov (Reg reserved_temp_register_1, Reg RAX) ]
    @ compile_assert_is_int (Reg reserved_temp_register_1) assertion_failed_arith_not_num was_typechecked
    @ compile_aexpr rhs si env num_args was_typechecked
    @ [ IMov (Reg reserved_temp_register_2, Reg RAX) ]
    @ compile_assert_is_int (Reg RAX) assertion_failed_arith_not_num was_typechecked
    @ [ ILineComment (sprintf "... %s ..." (string_of_op2 op)); IMov (Reg RAX, Reg reserved_temp_register_1) ]
    @ (match op with
      | Plus -> [ IAdd (Reg RAX, Reg reserved_temp_register_2) ]
      | Minus -> [ ISub (Reg RAX, Reg reserved_temp_register_2) ]
      | Times -> [ ISar (Reg RAX, Const 1L); IMul (Reg RAX, Reg reserved_temp_register_2) ]
      | err ->
        raise
          (InternalCompilerError
             (sprintf "Found a not plus/minus/times while compiling a plus/minus/times: %s" (string_of_op2 err))))
    @ [ IJo (Label overflow_label) ]
  (* And, Or short circuit evaluation of their LHS and RHS *)
  | CPrim2 (Or, lhs, rhs, tag) ->
    let done_label = sprintf "or_done_%d" tag in
    [ ILineComment "or_lhs {" ]
    @ compile_aexpr lhs si env num_args was_typechecked
    @ [ ILineComment "} or_lhs" ]
    @ compile_assert_is_bool (Reg RAX) assertion_failed_logic_not_bool was_typechecked
    @ [ ILineComment "or_check_lhs:"; ICmp (Reg RAX, const_true); IJe (Label done_label); ILineComment "or_rhs {" ]
    @ compile_aexpr rhs si env num_args was_typechecked
    @ [ ILineComment "} or_rhs" ]
    @ compile_assert_is_bool (Reg RAX) assertion_failed_logic_not_bool was_typechecked
    @ [ ILineComment "or_check_rhs:"
      ; ICmp (Reg RAX, const_true)
      ; IJe (Label done_label)
      ; IMov (Reg RAX, const_false)
      ; ILabel done_label
      ]
  | CPrim2 (And, lhs, rhs, tag) ->
    let done_label = sprintf "and_done_%d" tag in
    [ ILineComment "and_lhs {" ]
    @ compile_aexpr lhs si env num_args was_typechecked
    @ [ ILineComment "} and_lhs" ]
    @ compile_assert_is_bool (Reg RAX) assertion_failed_logic_not_bool was_typechecked
    @ [ ILineComment "and_check_lhs:"; ICmp (Reg RAX, const_false); IJe (Label done_label); ILineComment "and_rhs {" ]
    @ compile_aexpr rhs si env num_args was_typechecked
    @ [ ILineComment "} and_rhs" ]
    @ compile_assert_is_bool (Reg RAX) assertion_failed_logic_not_bool was_typechecked
    @ [ ILineComment "and_check_rhs:"
      ; ICmp (Reg RAX, const_false)
      ; IJe (Label done_label)
      ; IMov (Reg RAX, const_true)
      ; ILabel done_label
      ]
  | CPrim2 (((Greater | GreaterEq | Less | LessEq | Eq) as op), lhs, rhs, tag) ->
    let cmp_fail_label = sprintf "_cmp_fail_%d" tag in
    let cmp_done_label = sprintf "_cmp_done_%d" tag in
    let assertions =
      (* The Eq operator functions on any type, while all the other operators can only be used on integers *)
      match op with
      | Eq -> []
      | _ ->
        compile_assert_is_int (Reg reserved_temp_register_1) assertion_failed_comparison_not_num was_typechecked
        @ compile_assert_is_int (Reg reserved_temp_register_2) assertion_failed_comparison_not_num was_typechecked
    in
    compile_aexpr lhs si env num_args was_typechecked
    @ [ IMov (Reg reserved_temp_register_1, Reg RAX) ]
    @ compile_aexpr rhs si env num_args was_typechecked
    @ [ IMov (Reg reserved_temp_register_2, Reg RAX) ]
    @ assertions
    @ [ ILineComment (sprintf "... %s ..." (string_of_op2 op))
      ; IMov (Reg RAX, Reg reserved_temp_register_1)
      ; ICmp (Reg RAX, Reg reserved_temp_register_2)
      ; (match op with
        | Greater -> IJle (Label cmp_fail_label)
        | GreaterEq -> IJl (Label cmp_fail_label)
        | Less -> IJge (Label cmp_fail_label)
        | LessEq -> IJg (Label cmp_fail_label)
        | Eq -> IJne (Label cmp_fail_label)
        | err ->
          raise
            (InternalCompilerError
               (sprintf "Found a non-comparison while compiling a comparison: %s" (string_of_op2 err))))
      ; IMov (Reg RAX, const_true)
      ; IJmp (Label cmp_done_label)
      ; ILabel cmp_fail_label
      ; IMov (Reg RAX, const_false)
      ; ILabel cmp_done_label
      ]
  | (CIf _ | CPrim1 _ | CApp _ | CImmExpr _ | CSetItem _ | CTuple _ | CGetItem _ | CLambda _ | CString _) as err ->
    raise (InternalCompilerError (sprintf "compile_prim2 called on a non-prim2: %s" (string_of_cexpr err)))

(* Assert that the given argument is an int. If it is not, jump to the given label which 
 * should be a label that exits the program with the correct error message. Uses a provided
 * label so that this function can be used to assert that arguments are an int in different
 * contexts. Note that if the arg is a Const that is not an int, this does *not* raise a 
 * compile time exception and instead generates assembly to raise a runtime error. *)
and compile_assert_is_int (v : arg) (error_label : string) (was_typechecked : bool) : instruction list =
 (
    match v with
    | RegOffset (_, _) | Reg _ | RegByteOffset _ | RegOffsetReg _ | Label _ | LabelContents _ ->
      [ ILineComment (sprintf "Assert that %s holds a number" (arg_to_asm v))
      ; ITest (Sized (QWORD_PTR, v), HexConst num_tag_mask)
      ; CMovne (Reg RSI, v)
      ; IJne (Label error_label)
      ]
    | HexConst n | Const n ->
      if is_snake_int n
      then []
      else
        [ ILineComment (sprintf "A non-int constant was given to a function that expects a number, so throw an error")
        ; IMov (Reg RSI, v)
        ; IJmp (Label error_label)
        ]
    | Sized (_, arg) -> compile_assert_is_int arg error_label was_typechecked)

and compile_assert_is_bool (v : arg) (error_label : string) (was_typechecked : bool) : instruction list =
  compile_assert_has_tag bool_tag v error_label was_typechecked

and compile_assert_is_tuple (v : arg) (error_label : string) (was_typechecked : bool) : instruction list =
  compile_assert_has_tag tuple_tag v error_label was_typechecked

and compile_assert_is_closure (v : arg) (error_label : string) (was_typechecked : bool) : instruction list =
  compile_assert_has_tag closure_tag v error_label was_typechecked

and compile_assert_has_tag (tag : int64) (v : arg) (error_label : string) (was_typechecked : bool) : instruction list =
  if tag == num_tag
  then raise (InternalCompilerError "compile_assert_has_tag called with the number tag which it cannot handle!")
  else (
    let tag_to_typ (t : int64) : string =
      match t with
      | t when t = closure_tag -> "closure"
      | t when t = bool_tag -> "bool"
      | t when t = tuple_tag -> "tuple"
      | t when t = num_tag -> "num"
      | _ -> "unknown"
    in
    (
      match v with
      | RegOffset (_, _) | Reg _ | RegByteOffset _ | RegOffsetReg _ | LabelContents _ | Label _ ->
        [ ILineComment (sprintf "Assert that %s has the tag %Ld (aka: '%s')" (arg_to_asm v) tag (tag_to_typ tag))
        ; IMov (Reg reserved_temp_register_1, v)
        ; IShl (Reg reserved_temp_register_1, Const 61L)
        ; IShr (Reg reserved_temp_register_1, Const 61L)
        ; ICmp (Reg reserved_temp_register_1, HexConst tag)
        ; CMovne (Reg RSI, v)
        ; IJne (Label error_label)
        ]
      | HexConst n | Const n ->
        let is_ok = (tag = num_tag && is_snake_int n) || (tag = bool_tag && is_snake_bool n) in
        if is_ok
        then []
        else
          [ ILineComment
              (sprintf "A constant was given to a function that expects a %s, so throw an error" (tag_to_typ tag))
          ; IMov (Reg RSI, v)
          ; IJmp (Label error_label)
          ]
      | Sized (_, arg) -> compile_assert_has_tag tag arg error_label was_typechecked))

and reserve (size : int64) (tag : int) =
  let ok = sprintf "memcheck_ok_%d" tag in
  [ IInstrComment
      (IMov (Reg RAX, LabelContents "HEAP_END"), sprintf "Reserving %Ld words" (Int64.div size (Int64.of_int word_size)))
  ; ISub (Reg RAX, Const size)
  ; ICmp (Reg RAX, Reg reserved_heap_reg)
  ; IJge (Label ok)
  ]
  @ compile_native_call
      "try_gc"
      [ Sized (QWORD_PTR, Reg reserved_heap_reg)
      ; (* alloc_ptr in C *)
        Sized (QWORD_PTR, Const size)
      ; (* bytes_needed in C *)
        Sized (QWORD_PTR, Reg RBP)
      ; (* first_frame in C *)
        Sized (QWORD_PTR, Reg RSP)
        (* stack_top in C *)
      ]
  @ [ IInstrComment
        ( IMov (Reg reserved_heap_reg, Reg RAX)
        , "assume gc success if returning here, so RAX holds the new heap_reg value" )
    ; ILabel ok
    ]

(* Compile a native call which is a call to a C function in our C runtime *)
and compile_native_call (native_fn_name : string) (args : arg list) : instruction list =
  if List.length args > List.length first_six_args_registers
     (* This is not supported since no currently implemented native functions require more than 6 arguments *)
  then raise (InternalCompilerError "Attempted to compile a native function call with more than 6 arguments!")
  else
    List.flatten
      (List.map
         (fun (arg, reg) -> [ IMov (Reg reg, arg) ])
         (List.combine args (list_truncate first_six_args_registers (List.length args))))
    @ [ ICall (Label native_fn_name) ]

(* Compile the given cexpr which must be a CApp to a list of instructions *)
and compile_fun_app (e : tag cexpr) (env : arg envt) (was_typechecked : bool) : instruction list =
  match e with
  (* Snake calls are calls to functions defined in snake-lang *)
  | CApp (func, args, Snake, t) ->
    let func_address = compile_imm func env in
    let args_window_size = round_up_to_multiple_of_16 (Assembly.word_size * (List.length args + 1)) in
    [ IMov (Reg RAX, func_address) ]
    @ compile_assert_is_closure (Reg RAX) assertion_failed_not_a_closure was_typechecked
    @ [ IMov (Reg RAX, func_address)
      ; ISub (Reg RAX, HexConst closure_tag)
      ; ICmp (Sized (QWORD_PTR, RegOffset (0, RAX)), int64_to_snake_int (Int64.of_int (List.length args)))
      ; CMovne (Reg RSI, Sized (QWORD_PTR, RegOffset (0, RAX)))
      ; IJne (Label assertion_failed_arity_error)
      ; IMov (Reg RAX, RegOffset (1, RAX))
      ; IInstrComment
          (ISub (Reg RSP, Const (Int64.of_int args_window_size)), "Decrement RSP to prepare to call the closure")
      ]
    @ List.flatten
        (List.mapi
           (fun i a ->
             [ IInstrComment
                 (IMov (Reg reserved_immediate_register, Sized (QWORD_PTR, compile_imm a env)), sprintf "arg_%d" i)
             ; IMov (Sized (QWORD_PTR, RegOffset (i, RSP)), Reg reserved_immediate_register)
             ])
           args)
    @ (if (List.length args + 1) mod 2 = 1
      then
        [ IInstrComment
            ( IMov (Sized (QWORD_PTR, RegOffset (List.length args + 1, RSP)), HexConst 0L)
            , "Fill in the padded argument with a zero so all stack memory is padded with zeros" )
        ]
      else [])
    @ [ IInstrComment
          (IMov (Reg reserved_temp_register_1, func_address), "Pass the function itself as the final argument")
      ; IMov (Sized (QWORD_PTR, RegOffset (List.length args, RSP)), Reg reserved_temp_register_1)
      ; IInstrComment
          (ICall (Reg RAX), "func(" ^ String.concat ", " (List.map (fun a -> arg_to_asm (compile_imm a env)) args) ^ ")")
      ; IInstrComment (IAdd (Reg RSP, Const (Int64.of_int args_window_size)), "Increment RSP after calling the closure")
      ]
  | CApp (ImmId (fn, _), args, Native, t) -> compile_native_call fn (List.map (fun a -> compile_imm a env) args)
  | CApp (_, _, Native, _) ->
    raise (InternalCompilerError "compile_fun_app cannot call a Native function with out an ImmId!")
  | CApp (fnname, args, (Unknown | Prim), t) ->
    raise
      (InternalCompilerError
         (sprintf
            "compile_fun_app received an Unknown/Prim CApp, cannot compile this function application: %s"
            (string_of_cexpr e)))
  | (CTuple _ | CIf _ | CPrim1 _ | CPrim2 _ | CGetItem _ | CSetItem _ | CLambda _ | CImmExpr _ | CString _) as err ->
    raise (InternalCompilerError ("compile_fun_app called on a non-CApp: " ^ string_of_cexpr err))
;;

let compile_prog (was_typechecked : bool) (anfed : tag aprogram) : string =
  match anfed with
  | AProgram ([], body, _) ->
    let externs = ["error"; "native#print"; "print_stack"; "try_gc"; "STACK_BOTTOM"; "STACK_SIZE"; "native#string_len"; "native#string_append"; "native#char_at"; "native#input"; "native#equal"; "HEAP_END"; "add_to_exn_table"; "get_exn_depth"; "get_exn_location"; "clear_from_exn_table"; "clear_exn_table_before_jmp"; "increment_exn_depths"; "decrement_exn_depths"] in 
    let prelude =
      "section .text\nglobal our_code_starts_here\nglobal EXCEPTION_NAMES\n" ^ String.concat "\n" (List.map (fun (x) -> "extern " ^ x) externs)
    in
    (* Postlude for our program that contains labels used for error handling *)
    let postlude =
      [ ILeave
      ; IRet
      ; ILineComment "Error labels: "
      ; IInstrComment
          (ILabel assertion_failed_arith_not_num, "Assertion failed, found a not-number when doing arithmetic")
      ; IMov (Reg RDI, Const err_ARITH_NOT_NUM)
      ; ICall (Label "error")
      ; IInstrComment
          (ILabel assertion_failed_comparison_not_num, "Assertion failed, found a not-number when doing a comparison")
      ; IMov (Reg RDI, Const err_COMP_NOT_NUM)
      ; ICall (Label "error")
      ; IInstrComment
          (ILabel assertion_failed_if_not_bool, "Assertion failed, found a not-boolean as a condition in an if")
      ; IMov (Reg RDI, Const err_IF_NOT_BOOL)
      ; ICall (Label "error")
      ; IInstrComment
          (ILabel assertion_failed_logic_not_bool, "Assertion failed, found a not-boolean when doing boolean logic")
      ; IMov (Reg RDI, Const err_LOGIC_NOT_BOOL)
      ; ICall (Label "error")
      ; IInstrComment (ILabel overflow_label, "Call the error function when an integer overflow is detected")
      ; IMov (Reg RDI, Const err_OVERFLOW)
      ; ICall (Label "error")
      ; IInstrComment (ILabel assertion_failed_not_tuple, "Assertion failed, expected a tuple")
      ; IMov (Reg RDI, Const err_GET_NOT_TUPLE)
      ; ICall (Label "error")
      ; IInstrComment (ILabel assertion_failed_get_index_too_large, "Assertion failed, tuple index too large")
      ; IMov (Reg RDI, Const err_GET_HIGH_INDEX)
      ; ICall (Label "error")
      ; IInstrComment (ILabel assertion_failed_get_index_too_small, "Assertion failed, tuple index too small")
      ; IMov (Reg RDI, Const err_GET_LOW_INDEX)
      ; ICall (Label "error")
      ; IInstrComment (ILabel assertion_failed_index_nil, "Assertion failed, indexed into a tuple")
      ; IMov (Reg RDI, Const err_NIL_DEREF)
      ; ICall (Label "error")
      ; IInstrComment (ILabel assertion_failed_no_more_heap_space, "Assertion failed, out of space on our heap")
      ; IMov (Reg RDI, Const err_OUT_OF_MEMORY)
      ; ICall (Label "error")
      ; IInstrComment (ILabel assertion_failed_not_a_closure, "Assertion failed, tried to call a not-closure")
      ; IMov (Reg RDI, Const err_CALL_NOT_CLOSURE)
      ; ICall (Label "error")
      ; IInstrComment
          (ILabel assertion_failed_arity_error, "Assertion failed, tried to call a function with the wrong arity")
      ; IMov (Reg RDI, Const err_CALL_ARITY_ERR)
      ; ICall (Label "error")
      ; IInstrComment
          ( ILabel assertion_failed_out_of_stack_memory
          , "Assertion failed, tried to call a function with the wrong arity" )
      ; IMov (Reg RDI, Const err_OUT_OF_STACK_MEMORY)
      ; ICall (Label "error")
      ] in 
    let postlude = postlude @ List.mapi (fun (i) (e) -> StringConstant ((sprintf "exception_%d" i), e)) !global_defined_exns @ [ArrayConstant("EXCEPTION_NAMES", (List.mapi (fun i _ -> sprintf "exception_%d" i)  !global_defined_exns))]
    in
    let all_instructions =
      [ ILabel "our_code_starts_here" ]
      @ generate_stack_setup body 0 false
      @ [ ILineComment "heap setup {"
        ; IInstrComment (IMov (Reg reserved_heap_reg, Reg RDI), "Load heap_reg with our argument, the heap pointer")
        ; ILineComment "} heap setup"
        ; IInstrComment (IMov (LabelContents "STACK_BOTTOM", Reg RBP), "Init STACK_BOTTOM")
        ]
      @ compile_aexpr body 1 [] 0 was_typechecked
      @ postlude
    in
    let legal_all_instructions = remove_illegal_immediates all_instructions in
    let optimized_all_instructions = legal_all_instructions in
    prelude ^ to_asm optimized_all_instructions
  | AProgram (_, _, _) -> raise (InternalCompilerError "Found decls when they should have been desugared away!")
;;

let run_if should_run f = if should_run then f else no_op_phase

let compile_to_string (should_infer : bool) (should_check : bool) (prog : sourcespan program pipeline) : string pipeline
  =
  prog
  |> add_err_phase well_formed is_well_formed
  |> add_err_phase desugared desugar
  |> run_if should_check (add_err_phase type_checked type_check)
  |> add_phase tagged tag
  |> add_phase renamed rename_and_tag
  |> add_phase anfed (fun p -> atag (anf p))
  |> add_phase result (compile_prog should_check)
;;
