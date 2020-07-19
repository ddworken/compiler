open Phases
open Printf
open Errors
open Exprs
module StringSet = Set.Make (String)
module StringMap = Map.Make (String)

type 'a sm_envt = 'a StringMap.t

(* Scope_info stores the location where something was defined,
   and if it was a function declaration, then its type arity and argument arity *)
type scope_info = sourcespan * int option * int option

let env_keys e = List.map fst (StringMap.bindings e)

(* Prepends a list-like env onto an envt *)
let merge_envs list_env1 env2 = List.fold_right (fun (id, offset) env -> StringMap.add id offset env) list_env1 env2

(* Combines two envts into one, preferring the first one *)
let prepend env1 env2 = StringMap.union (fun _ a _ -> Some a) env1 env2

let from_bindings bindings =
  List.fold_left
    (fun acc (name, (scheme, ct)) ->
      StringMap.add (if ct = Native then List.nth (String.split_on_char '#' name) 1 else name) (scheme, ct) acc)
    StringMap.empty
    bindings
;;

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
    | EThrow (n, l) -> if List.mem n !global_defined_exns then [] else [ UndefinedException (n, l) ]
    | ETryCatch (e1, n, e2, l) ->
      let rec_es = wf_E e1 env tyenv @ wf_E e2 env tyenv in
      let exn_es = if List.mem n !global_defined_exns then [] else [ UndefinedException (n, l) ] in
      rec_es @ exn_es
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
    | ETryCatchFinally _ -> raise (NotYetImplemented "ETryCatchFinally")
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
    | ExceptionDecl (name, _) -> [], tyenv
  in
  match p with
  | Program (tydecls, decls, body, _) ->
    global_defined_exns
      := List.flatten
           (List.map
              (fun d ->
                match d with
                | TyDecl _ -> []
                | ExceptionDecl (n, _) -> [ n ])
              tydecls)
         @ [ "exn" ];
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
    | CTryCatch (e1, n, e2, _) -> freevars_a e1 known_variables @ freevars_a e2 known_variables
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
