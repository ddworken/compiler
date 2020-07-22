open Printf

let show_debug_print = ref false
let debug_printf fmt = if !show_debug_print then printf fmt else ifprintf stdout fmt

type sourcespan = Lexing.position * Lexing.position

(* A tag is a unique int and a sourcespan  *)
type tag = int * sourcespan

let get_sourcespan t =
  let _, s = t in
  s
;;

let get_int t =
  let i, _ = t in
  i
;;

type prim1 =
  | Add1
  | Sub1
  | IsBool
  | IsNum
  | IsTuple
  | Not
  | PrintStack

type prim2 =
  | Plus
  | Minus
  | Times
  | Divides
  | Mod 
  | And
  | Or
  | Greater
  | GreaterEq
  | Less
  | LessEq
  | Eq

type 'a typ =
  | TyBlank of 'a
  | TyCon of string * 'a
  | TyVar of string * 'a
  | TyArr of 'a typ list * 'a typ * 'a
  | TyApp of string * 'a typ list * 'a
  | TyTup of 'a typ list * 'a

and 'a scheme = SForall of string list * 'a typ * 'a

and 'a bind =
  | BBlank of 'a typ * 'a
  | BName of string * 'a typ * 'a
  | BTuple of 'a bind list * 'a

and 'a binding = 'a bind * 'a expr * 'a

and call_type =
  | Native
  | Snake
  | Prim
  | Unknown

and 'a expr =
  | ESeq of 'a expr * 'a expr * 'a
  | ETuple of 'a expr list * 'a
  | EGetItem of 'a expr * int * int * 'a
  | ESetItem of 'a expr * int * int * 'a expr * 'a
  | ELet of 'a binding list * 'a expr * 'a
  | EPrim1 of prim1 * 'a typ list option * 'a expr * 'a
  | EPrim2 of prim2 * 'a typ list option * 'a expr * 'a expr * 'a
  | EIf of 'a expr * 'a expr * 'a expr * 'a
  | ENumber of int64 * 'a
  | EBool of bool * 'a
  | ENil of 'a typ * 'a
  | EId of string * 'a
  | EString of string * 'a
  | EApp of 'a expr * 'a expr list * call_type * 'a
  | EGenApp of 'a expr * 'a typ list * 'a expr list * call_type * 'a
  | EAnnot of 'a expr * 'a typ * 'a
  | ELambda of 'a bind list * 'a expr * 'a
  | ELetRec of 'a binding list * 'a expr * 'a
  | ETryCatch of 'a expr * string * 'a expr * 'a
  | ETryCatchFinally of 'a expr * string * 'a expr * 'a expr * 'a
  | EThrow of string * 'a

type 'a decl = DFun of string * 'a bind list * 'a scheme * 'a expr * 'a

type 'a tydecl =
  | TyDecl of string * string list option * 'a typ list * 'a
  | ExceptionDecl of string * 'a

type 'a program = Program of 'a tydecl list * 'a decl list list * 'a expr * 'a

type 'a immexpr =
  (* immediate expressions *)
  | ImmNum of int64 * 'a
  | ImmBool of bool * 'a
  | ImmId of string * 'a
  | ImmNil of 'a

and 'a cexpr =
  (* compound expressions *)
  | CIf of 'a immexpr * 'a aexpr * 'a aexpr * 'a
  | CPrim1 of prim1 * 'a immexpr * 'a
  | CPrim2 of prim2 * 'a aexpr * 'a aexpr * 'a
  | CApp of 'a immexpr * 'a immexpr list * call_type * 'a
  | CImmExpr of 'a immexpr (* for when you just need an immediate value *)
  | CTuple of 'a immexpr list * 'a
  | CGetItem of 'a immexpr * int * 'a
  | CSetItem of 'a immexpr * int * 'a immexpr * 'a
  | CLambda of string list * 'a aexpr * 'a
  | CString of string * 'a
  | CTryCatch of 'a aexpr * string * 'a aexpr * 'a
  | CThrow of string * 'a

