open Exprs
open Printf
open Format
open Lexing

let rec intersperse (elts : 'a list) (sep : 'a) : 'a list =
  match elts with
  | [] -> []
  | [ elt ] -> [ elt ]
  | elt :: rest -> elt :: sep :: intersperse rest sep
;;

let string_of_op1 op =
  match op with
  | Add1 -> "add1"
  | Sub1 -> "sub1"
  | PrintStack -> "printStack"
  | Not -> "!"
  | IsNum -> "isnum"
  | IsBool -> "isbool"
  | IsTuple -> "istuple"
;;

let name_of_op1 op =
  match op with
  | Add1 -> "Add1"
  | Sub1 -> "Sub1"
  | PrintStack -> "PrintStack"
  | Not -> "Not"
  | IsNum -> "IsNum"
  | IsBool -> "IsBool"
  | IsTuple -> "IsTuple"
;;

let string_of_op2 op =
  match op with
  | Plus -> "+"
  | Minus -> "-"
  | Times -> "*"
  | Divides -> "/"
  | And -> "&&"
  | Or -> "||"
  | Greater -> ">"
  | Less -> "<"
  | GreaterEq -> ">="
  | LessEq -> "<="
  | Eq -> "=="
;;

let name_of_op2 op =
  match op with
  | Plus -> "Plus"
  | Minus -> "Minus"
  | Times -> "Times"
  | Divides -> "Divides"
  | And -> "And"
  | Or -> "Or"
  | Greater -> "Greater"
  | Less -> "Less"
  | GreaterEq -> "GreaterEq"
  | LessEq -> "LessEq"
  | Eq -> "Eq"
;;

let rec string_of_typ_with (t : 'a typ) (print_a : 'a -> string) : string =
  let help t = string_of_typ_with t print_a in
  match t with
  | TyBlank a -> "<BLANK>" ^ print_a a
  | TyCon (name, a) -> name ^ print_a a
  | TyArr (args, ret, a) ->
    sprintf "(%s -> %s)%s" (ExtString.String.join ", " (List.map help args)) (help ret) (print_a a)
  | TyApp (s, args, a) -> sprintf "%s<%s>%s" s (ExtString.String.join ", " (List.map help args)) (print_a a)
  | TyVar (id, a) -> "'" ^ id ^ print_a a
  | TyTup (tys, a) -> "(" ^ ExtString.String.join " * " (List.map help tys) ^ ")" ^ print_a a

and string_of_scheme_with (s : 'a scheme) (print_a : 'a -> string) : string =
  match s with
  | SForall (vars, typ, a) ->
    sprintf "Forall %s, %s%s" (ExtString.String.join ", " vars) (string_of_typ_with typ print_a) (print_a a)
;;

let string_of_typ t = string_of_typ_with t (fun _ -> "")
let string_of_scheme s = string_of_scheme_with s (fun _ -> "")

