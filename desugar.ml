open Exprs
open Phases
open Printf
open TypeCheck
open Errors
open Pretty

let rec list_truncate (l : 'a list) (n : int) : 'a list =
  if n = 0
  then []
  else (
    match l with
    | f :: r -> f :: list_truncate r (n - 1)
    | [] -> [])
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
    | EString (s, loc) -> EString (s, loc)
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
    | ETryCatch (e1, n, e2, loc) -> ETryCatch (helpE e1 tyenv, n, helpE e2 tyenv, loc)
    | EThrow (n, loc) -> EThrow (n, loc)
    | ETryCatchFinally _ -> raise (NotYetImplemented "ETryCatchFinally")
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
            BName (fn, TyBlank dummy_span, dummy_span), ELambda (args, body, loc), loc)
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
    (try
       let init_tyenv = generate_init_tyenv tydecls [] in
       let body' = desugar_decls_to_lambdas decls body in
       let body'' = add_native_funcs body' in
       Ok (Program ([], [], helpE body'' init_tyenv, loc))
     with
    | exn -> Error [ exn ])
;;
