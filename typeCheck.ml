open Exprs
open Errors
open Printf
open Pretty
open Phases

type 'a envt = (string * 'a) list

(* call_types indicate whether a given function is impemented by something in the runtime,
+       as a Snake function, as a primop (in case that's useful), or just unknown so far *)
type funenvt = (sourcespan scheme * call_type) envt

let dummy_span = Lexing.dummy_pos, Lexing.dummy_pos
let tInt = TyCon ("Int", dummy_span)
let tBool = TyCon ("Bool", dummy_span)
let tString = TyCon ("String", dummy_span)
let intint2int = SForall ([], TyArr ([ tInt; tInt ], tInt, dummy_span), dummy_span)
let intint2bool = SForall ([], TyArr ([ tInt; tInt ], tBool, dummy_span), dummy_span)
let int2int = SForall ([], TyArr ([ tInt ], tInt, dummy_span), dummy_span)
let int2bool = SForall ([], TyArr ([ tInt ], tBool, dummy_span), dummy_span)
let bool2bool = SForall ([], TyArr ([ tBool ], tBool, dummy_span), dummy_span)
let boolbool2bool = SForall ([], TyArr ([ tBool; tBool ], tBool, dummy_span), dummy_span)
let tyVarX = TyVar ("X", dummy_span)
let any2bool = SForall ([ "X" ], TyArr ([ tyVarX ], tBool, dummy_span), dummy_span)
let any2any = SForall ([ "X" ], TyArr ([ tyVarX ], tyVarX, dummy_span), dummy_span)
let none2any = SForall ([ "X" ], TyArr ([], tyVarX, dummy_span), dummy_span)
let none2bool = SForall ([], TyArr ([], tBool, dummy_span), dummy_span)
let none2int = SForall ([], TyArr ([], tInt, dummy_span), dummy_span)
let xx2bool = SForall ([ "X" ], TyArr ([ tyVarX; tyVarX ], tBool, dummy_span), dummy_span)
let string2int = SForall ([], TyArr ([ tString ], tInt, dummy_span), dummy_span)
let stringint2string = SForall ([], TyArr ([ tString; tInt ], tString, dummy_span), dummy_span)
let stringstring2string = SForall ([], TyArr ([ tString; tString ], tString, dummy_span), dummy_span)

(* create more type synonyms here, if you need to *)
let initial_fun_env : funenvt =
  [ "add1", (int2int, Prim)
  ; "sub1", (int2int, Prim)
  ; "isbool", (any2bool, Prim)
  ; "isnum", (any2bool, Prim)
  ; "!", (bool2bool, Prim)
  ; "printStack", (any2any, Prim)
  ; "+", (intint2int, Prim)
  ; "-", (intint2int, Prim)
  ; "*", (intint2int, Prim)
  ; "&&", (boolbool2bool, Prim)
  ; "||", (boolbool2bool, Prim)
  ; ">", (intint2bool, Prim)
  ; ">=", (intint2bool, Prim)
  ; "<", (intint2bool, Prim)
  ; "<=", (intint2bool, Prim)
  ; "==", (xx2bool, Prim)
  ; "native#print", (any2any, Native)
  ; "native#input", (none2any, Native)
  ; "native#equal", (xx2bool, Native)
  ; "native#string_len", (string2int, Native)
  ; "native#char_at", (stringint2string, Native)
  ; "native#string_append", (stringstring2string, Native)
  ]
;;

let number_native_functions () = List.length (List.filter (fun (_, (_, ct)) -> ct = Native) initial_fun_env)
let initial_val_env : sourcespan typ envt = []
let initial_ty_env : sourcespan typ envt = []

(* Returns whether the given typ is a TyBlank  *)
let is_tblank (t : 'a typ) : bool =
  match t with
  | TyBlank _ -> true
  | _ -> false
;;

(* Andmap the given function over the given list *)
let rec andmap (func : 'a -> bool) (l : 'a list) : bool =
  match l with
  | [] -> true
  | first :: rest -> func first && andmap func rest
;;

let get_bind_name (b : 'a bind) : string =
  match b with
  | BName (s, _, _) -> s
  | BBlank _ -> "_"
  | BTuple _ -> raise (InternalCompilerError (sprintf "get_bind_name of a BTuple: %s" (string_of_bind b)))
;;

let assert_is_bname (b : 'a bind) : string * 'a typ * sourcespan =
  match b with
  | BName (s, t, l) -> s, t, l
  | _ -> raise (InternalCompilerError (sprintf "assert_is_bname of a non-named bind: %s" (string_of_bind b)))
;;

let get_bind_loc (b : 'a bind) : sourcespan =
  match b with
  | BName (_, _, l) -> l
  | BBlank (_, l) -> l
  | BTuple (_, l) -> l
;;

(* Whether or not the two given types are the same type *)
let rec same_typ (t1 : sourcespan typ) (t2 : sourcespan typ) =
  match t1, t2 with
  | TyBlank l1, TyBlank l2 -> true
  | TyCon (s1, l1), TyCon (s2, l2) -> s1 = s2
  | TyVar (s1, l1), TyVar (s2, l2) -> s1 = s2
  | TyArr (typs1, typ1, l1), TyArr (typs2, typ2, l2) ->
    andmap (fun (x, y) -> same_typ x y) (List.combine typs1 typs2) && same_typ typ1 typ2
  | TyApp (s1, typs1, l1), TyApp (s2, typs2, l2) ->
    andmap (fun (x, y) -> same_typ x y) (List.combine typs1 typs2) && s1 = s2
  | TyTup (typs1, l1), TyTup (typs2, l2) when andmap (fun (x, y) -> same_typ x y) (List.combine typs1 typs2) -> true
  | _ -> false
;;

(* Type check the given program. We were not able to get our type checker to work for fer-de-lance
 * this simply always returns Ok. *)
let type_check (p : sourcespan program) : sourcespan program fallible = Ok p