let rec string_of_bind (b : 'a bind) : string =
  match b with
  | BBlank _ -> "_"
  | BName (name, TyBlank _, _) -> name
  | BName (name, typ, _) -> sprintf "%s : %s" name (string_of_typ typ)
  | BTuple (binds, _) -> "(" ^ ExtString.String.join ", " (List.map string_of_bind binds) ^ ")"
;;

let string_of_call_type ct =
  match ct with
  | Native -> "*"
  | Snake -> ""
  | Prim -> "#"
  | Unknown -> "?"
;;

let rec string_of_binding_with (depth : int) (print_a : 'a -> string) ((bind, expr, _) : 'a binding) : string =
  sprintf "%s = %s" (string_of_bind bind) (string_of_expr_with depth print_a expr)

and string_of_binding (b : 'a binding) : string = string_of_binding_with 1000 (fun _ -> "") b

and string_of_expr_with (depth : int) (print_a : 'a -> string) (e : 'a expr) : string =
  let string_of_expr = string_of_expr_with (depth - 1) print_a in
  if depth <= 0
  then "..."
  else (
    match e with
    | ESeq (e1, e2, a) -> string_of_expr e1 ^ "; " ^ string_of_expr e2
    | ETuple ([ e ], a) -> "(" ^ string_of_expr e ^ ",)" ^ print_a a
    | ETuple (exprs, a) -> "(" ^ ExtString.String.join ", " (List.map string_of_expr exprs) ^ ")"
    | EGetItem (e, idx, len, a) -> sprintf "%s[%d of %d]%s" (string_of_expr e) idx len (print_a a)
    | ESetItem (e, idx, len, newval, a) ->
      sprintf "%s[%d of %d := %s]%s" (string_of_expr e) idx len (string_of_expr newval) (print_a a)
    | ENumber (n, a) -> Int64.to_string n ^ print_a a
    | EString (s, a) -> "\"" ^ s ^ "\"" ^ print_a a
    | EBool (b, a) -> string_of_bool b ^ print_a a
    | ENil (t, a) -> "nil : " ^ string_of_typ t ^ print_a a
    | EId (x, a) -> x ^ print_a a
    | EAnnot (e, t, a) -> "(" ^ string_of_expr e ^ ")::" ^ string_of_typ t ^ print_a a
    | EPrim1 (op, None, e, a) -> sprintf "%s(%s)%s" (string_of_op1 op) (string_of_expr e) (print_a a)
    | EPrim1 (op, Some typs, e, a) ->
      sprintf
        "%s<%s>(%s)%s"
        (string_of_op1 op)
        (ExtString.String.join ", " (List.map string_of_typ typs))
        (string_of_expr e)
        (print_a a)
    | EPrim2 (op, None, left, right, a) ->
      sprintf "(%s %s %s)%s" (string_of_expr left) (string_of_op2 op) (string_of_expr right) (print_a a)
    | EPrim2 (op, Some typs, left, right, a) ->
      sprintf
        "(%s %s<%s> %s)%s"
        (string_of_expr left)
        (string_of_op2 op)
        (ExtString.String.join ", " (List.map string_of_typ typs))
        (string_of_expr right)
        (print_a a)
    | ELet (binds, body, a) ->
      let binds_strs = List.map (string_of_binding_with (depth - 1) print_a) binds in
      let binds_str = List.fold_left ( ^ ) "" (intersperse binds_strs ", ") in
      sprintf "(let %s in %s)%s" binds_str (string_of_expr body) (print_a a)
    | EIf (cond, thn, els, a) ->
      sprintf "(if %s: %s else: %s)%s" (string_of_expr cond) (string_of_expr thn) (string_of_expr els) (print_a a)
    | EApp (func, args, call_type, a) ->
      sprintf
        "(%s%s(%s))%s"
        (string_of_call_type call_type)
        (string_of_expr func)
        (ExtString.String.join ", " (List.map string_of_expr args))
        (print_a a)
    | EGenApp (func, tyargs, args, call_type, a) ->
      sprintf
        "(%s%s<%s>(%s))%s"
        (string_of_call_type call_type)
        (string_of_expr func)
        (ExtString.String.join ", " (List.map string_of_typ tyargs))
        (ExtString.String.join ", " (List.map string_of_expr args))
        (print_a a)
    | ELetRec (binds, body, a) ->
      let binds_strs = List.map (string_of_binding_with (depth - 1) print_a) binds in
      let binds_str = List.fold_left ( ^ ) "" (intersperse binds_strs ", ") in
      sprintf "(let-rec %s in %s)%s" binds_str (string_of_expr body) (print_a a)
    | ELambda (binds, body, a) ->
      let binds_strs = List.map string_of_bind binds in
      let binds_str = List.fold_left ( ^ ) "" (intersperse binds_strs ", ") in
      sprintf "(lam(%s) %s)%s" binds_str (string_of_expr body) (print_a a)
    | ETryCatch (b, e, c, a) ->
      sprintf "(try {%s} catch(%s) {%s})%s" (string_of_expr b) e (string_of_expr c) (print_a a)
    | EThrow (n, a) -> sprintf "(throw %s)%s" n (print_a a))
;;

let string_of_expr (e : 'a expr) : string = string_of_expr_with 1000 (fun _ -> "") e

let string_of_decl_with (depth : int) (print_a : 'a -> string) (d : 'a decl) : string =
  match d with
  | DFun (name, args, _, body, a) ->
    sprintf
      "(def %s(%s):\n  %s)%s"
      name
      (ExtString.String.join ", " (List.map string_of_bind args))
      (string_of_expr_with (depth - 1) print_a body)
      (print_a a)
;;

let string_of_decl (d : 'a decl) : string = string_of_decl_with 1000 (fun _ -> "") d

let string_of_tydecl_with (print_a : 'a -> string) (td : 'a tydecl) : string =
  match td with
  | TyDecl (name, None, args, a) ->
    sprintf "type %s = (%s)%s" name (ExtString.String.join ", " (List.map string_of_typ args)) (print_a a)
  | TyDecl (name, Some tyargs, args, a) ->
    sprintf
      "type %s<%s> = (%s)%s"
      name
      (ExtString.String.join ", " tyargs)
      (ExtString.String.join " * " (List.map string_of_typ args))
      (print_a a)
  | ExceptionDecl (name, a) -> sprintf "(exception %s)%s" name (print_a a)
;;

let string_of_tydecl (td : 'a tydecl) : string = string_of_tydecl_with (fun _ -> "") td

let string_of_program_with (depth : int) (print_a : 'a -> string) (p : 'a program) : string =
  match p with
  | Program (tydecls, decls, body, a) ->
    let help group = ExtString.String.join "\nand " (List.map (string_of_decl_with depth print_a) group) in
    ExtString.String.join "\n\n" (List.map (string_of_tydecl_with print_a) tydecls)
    ^ "\n"
    ^ ExtString.String.join "\n\n" (List.map help decls)
    ^ "\n"
    ^ string_of_expr_with depth print_a body
    ^ "\n"
    ^ print_a a
;;

let string_of_program (p : 'a program) : string = string_of_program_with 1000 (fun _ -> "") p

let string_of_position (p : position) : string =
  sprintf "%s:line %d, col %d" p.pos_fname p.pos_lnum (p.pos_cnum - p.pos_bol)
;;

let string_of_sourcespan ((pstart, pend) : sourcespan) : string =
  sprintf
    "%s, %d:%d-%d:%d"
    pstart.pos_fname
    pstart.pos_lnum
    (pstart.pos_cnum - pstart.pos_bol)
    pend.pos_lnum
    (pend.pos_cnum - pend.pos_bol)
;;

let string_of_sourcespan_without_fn ((pstart, pend) : sourcespan) : string =
  sprintf "(%d:%d-%d:%d)" pstart.pos_lnum (pstart.pos_cnum - pstart.pos_bol) pend.pos_lnum (pend.pos_cnum - pend.pos_bol)
;;

let rec string_of_aexpr_with (depth : int) (print_a : 'a -> string) (e : 'a aexpr) : string =
  let string_of_aexpr = string_of_aexpr_with (depth - 1) print_a in
  let string_of_cexpr = string_of_cexpr_with (depth - 1) print_a in
  if depth <= 0
  then "..."
  else (
    match e with
    | ASeq (e1, e2, a) -> sprintf "(%s ; %s)%s" (string_of_cexpr e1) (string_of_aexpr e2) (print_a a)
    | ALet (x, e, b, a) -> sprintf "(alet %s = %s in %s)%s" x (string_of_cexpr e) (string_of_aexpr b) (print_a a)
    | ALetRec (xes, b, a) ->
      let xes_strings = List.map (fun (x, c) -> sprintf "%s = %s" x (string_of_cexpr c)) xes in
      sprintf "(aletrec %s in %s)%s" (ExtString.String.join ", " xes_strings) (string_of_aexpr b) (print_a a)
    | ACExpr c -> string_of_cexpr c)

and string_of_cexpr_with (depth : int) (print_a : 'a -> string) (c : 'a cexpr) : string =
  let string_of_aexpr = string_of_aexpr_with (depth - 1) print_a in
  let string_of_immexpr = string_of_immexpr_with print_a in
  if depth <= 0
  then "..."
  else (
    match c with
    | CString (s, a) -> sprintf "\"%s\"%s" s (print_a a)
    | CTuple (imms, a) -> sprintf "(%s)%s" (ExtString.String.join ", " (List.map string_of_immexpr imms)) (print_a a)
    | CGetItem (e, idx, a) -> sprintf "%s[%d]%s" (string_of_immexpr e) idx (print_a a)
    | CSetItem (e, idx, newval, a) ->
      sprintf "%s[%d := %s]%s" (string_of_immexpr e) idx (string_of_immexpr newval) (print_a a)
    | CPrim1 (op, e, a) -> sprintf "%s(%s)%s" (string_of_op1 op) (string_of_immexpr e) (print_a a)
    | CPrim2 (op, left, right, a) ->
      sprintf
        "(%s %s %s)%s"
        (string_of_aexpr_with depth print_a left)
        (string_of_op2 op)
        (string_of_aexpr_with depth print_a right)
        (print_a a)
    | CIf (cond, thn, els, a) ->
      sprintf "(if %s: %s else: %s)%s" (string_of_immexpr cond) (string_of_aexpr thn) (string_of_aexpr els) (print_a a)
    | CApp (func, args, call_type, a) ->
      sprintf
        "(%s%s(%s))%s"
        (string_of_call_type call_type)
        (string_of_immexpr func)
        (ExtString.String.join ", " (List.map string_of_immexpr args))
        (print_a a)
    | CLambda (args, body, a) ->
      sprintf "(lam(%s) %s)%s" (ExtString.String.join ", " args) (string_of_aexpr body) (print_a a)
    | CImmExpr i -> string_of_immexpr i
    | CTryCatch (b, e, c, a) ->
      sprintf "(try {%s} catch(%s) {%s})%s" (string_of_aexpr b) e (string_of_aexpr c) (print_a a)
    | CThrow (n, a) -> sprintf "(throw %s)%s" n (print_a a))

and string_of_immexpr_with (print_a : 'a -> string) (i : 'a immexpr) : string =
  match i with
  | ImmNil a -> "nil" ^ print_a a
  | ImmNum (n, a) -> Int64.to_string n ^ print_a a
  | ImmBool (b, a) -> string_of_bool b ^ print_a a
  | ImmId (x, a) -> x ^ print_a a

and string_of_aprogram_with (depth : int) (print_a : 'a -> string) (p : 'a aprogram) : string =
  match p with
  | AProgram (decls, body, a) ->
    ExtString.String.join "\n" (List.map (string_of_adecl_with depth print_a) decls)
    ^ "\n"
    ^ string_of_aexpr_with depth print_a body
    ^ "\n"
    ^ print_a a

and string_of_adecl_with (depth : int) (print_a : 'a -> string) (d : 'a adecl) : string =
  match d with
  | ADFun (name, args, body, a) ->
    sprintf
      "(fun %s(%s): %s)%s"
      name
      (ExtString.String.join ", " args)
      (string_of_aexpr_with depth print_a body)
      (print_a a)
;;

let string_of_aexpr ?(depth = 100) (e : 'a aexpr) : string = string_of_aexpr_with depth (fun _ -> "") e
let string_of_cexpr ?(depth = 100) (c : 'a cexpr) : string = string_of_cexpr_with depth (fun _ -> "") c
let string_of_immexpr (i : 'a immexpr) : string = string_of_immexpr_with (fun _ -> "") i
let string_of_adecl ?(depth = 100) (d : 'a adecl) : string = string_of_adecl_with depth (fun _ -> "") d
let string_of_aprogram ?(depth = 100) (p : 'a aprogram) : string = string_of_aprogram_with depth (fun _ -> "") p

let print_list fmt p_item items p_sep =
  match items with
  | [] -> ()
  | [ item ] -> p_item fmt item
  | first :: rest ->
    p_item fmt first;
    List.iter
      (fun item ->
        p_sep fmt;
        p_item fmt item)
      rest
;;

let indent = 2

let print_comma_sep fmt =
  pp_print_string fmt ",";
  pp_print_space fmt ()
;;

let print_star_sep fmt =
  pp_print_string fmt " *";
  pp_print_space fmt ()
;;

let maybe_angle str = if str = "" then "" else "<" ^ str ^ ">"

let open_label fmt label a =
  pp_open_hvbox fmt indent;
  pp_print_string fmt label;
  pp_print_string fmt (maybe_angle a);
  pp_print_string fmt "(";
  pp_print_cut fmt ()
;;

let open_paren fmt =
  pp_open_box fmt indent;
  pp_print_string fmt "(";
  pp_print_cut fmt ()
;;

let close_paren fmt =
  pp_print_break fmt 0 ~-indent;
  pp_close_box fmt ();
  pp_print_string fmt ")"
;;

let open_angle fmt =
  pp_open_box fmt indent;
  pp_print_string fmt "<";
  pp_print_cut fmt ()
;;

let close_angle fmt =
  pp_print_break fmt 0 ~-indent;
  pp_close_box fmt ();
  pp_print_string fmt ">"
;;

let open_brace fmt =
  pp_open_box fmt indent;
  pp_print_string fmt "{";
  pp_print_cut fmt ()
;;

let close_brace fmt =
  pp_print_break fmt 0 ~-indent;
  pp_close_box fmt ();
  pp_print_string fmt "}"
;;

let open_bracket fmt =
  pp_open_box fmt indent;
  pp_print_string fmt "[";
  pp_print_cut fmt ()
;;

let close_bracket fmt =
  pp_print_break fmt 0 ~-indent;
  pp_close_box fmt ();
  pp_print_string fmt "]"
;;

let quote x = "\"" ^ x ^ "\""

let rec format_typ (fmt : Format.formatter) (print_a : 'a -> string) (t : 'a typ) : unit =
  let help fmt = format_typ fmt print_a in
  match t with
  | TyBlank a ->
    pp_print_string fmt "<BLANK>";
    pp_print_string fmt (maybe_angle (print_a a))
  | TyCon (name, a) ->
    pp_print_string fmt name;
    pp_print_string fmt (maybe_angle (print_a a))
  | TyVar (name, a) ->
    pp_print_string fmt "'";
    pp_print_string fmt name;
    pp_print_string fmt (maybe_angle (print_a a))
  | TyArr (args, ret, a) ->
    open_paren fmt;
    print_list fmt help args print_comma_sep;
    pp_print_string fmt " ->";
    pp_print_string fmt (maybe_angle (print_a a));
    pp_print_string fmt " ";
    help fmt ret;
    close_paren fmt
  | TyApp (scheme, args, a) ->
    pp_print_string fmt scheme;
    open_angle fmt;
    print_list fmt help args print_comma_sep;
    close_angle fmt;
    pp_print_string fmt (maybe_angle (print_a a));
    pp_print_string fmt " "
  | TyTup (tys, a) ->
    open_paren fmt;
    print_list fmt help tys print_star_sep;
    close_paren fmt

and format_scheme (fmt : Format.formatter) (print_a : 'a -> string) (s : 'a scheme) : unit =
  match s with
  | SForall (args, typ, a) ->
    open_label fmt "Forall" (print_a a);
    print_list fmt pp_print_string args print_comma_sep;
    pp_print_string fmt ", ";
    format_typ fmt print_a typ;
    close_paren fmt
;;

let rec format_bind (fmt : Format.formatter) (print_a : 'a -> string) (b : 'a bind) : unit =
  match b with
  | BBlank (t, a) ->
    pp_print_string fmt "#BLANK# : ";
    format_typ fmt print_a t;
    pp_print_string fmt (maybe_angle (print_a a))
  | BName (x, typ, a) ->
    pp_print_string fmt x;
    pp_print_string fmt " : ";
    format_typ fmt print_a typ;
    pp_print_string fmt (maybe_angle (print_a a))
  | BTuple (binds, a) ->
    open_paren fmt;
    print_list fmt (fun fmt -> format_bind fmt print_a) binds print_comma_sep;
    close_paren fmt;
    pp_print_string fmt (maybe_angle (print_a a))
;;

let rec format_expr (fmt : Format.formatter) (print_a : 'a -> string) (e : 'a expr) : unit =
  let help = format_expr fmt print_a in
  match e with
  | ESeq (e1, e2, a) ->
    open_label fmt "ESeq" (print_a a);
    help e1;
    pp_print_string fmt "; ";
    help e2
  | ETuple (es, a) ->
    open_label fmt "ETuple" (print_a a);
    print_list fmt (fun fmt -> format_expr fmt print_a) es print_comma_sep;
    close_paren fmt
  | EGetItem (e, idx, len, a) ->
    open_label fmt "EGetItem" (print_a a);
    help e;
    print_comma_sep fmt;
    pp_print_int fmt idx;
    close_paren fmt
  | ESetItem (e, idx, len, newval, a) ->
    open_label fmt "ESetItem" (print_a a);
    help e;
    print_comma_sep fmt;
    pp_print_int fmt idx;
    pp_print_string fmt " := ";
    help newval;
    close_paren fmt
  | ENumber (n, a) ->
    open_label fmt "ENumber" (print_a a);
    pp_print_string fmt (Int64.to_string n);
    close_paren fmt
  | EBool (b, a) ->
    open_label fmt "EBool" (print_a a);
    pp_print_bool fmt b;
    close_paren fmt
  | ENil (t, a) ->
    open_label fmt "ENil" (print_a a);
    format_typ fmt print_a t;
    close_paren fmt
  | EId (x, a) ->
    open_label fmt "EId" (print_a a);
    pp_print_string fmt (quote x);
    close_paren fmt
  | EAnnot (e, t, a) ->
    pp_print_string fmt "(";
    help e;
    pp_print_string fmt "::";
    format_typ fmt print_a t;
    pp_print_string fmt ")"
  | EPrim1 (op, opt_typs, e, a) ->
    open_label fmt "EPrim1" (print_a a);
    pp_print_string fmt (name_of_op1 op);
    print_comma_sep fmt;
    help e;
    close_paren fmt
  | EPrim2 (op, opt_typs, e1, e2, a) ->
    open_label fmt "EPrim2" (print_a a);
    pp_print_string fmt (name_of_op2 op);
    print_comma_sep fmt;
    help e1;
    print_comma_sep fmt;
    help e2;
    close_paren fmt
  | EIf (cond, thn, els, a) ->
    open_label fmt "EIf" (print_a a);
    help cond;
    print_comma_sep fmt;
    help thn;
    print_comma_sep fmt;
    help els;
    close_paren fmt
  | EApp (func, args, call_type, a) ->
    open_label fmt "EApp" (print_a a);
    pp_print_string fmt (string_of_call_type call_type);
    help func;
    print_comma_sep fmt;
    print_list fmt (fun fmt -> format_expr fmt print_a) args print_comma_sep;
    close_paren fmt
  | EGenApp (func, tyargs, args, call_type, a) ->
    open_label fmt "EGenApp" (print_a a);
    pp_print_string fmt (string_of_call_type call_type);
    help func;
    pp_print_string fmt "<";
    print_list fmt (fun fmt -> format_typ fmt print_a) tyargs print_comma_sep;
    pp_print_string fmt ">";
    print_comma_sep fmt;
    print_list fmt (fun fmt -> format_expr fmt print_a) args print_comma_sep;
    close_paren fmt
  | ELet (binds, body, a) ->
    let print_item fmt (b, e, a) =
      open_paren fmt;
      format_bind fmt print_a b;
      print_comma_sep fmt;
      help e;
      close_paren fmt;
      pp_print_string fmt (maybe_angle (print_a a))
    in
    open_label fmt "ELet" (print_a a);
    open_paren fmt;
    print_list fmt print_item binds print_comma_sep;
    close_paren fmt;
    print_comma_sep fmt;
    help body;
    close_paren fmt
  | ELetRec (binds, body, a) ->
    let print_item fmt (b, e, a) =
      open_paren fmt;
      format_bind fmt print_a b;
      print_comma_sep fmt;
      help e;
      close_paren fmt;
      pp_print_string fmt (maybe_angle (print_a a))
    in
    open_label fmt "ELetRec" (print_a a);
    open_paren fmt;
    print_list fmt print_item binds print_comma_sep;
    close_paren fmt;
    print_comma_sep fmt;
    help body;
    close_paren fmt
  | ELambda (binds, body, a) ->
    open_label fmt "ELam" (print_a a);
    open_paren fmt;
    print_list fmt (fun fmt -> format_bind fmt print_a) binds print_comma_sep;
    close_paren fmt;
    pp_print_string fmt ":";
    pp_print_space fmt ();
    help body;
    close_paren fmt
;;

let format_decl (fmt : Format.formatter) (print_a : 'a -> string) (d : 'a decl) : unit =
  match d with
  | DFun (name, args, scheme, body, a) ->
    open_label fmt "DFun" (print_a a);
    pp_print_string fmt ("Name: " ^ name);
    print_comma_sep fmt;
    pp_print_string fmt "Args: ";
    open_paren fmt;
    print_list fmt (fun fmt -> format_bind fmt print_a) args print_comma_sep;
    close_paren fmt;
    print_comma_sep fmt;
    pp_print_string fmt "Scheme: ";
    format_scheme fmt print_a scheme;
    print_comma_sep fmt;
    pp_print_string fmt "Body: ";
    open_paren fmt;
    format_expr fmt print_a body;
    close_paren fmt;
    close_paren fmt
;;

let format_declgroup (fmt : Format.formatter) (print_a : 'a -> string) (d : 'a decl list) : unit =
  print_list
    fmt
    (fun fmt -> format_decl fmt print_a)
    d
    (fun fmt ->
      pp_print_break fmt 1 0;
      pp_print_string fmt "and ")
;;

let format_tydecl (fmt : Format.formatter) (print_a : 'a -> string) (td : 'a tydecl) : unit =
  match td with
  | TyDecl (name, tyargs_opt, args, a) ->
    open_label fmt "TyDecl" (print_a a);
    pp_print_string fmt ("Name: " ^ name);
    print_comma_sep fmt;
    (match tyargs_opt with
    | None -> ()
    | Some tyargs ->
      pp_print_string fmt "Type args: ";
      print_list fmt pp_print_string tyargs print_comma_sep);
    open_paren fmt;
    print_list fmt (fun fmt -> format_typ fmt print_a) args print_comma_sep;
    close_paren fmt;
    close_paren fmt
;;

let format_program (fmt : Format.formatter) (print_a : 'a -> string) (p : 'a program) : unit =
  match p with
  | Program (tydecls, decls, body, a) ->
    print_list fmt (fun fmt -> format_tydecl fmt print_a) tydecls (fun fmt -> pp_print_break fmt 1 0);
    print_list fmt (fun fmt -> format_declgroup fmt print_a) decls (fun fmt -> pp_print_break fmt 1 0);
    pp_print_break fmt 1 0;
    format_expr fmt print_a body
;;

let ast_of_pos_expr (e : sourcespan expr) : string =
  format_expr str_formatter string_of_sourcespan e;
  flush_str_formatter ()
;;

let ast_of_expr (e : 'a expr) : string =
  format_expr str_formatter (fun _ -> "") e;
  flush_str_formatter ()
;;

let ast_of_pos_decl (d : sourcespan decl) : string =
  format_decl str_formatter string_of_sourcespan d;
  flush_str_formatter ()
;;

let ast_of_decl (d : 'a decl) : string =
  format_decl str_formatter (fun _ -> "") d;
  flush_str_formatter ()
;;

let ast_of_pos_program (p : sourcespan program) : string =
  format_program str_formatter string_of_sourcespan p;
  flush_str_formatter ()
;;

let ast_of_program (p : 'a program) : string =
  format_program str_formatter (fun _ -> "") p;
  flush_str_formatter ()
;;
