(* An interpreter for Cobra. Written mostly for fun but it has the side benefit of allowing us to fuzz
   our compiler and compare the output to the output from the interpreter (where the interpreter is 
   simpler and thus (hopefully) less likely to have bugs). This interpreter does not implement overflow
   handling and the behavior of this interpreter is undefined in any overflow conditions.  *)
open Exprs
open Printf
open ExtLib
open Runner
open Compile
open Pretty
open Errors

(* Convert the given expression (which must be a number or bool) to a string *)
let rec expr_val_to_string (e : 'a expr) : string =
  match e with
  | ENumber (n, _) -> sprintf "%Ld" n
  | EBool (b, _) -> sprintf "%b" b
  | ENil _ -> "nil"
  | ETuple (exprs, _) -> "(" ^ String.join ", " (List.map expr_val_to_string exprs) ^ ")"
  | ELambda (args, body, _) -> sprintf "<function arity=%d>" (List.length args)
  | _ -> failwith "ice6"
;;

let rec get_fun (fun_name : string) (functions : 'a decl list) : 'a decl =
  match functions with
  | (DFun (n, _, _, _, _) as f) :: rest when n = fun_name -> f
  | _ :: rest -> get_fun fun_name rest
  | [] -> failwith ("function not found: " ^ fun_name)
;;

(* Eval the given expr with the given environment *)
let rec eval (expr : 'a expr) (env : (string * unit expr) list) (functions : 'a decl list) : unit expr =
  match expr with
  | EBool (b, _) -> EBool (b, ())
  | ENumber (n, _) -> ENumber (n, ())
  | ENil (t, _) -> ENil (t, ())
  | EPrim1 (Add1, _, b, _) -> ENumber (Int64.add (eval_to_num b env functions) 1L, ())
  | EPrim1 (Sub1, _, b, _) -> ENumber (Int64.sub (eval_to_num b env functions) 1L, ())
  | EPrim1 (IsBool, _, b, _) ->
    (match eval b env functions with
    | ENumber _ -> EBool (false, ())
    | ETuple _ -> EBool (false, ())
    | EBool _ -> EBool (true, ())
    | _ -> failwith "ice4")
  | EPrim1 (IsNum, _, b, _) ->
    (match eval b env functions with
    | ENumber _ -> EBool (true, ())
    | EBool _ -> EBool (false, ())
    | ETuple _ -> EBool (false, ())
    | _ -> failwith "ice5")
  | EPrim1 (IsTuple, _, b, _) ->
    (match eval b env functions with
    | ETuple _ -> EBool (true, ())
    | ENumber _ -> EBool (false, ())
    | EBool _ -> EBool (false, ())
    | _ -> failwith "ice5")
  | EPrim1 (Not, _, b, _) -> EBool (not (eval_to_bool b env functions), ())
  | EPrim1 (PrintStack, _, _, _) -> failwith "nyi"
  | EPrim2 (Plus, _, a, b, _) -> ENumber (Int64.add (eval_to_num b env functions) (eval_to_num a env functions), ())
  | EPrim2 (Minus, _, a, b, _) ->
    ENumber (Int64.neg (Int64.sub (eval_to_num b env functions) (eval_to_num a env functions)), ())
  | EPrim2 (Times, _, a, b, _) -> ENumber (Int64.mul (eval_to_num b env functions) (eval_to_num a env functions), ())
  | EPrim2 (And, _, a, b, _) ->
    let lhs = eval_to_bool a env functions in
    if lhs = false then EBool (false, ()) else EBool (eval_to_bool b env functions, ())
  | EPrim2 (Or, _, a, b, _) ->
    let lhs = eval_to_bool a env functions in
    if lhs = true then EBool (true, ()) else EBool (eval_to_bool b env functions, ())
  | EPrim2 (Greater, _, a, b, _) -> EBool (eval_to_num b env functions < eval_to_num a env functions, ())
  | EPrim2 (GreaterEq, _, a, b, _) -> EBool (eval_to_num b env functions <= eval_to_num a env functions, ())
  | EPrim2 (Eq, _, a, b, _) ->
    (match eval a env functions, eval b env functions with
    | (ETuple _ as a_e), (ETuple _ as b_e) -> EBool (a_e == b_e, ())
    | a_e, b_e -> EBool (a_e = b_e, ()))
  | EPrim2 (Less, _, a, b, _) -> EBool (eval_to_num b env functions > eval_to_num a env functions, ())
  | EPrim2 (LessEq, _, a, b, _) -> EBool (eval_to_num b env functions >= eval_to_num a env functions, ())
  | EId (n, _) -> List.assoc n env
  | ELet ((BName (n, _, _), e, _) :: rest, b, _) ->
    eval (ELet (rest, b, ())) ([ n, eval e env functions ] @ env) functions
  | ELet ((BBlank (_, _), e, _) :: rest, b, _) ->
    let _ = eval e env functions in
    eval (ELet (rest, b, ())) env functions
  | ELet ((BTuple (_, _), e, _) :: rest, b, _) -> failwith "nyi"
  | ELet ([], b, _) -> eval b env functions
  | EIf (c, t, f, _) -> if eval_to_bool c env functions then eval t env functions else eval f env functions
  | EApp (EId ("equal", _), arg_values, _, _) ->
    if List.length arg_values != 2
    then failwith "ice: equal called on too many args"
    else (
      match arg_values with
      | [ arg1; arg2 ] -> EBool (eval arg2 env functions = eval arg1 env functions, ())
      | _ -> failwith "ice: equal called on too many args")
  | EApp (EId ("print", _), arg_values, _, _) ->
    if List.length arg_values != 1
    then failwith "ice: print called on too many args"
    else (
      let arg = List.nth arg_values 0 in
      match eval arg env functions with
      | EBool (b, _) ->
        printf "%b\n" b;
        EBool (b, ())
      | ENumber (n, _) ->
        printf "%Ld\n" n;
        ENumber (n, ())
      | ENil (t, _) ->
        printf "nil";
        ENil (t, ())
      | ETuple _ as tup ->
        printf "%s\n" (expr_val_to_string tup);
        tup
      | _ -> failwith "ice1")
  | EApp (EId (fun_name, _), arg_values_unevaled, _, _) ->
    let (DFun (_, tagged_arg_names, _, body, _)) = get_fun fun_name functions in
    let arg_names =
      List.map
        (fun b ->
          match b with
          | BName (n, _, _) -> n
          | BBlank (_, _) -> "_"
          | BTuple _ -> failwith "nyi")
        tagged_arg_names
    in
    let arg_values = List.map (fun a -> eval a env functions) arg_values_unevaled in
    let new_env = List.combine arg_names arg_values in
    eval body new_env functions
  | EApp _ -> raise (NotYetImplemented "interpreter.ml only implements calling decls, not lambdas!")
  | EGenApp (fun_name, _, arg_values_unevaled, call_type, _) ->
    eval (EApp (fun_name, arg_values_unevaled, call_type, ())) env functions
  | EAnnot (expr, _, _) -> eval expr env functions
  | ESeq (e1, e2, _) ->
    let _ = eval e1 env functions in
    eval e2 env functions
  | ETuple (exprs, _) -> ETuple (List.map (fun e -> eval e env functions) exprs, ())
  | EGetItem (expr, idx, len, _) ->
    let evaled_tuple_contents = eval_to_tuple expr env functions in
    if List.length evaled_tuple_contents != len then failwith "incorrect len!" else List.nth evaled_tuple_contents idx
  | ESetItem (expr, idx, len, new_val, _) ->
    let evaled_tuple_contents = eval_to_tuple expr env functions in
    if List.length evaled_tuple_contents != len
    then failwith "incorrect len!"
    else ETuple (List.mapi (fun i x -> if i = idx then eval new_val env functions else x) evaled_tuple_contents, ())
  | ELambda _ -> raise (NotYetImplemented "interpreter.ml does not handle lambdas!")
  | ELetRec _ -> raise (NotYetImplemented "interpreter.ml does not handle letrec!")

(* Eval the given expression to a number and crash if it is not a number *)
and eval_to_num (e : 'a expr) (env : (string * 'a expr) list) (functions : 'a decl list) : int64 =
  match eval e env functions with
  | ENumber (n, _) -> n
  | _ -> failwith ("type error: failed to eval to num: " ^ string_of_expr e)

(* Eval the given expression to a bool and crash if it is not a bool *)
and eval_to_bool (e : 'a expr) (env : (string * 'a expr) list) (functions : 'a decl list) : bool =
  match eval e env functions with
  | EBool (b, _) -> b
  | _ -> failwith "type error: failed to eval to bool"

(* Eval the given expression to a tuple and crash if it is not a tuple *)
and eval_to_tuple (e : 'a expr) (env : (string * 'a expr) list) (functions : 'a decl list) : 'a expr list =
  match eval e env functions with
  | ETuple (es, _) -> es
  | _ -> failwith "type error: failed to eval to tuple"

and eval_prog (p : 'a program) : unit expr =
  match p with
  (* Since our interpreter isn't concerned with giving correct error messages, we just
     flatten the list of decls and ignore the groups *)
  | Program (tydecls, decls, expr, _) -> eval expr [] (List.flatten decls)
;;

(* Main entrypoint. Only runs if there is a single argument specified on argv. Evals the 
   given file and outputs the result to stdout. *)
let () =
  if Array.length Sys.argv == 2
  then (
    let data = input_file Sys.argv.(1) in
    let evaled = eval_prog (untagP (parse_string Sys.argv.(1) data)) in
    printf "%s\n" (expr_val_to_string evaled))
  else ()
;;
