open Exprs
open Pretty
open Phases
open Errors
open Printf

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

let rename_and_tag (p : tag program) : tag program =
  let rec rename env p =
    match p with
    | Program (tydecls, [], body, tag) -> Program (tydecls, [], helpE env body, tag)
    | Program (_, _, _, _) ->
      raise (InternalCompilerError "Found decls in rename_and_tag when they should have been desugared away")
  and helpB env (b : tag bind) =
    match b with
    | BBlank (typ, tag) -> b, env
    | BName (name, typ, tag) ->
      let name' = sprintf "%s_%d" name (get_int tag) in
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
    | ETryCatch (e1, n, e2, tag) -> ETryCatch (helpE env e1, n, helpE env e2, tag)
    | EThrow (n, tag) -> EThrow (n, tag)
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
    | ETryCatchFinally _ -> raise (NotYetImplemented "ETryCatchFinally")
  in
  rename [] p
;;