and 'a aexpr =
  (* anf expressions *)
  | ASeq of 'a cexpr * 'a aexpr * 'a
  | ALet of string * 'a cexpr * 'a aexpr * 'a
  | ALetRec of (string * 'a cexpr) list * 'a aexpr * 'a
  | ACExpr of 'a cexpr

and 'a adecl = ADFun of string * string list * 'a aexpr * 'a

and 'a aprogram = AProgram of 'a adecl list * 'a aexpr * 'a

let map_opt f v =
  match v with
  | None -> None
  | Some v -> Some (f v)
;;

let rec bind_to_typ bind =
  match bind with
  | BBlank (t, _) -> t
  | BName (_, t, _) -> t
  | BTuple (args, a) -> TyTup (List.map bind_to_typ args, a)
;;

let get_tag_S s =
  match s with
  | SForall (_, _, t) -> t
;;

let get_tag_T t =
  match t with
  | TyBlank t -> t
  | TyCon (_, t) -> t
  | TyVar (_, t) -> t
  | TyArr (_, _, t) -> t
  | TyApp (_, _, t) -> t
  | TyTup (_, t) -> t
;;

let get_tag_E e =
  match e with
  | ELet (_, _, t) -> t
  | ELetRec (_, _, t) -> t
  | EPrim1 (_, _, _, t) -> t
  | EPrim2 (_, _, _, _, t) -> t
  | EIf (_, _, _, t) -> t
  | ENil (_, t) -> t
  | ENumber (_, t) -> t
  | EBool (_, t) -> t
  | EId (_, t) -> t
  | EApp (_, _, _, t) -> t
  | EGenApp (_, _, _, _, t) -> t
  | EAnnot (_, _, t) -> t
  | ETuple (_, t) -> t
  | EGetItem (_, _, _, t) -> t
  | ESetItem (_, _, _, _, t) -> t
  | ESeq (_, _, t) -> t
  | ELambda (_, _, t) -> t
  | EString (_, t) -> t
  | ETryCatch (_, _, _, t) -> t
  | ETryCatchFinally (_, _, _, _, t) -> t
  | EThrow (_, t) -> t
;;

let get_tag_D d =
  match d with
  | DFun (_, _, _, _, t) -> t
;;

let rec map_tag_E (f : 'a -> 'b) (e : 'a expr) =
  match e with
  | ESeq (e1, e2, a) -> ESeq (map_tag_E f e1, map_tag_E f e2, f a)
  | ETuple (exprs, a) -> ETuple (List.map (map_tag_E f) exprs, f a)
  | EGetItem (e, idx, len, a) -> EGetItem (map_tag_E f e, idx, len, f a)
  | ESetItem (e, idx, len, newval, a) -> ESetItem (map_tag_E f e, idx, len, map_tag_E f newval, f a)
  | EId (x, a) -> EId (x, f a)
  | EString (s, a) -> EString (s, f a)
  | ENumber (n, a) -> ENumber (n, f a)
  | EBool (b, a) -> EBool (b, f a)
  | ENil (t, a) -> ENil (map_tag_T f t, f a)
  | EAnnot (e, t, a) -> EAnnot (map_tag_E f e, map_tag_T f t, f a)
  | EPrim1 (op, opt_typs, e, a) ->
    let tag_prim = f a in
    EPrim1 (op, map_opt (map_tag_Ts f) opt_typs, map_tag_E f e, tag_prim)
  | EPrim2 (op, opt_typs, e1, e2, a) ->
    let tag_prim = f a in
    let tag_e1 = map_tag_E f e1 in
    let tag_e2 = map_tag_E f e2 in
    EPrim2 (op, map_opt (map_tag_Ts f) opt_typs, tag_e1, tag_e2, tag_prim)
  | ETryCatch (e1, n, e2, a) ->
    let tag_prim = f a in
    let tag_e1 = map_tag_E f e1 in
    let tag_e2 = map_tag_E f e2 in
    ETryCatch (tag_e1, n, tag_e2, tag_prim)
  | ETryCatchFinally (e1, n, e2, e3, a) ->
    let tag_prim = f a in
    let tag_e1 = map_tag_E f e1 in
    let tag_e2 = map_tag_E f e2 in
    let tag_e3 = map_tag_E f e3 in
    ETryCatchFinally (tag_e1, n, tag_e2, tag_e3, tag_prim)
  | EThrow (n, a) -> EThrow (n, f a)
  | ELet (binds, body, a) ->
    let tag_let = f a in
    let tag_binding (b, e, t) =
      let tag_bind = f t in
      let tag_b = map_tag_B f b in
      let tag_e = map_tag_E f e in
      tag_b, tag_e, tag_bind
    in
    let tag_binds = List.map tag_binding binds in
    let tag_body = map_tag_E f body in
    ELet (tag_binds, tag_body, tag_let)
  | ELetRec (binds, body, a) ->
    let tag_let = f a in
    let tag_binding (b, e, t) =
      let tag_bind = f t in
      let tag_b = map_tag_B f b in
      let tag_e = map_tag_E f e in
      tag_b, tag_e, tag_bind
    in
    let tag_binds = List.map tag_binding binds in
    let tag_body = map_tag_E f body in
    ELetRec (tag_binds, tag_body, tag_let)
  | EIf (cond, thn, els, a) ->
    let tag_if = f a in
    let tag_cond = map_tag_E f cond in
    let tag_thn = map_tag_E f thn in
    let tag_els = map_tag_E f els in
    EIf (tag_cond, tag_thn, tag_els, tag_if)
  | EApp (func, args, native, a) ->
    let tag_app = f a in
    EApp (map_tag_E f func, List.map (map_tag_E f) args, native, tag_app)
  | EGenApp (func, tyargs, args, native, a) ->
    let tag_app = f a in
    EGenApp (map_tag_E f func, List.map (map_tag_T f) tyargs, List.map (map_tag_E f) args, native, tag_app)
  | ELambda (binds, body, a) ->
    let tag_lam = f a in
    ELambda (List.map (map_tag_B f) binds, map_tag_E f body, tag_lam)

and map_tag_Ts f ts = List.map (map_tag_T f) ts

and map_tag_B (f : 'a -> 'b) b =
  match b with
  | BBlank (t, tag) -> BBlank (map_tag_T f t, f tag)
  | BName (x, t, ax) ->
    let tag_ax = f ax in
    let tag_t = map_tag_T f t in
    BName (x, tag_t, tag_ax)
  | BTuple (binds, t) ->
    let tag_tup = f t in
    BTuple (List.map (map_tag_B f) binds, tag_tup)

and map_tag_T (f : 'a -> 'b) t =
  match t with
  | TyBlank a -> TyBlank (f a)
  | TyCon (name, a) -> TyCon (name, f a)
  | TyArr (args, ret, a) ->
    let tag_arrow = f a in
    let tag_args = List.map (map_tag_T f) args in
    let tag_ret = map_tag_T f ret in
    TyArr (tag_args, tag_ret, tag_arrow)
  | TyApp (s, args, a) ->
    let tag_app = f a in
    let tag_args = List.map (map_tag_T f) args in
    TyApp (s, tag_args, tag_app)
  | TyVar (x, a) -> TyVar (x, f a)
  | TyTup (tys, a) -> TyTup (List.map (map_tag_T f) tys, f a)

and map_tag_S (f : 'a -> 'b) s =
  match s with
  | SForall (vars, typ, a) -> SForall (vars, map_tag_T f typ, f a)

and map_tag_D (f : 'a -> 'b) d =
  match d with
  | DFun (name, args, scheme, body, a) ->
    let tag_fun = f a in
    let tag_args = List.map (map_tag_B f) args in
    let tag_scheme = map_tag_S f scheme in
    let tag_body = map_tag_E f body in
    DFun (name, tag_args, tag_scheme, tag_body, tag_fun)

and map_tag_TD (f : 'a -> 'b) td =
  match td with
  | TyDecl (name, tyargs_opt, args, a) ->
    let tag_a = f a in
    TyDecl (name, tyargs_opt, List.map (map_tag_T f) args, tag_a)
  | ExceptionDecl (name, a) -> ExceptionDecl (name, f a)

and map_tag_P (f : 'a -> 'b) p =
  match p with
  | Program (tydecls, declgroups, body, a) ->
    let tag_a = f a in
    let tag_tydecls = List.map (map_tag_TD f) tydecls in
    let tag_decls = List.map (fun group -> List.map (map_tag_D f) group) declgroups in
    let tag_body = map_tag_E f body in
    Program (tag_tydecls, tag_decls, tag_body, tag_a)
;;

let tag (p : sourcespan program) : tag program =
  let next = ref 0 in
  let tag s =
    next := !next + 1;
    !next, s
  in
  map_tag_P tag p
;;

let combine_tags (f1 : 'a -> 'b) (f2 : 'a -> 'c) (p : 'a program) : ('b * 'c) program =
  map_tag_P (fun a -> f1 a, f2 a) p
;;

let tag_and_map (f : 'a -> 'b) (p : 'a program) : ('a * 'b) program = map_tag_P (fun a -> a, f a) p

let rec untagP (p : 'a program) : unit program =
  match p with
  | Program (tydecls, decls, body, _) ->
    Program (List.map untagTD tydecls, List.map (fun group -> List.map untagD group) decls, untagE body, ())

and untagE e =
  match e with
  | ESeq (e1, e2, _) -> ESeq (untagE e1, untagE e2, ())
  | ETuple (exprs, _) -> ETuple (List.map untagE exprs, ())
  | EGetItem (e, idx, len, _) -> EGetItem (untagE e, idx, len, ())
  | ESetItem (e, idx, len, newval, _) -> ESetItem (untagE e, idx, len, untagE newval, ())
  | EId (x, _) -> EId (x, ())
  | ENumber (n, _) -> ENumber (n, ())
  | EBool (b, _) -> EBool (b, ())
  | ENil (t, _) -> ENil (untagT t, ())
  | EAnnot (e, t, _) -> EAnnot (untagE e, untagT t, ())
  | EPrim1 (op, opt_typs, e, _) -> EPrim1 (op, map_opt untagTs opt_typs, untagE e, ())
  | EPrim2 (op, opt_typs, e1, e2, _) -> EPrim2 (op, map_opt untagTs opt_typs, untagE e1, untagE e2, ())
  | ELet (binds, body, _) -> ELet (List.map (fun (b, e, _) -> untagB b, untagE e, ()) binds, untagE body, ())
  | EIf (cond, thn, els, _) -> EIf (untagE cond, untagE thn, untagE els, ())
  | EApp (func, args, native, _) -> EApp (untagE func, List.map untagE args, native, ())
  | EGenApp (func, tyargs, args, native, _) ->
    EGenApp (untagE func, List.map untagT tyargs, List.map untagE args, native, ())
  | ELetRec (binds, body, _) -> ELetRec (List.map (fun (b, e, _) -> untagB b, untagE e, ()) binds, untagE body, ())
  | ELambda (binds, body, _) -> ELambda (List.map untagB binds, untagE body, ())
  | EString (s, _) -> EString (s, ())
  | ETryCatch (e1, n, e2, _) -> ETryCatch (e1, n, e2, ())
  | ETryCatchFinally (e1, n, e2, e3, _) -> ETryCatchFinally (e1, n, e2, e3, ())
  | EThrow (n, _) -> EThrow (n, ())

and untagBB ((a, b, c) : 'a binding) = untagB a, untagE b, ()

and untagB b =
  match b with
  | BBlank (typ, _) -> BBlank (untagT typ, ())
  | BName (x, typ, _) -> BName (x, untagT typ, ())
  | BTuple (binds, _) -> BTuple (List.map untagB binds, ())

and untagTs ts = List.map untagT ts

and untagT t =
  match t with
  | TyBlank _ -> TyBlank ()
  | TyCon (name, _) -> TyCon (name, ())
  | TyArr (args, ret, _) -> TyArr (List.map untagT args, untagT ret, ())
  | TyApp (s, args, _) -> TyApp (s, List.map untagT args, ())
  | TyVar (x, _) -> TyVar (x, ())
  | TyTup (tys, _) -> TyTup (List.map untagT tys, ())

and untagS s =
  match s with
  | SForall (vars, typ, _) -> SForall (vars, untagT typ, ())

and untagD d =
  match d with
  | DFun (name, args, scheme, body, _) -> DFun (name, List.map untagB args, untagS scheme, untagE body, ())

and untagTD td =
  match td with
  | TyDecl (name, tyargs_opt, args, _) -> TyDecl (name, tyargs_opt, List.map untagT args, ())
  | ExceptionDecl (n, _) -> ExceptionDecl (n, ())
;;

let atag (p : sourcespan aprogram) : tag aprogram =
  let next = ref 0 in
  let tag s =
    next := !next + 1;
    !next, s
  in
  let rec helpA (e : 'a aexpr) : tag aexpr =
    match e with
    | ASeq (e1, e2, s) ->
      let seq_tag = tag s in
      ASeq (helpC e1, helpA e2, seq_tag)
    | ALet (x, c, b, s) ->
      let let_tag = tag s in
      ALet (x, helpC c, helpA b, let_tag)
    | ALetRec (xcs, b, s) ->
      let let_tag = tag s in
      ALetRec (List.map (fun (x, c) -> x, helpC c) xcs, helpA b, let_tag)
    | ACExpr c -> ACExpr (helpC c)
  and helpC (c : 'a cexpr) : tag cexpr =
    match c with
    | CThrow (n, s) -> CThrow (n, tag s)
    | CTryCatch (e1, n, e2, s) ->
      let t = tag s in
      CTryCatch (helpA e1, n, helpA e2, t)
    | CPrim1 (op, e, s) ->
      let prim_tag = tag s in
      CPrim1 (op, helpI e, prim_tag)
    | CPrim2 (op, e1, e2, s) ->
      let prim_tag = tag s in
      CPrim2 (op, helpA e1, helpA e2, prim_tag)
    | CIf (cond, thn, els, s) ->
      let if_tag = tag s in
      CIf (helpI cond, helpA thn, helpA els, if_tag)
    | CApp (func, args, native, s) ->
      let app_tag = tag s in
      CApp (helpI func, List.map helpI args, native, app_tag)
    | CImmExpr i -> CImmExpr (helpI i)
    | CTuple (es, s) ->
      let tup_tag = tag s in
      CTuple (List.map helpI es, tup_tag)
    | CGetItem (e, idx, s) ->
      let get_tag = tag s in
      CGetItem (helpI e, idx, get_tag)
    | CSetItem (e, idx, newval, s) ->
      let set_tag = tag s in
      CSetItem (helpI e, idx, helpI newval, set_tag)
    | CLambda (args, body, s) ->
      let lam_tag = tag s in
      CLambda (args, helpA body, lam_tag)
    | CString (s, n) -> CString (s, tag n)
  and helpI (i : 'a immexpr) : tag immexpr =
    match i with
    | ImmNil s -> ImmNil (tag s)
    | ImmId (x, s) -> ImmId (x, tag s)
    | ImmNum (n, s) -> ImmNum (n, tag s)
    | ImmBool (b, s) -> ImmBool (b, tag s)
  and helpD d =
    match d with
    | ADFun (name, args, body, s) ->
      let fun_tag = tag s in
      ADFun (name, args, helpA body, fun_tag)
  and helpP p =
    match p with
    | AProgram (decls, body, s) -> AProgram (List.map helpD decls, helpA body, (0, s))
  in
  helpP p
;;
