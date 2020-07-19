open Printf
open Pretty
open Phases
open Exprs
open Assembly
open Errors
open ExtLib
open TypeCheck
open Desugar
open Rename
open Anf
open WellFormed

type 'a envt = (string * 'a) list

(*
All data types are tagged in order to support runtime type checking

Tags:
0bxx0   -->  Int63
0b111   -->  Boolean
0b101   -->  Closure
0b001   -->  Tuple 
0b011   -->  String
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

let tag_instructions_with_location (instrs : instruction list) (loc : sourcespan) : instruction list =
  let tag_instruction_with_location (instr : instruction) =
    match instr with
    | ILocationData (instr, locs) -> ILocationData (instr, loc :: locs)
    | instr -> ILocationData (instr, [ loc ])
  in
  List.map tag_instruction_with_location instrs
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
  | ALet (var_name, var_val, body, t) ->
    let prelude = compile_cexpr var_val (si + 1) env num_args was_typechecked in
    let stack_reg = RegOffset (~-si, RBP) in
    let body = compile_aexpr body (si + 1) ((var_name, stack_reg) :: env) num_args was_typechecked in
    let code =
      prelude
      @ [ IInstrComment (IMov (stack_reg, Reg RAX), sprintf "%s holds the variable %s" (arg_to_asm stack_reg) var_name)
        ]
      @ body
    in
    tag_instructions_with_location code (get_sourcespan t)
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
  @ compile_native_call "increment_exn_depths" []
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
    let end_label = sprintf "lambda_end_%d" (get_int tag) in
    let lambda_label = sprintf "lambda_%d" (get_int tag) in
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
      [ ILineComment (sprintf "Define lambda-%d {" (get_int tag)); IJmp (Label end_label); ILabel lambda_label ]
      @ generate_stack_setup body (List.length (free_vars @ reserved_args)) true
      @ [ ILineComment "Copy the free variables off the heap onto the stack "
        ; ILineComment "where they can be used by the body of the lambda {"
        ; ILineComment "Start by moving the last argument of the function which is the"
        ; ILineComment "function itself into RAX so we can unpack the closed over values:"
        ; IMov (Reg RAX, self_location)
        ; ILineComment "And detag it. Our invariant is that it is lambda so no need to tag check:"
        ; ISub (Reg RAX, HexConst closure_tag)
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
      @ [ IMov (Reg reserved_temp_register_1, Reg RAX) ]
      @ compile_native_call "decrement_exn_depths" []
      @ [ IMov (Reg RAX, Reg reserved_temp_register_1)
        ; ILeave
        ; IRet
        ; ILineComment (sprintf "} define lambda-%d" (get_int tag))
        ; ILabel end_label
        ; ILineComment
            (sprintf "Check if we have space on the heap to store our function of size %Ld: " function_size_on_heap)
        ]
      @ reserve function_size_on_heap tag
      @ [ ILineComment (sprintf "Store lambda-%d on the heap {" (get_int tag))
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
        ; ILineComment (sprintf "} store lambda-%d" (get_int tag))
        ]
    in
    let code = tag_instructions_with_location code (get_sourcespan tag) in
    code, used_heap_slots, List.combine reserved_args reserved_arg_heap_locations
  | CIf _
  | CPrim1 _
  | CPrim2 _
  | CTuple _
  | CImmExpr _
  | CApp _
  | CGetItem _
  | CSetItem _
  | CString _
  | CTryCatch _
  | CThrow _ -> raise (InternalCompilerError "compile_lam_helper called on a non-CLambda")

(* Compile the given cexpr to a list of instructions *)
and compile_cexpr (e : tag cexpr) (si : int) (env : arg envt) (num_args : int) (was_typechecked : bool)
    : instruction list
  =
  match e with
  | CString (s, tag) ->
    let string_size_on_heap = Int64.of_int (round_up_to_multiple_of_16 (String.length s + 1)) in
    let explode s = List.init (String.length s) (String.get s) in
    let code =
      [ ILineComment (sprintf "Allocate space for the string '%s' on the heap:" s) ]
      @ reserve string_size_on_heap tag
      @ [ ILineComment (sprintf "And put it on the heap:") ]
      @ List.flatten
          (List.mapi
             (fun i char ->
               [ IMov (Sized (BYTE_PTR, RegByteOffset (i, reserved_heap_reg)), Const (Int64.of_int (Char.code char))) ])
             (explode s))
      @ [ IMov (Sized (BYTE_PTR, RegByteOffset (String.length s, reserved_heap_reg)), Const 0L)
        ; ILineComment "Then tag it and move it to RAX"
        ; IMov (Reg RAX, Reg reserved_heap_reg)
        ; IAdd (Reg RAX, HexConst string_tag)
        ; IAdd (Reg reserved_heap_reg, Const string_size_on_heap)
        ]
    in
    tag_instructions_with_location code (get_sourcespan tag)
  | CIf (cond, thn, els, tag) ->
    let else_label = sprintf "if_false_%d" (get_int tag) in
    let done_label = sprintf "done_%d" (get_int tag) in
    let code =
      [ IMov (Reg RAX, compile_imm cond env) ]
      @ compile_assert_is_bool (Reg RAX) assertion_failed_if_not_bool was_typechecked
      @ [ ICmp (Reg RAX, const_true); IJne (Label else_label) ]
      @ compile_aexpr thn si env num_args was_typechecked
      @ [ IJmp (Label done_label); ILabel else_label ]
      @ compile_aexpr els si env num_args was_typechecked
      @ [ ILabel done_label ]
    in
    tag_instructions_with_location code (get_sourcespan tag)
  | CPrim1 (_, _, tag) ->
    tag_instructions_with_location (compile_prim1 e si env num_args was_typechecked) (get_sourcespan tag)
  | CPrim2 (_, _, _, tag) ->
    tag_instructions_with_location (compile_prim2 e si env num_args was_typechecked) (get_sourcespan tag)
  | CApp (_, _, _, tag) -> tag_instructions_with_location (compile_fun_app e env was_typechecked) (get_sourcespan tag)
  | CImmExpr e -> [ IMov (Reg RAX, compile_imm e env) ]
  | CTuple (exprs, tag) ->
    let tuple_size_on_heap = Int64.of_int (round_up_to_multiple_of_16 ((List.length exprs + 1) * 8)) in
    let code =
      [ ILineComment (sprintf "Check if we have space on the heap to store our tuple of size %Ld: " tuple_size_on_heap)
      ]
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
    in
    tag_instructions_with_location code (get_sourcespan tag)
  | CGetItem (expr, idx, tag) ->
    let code =
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
    in
    tag_instructions_with_location code (get_sourcespan tag)
  | CSetItem (tup, idx, new_val, tag) ->
    let code =
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
    in
    tag_instructions_with_location code (get_sourcespan tag)
  | CLambda (args, body, tag) ->
    let code, _, _ = compile_lam_helper e env was_typechecked [] [] None in
    code
  | CTryCatch (body, exn, catch, tag) ->
    let catch_start = sprintf "trycatch_start_%d" (get_int tag) in
    let catch_end = sprintf "trycatch_end_%d" (get_int tag) in
    let code =
      (* Add this exception handler to the exception handler table before running the body *)
      compile_native_call "add_to_exn_table" [ compile_exn exn; Label catch_start ]
      @ compile_aexpr body si env num_args was_typechecked
      (* After running the body, we stash RAX, clear this exception handler, and restore RAX *)
      @ [ IMov (Reg reserved_temp_register_1, Reg RAX) ]
      @ compile_native_call "clear_from_exn_table" [ Label catch_start ]
      @ [ IMov (Reg RAX, Reg reserved_temp_register_1)
          (* The body executed without error so jump past the exception handler *)
        ; IJmp (Label catch_end)
        ; ILabel catch_start
        ]
      (* Before we start executing the exception handler itself, we clear itself from the table
       * so that exception handlers don't catch exceptions that they themselves throw *)
      @ compile_native_call "clear_from_exn_table" [ Label catch_start ]
      @ compile_aexpr catch si env num_args was_typechecked
      @ [ ILabel catch_end ]
    in
    tag_instructions_with_location code (get_sourcespan tag)
  | CThrow (exn, tag) ->
    let done_leaving = sprintf "cthrow_done_leaving_%d" (get_int tag) in
    let loop_start = sprintf "cthrow_loop_start_%d" (get_int tag) in
    let code =
      (* Get the depth of the handler by calling into the runtime *)
      compile_native_call "get_exn_depth" [ compile_exn exn ]
      (* A small assembly gadget to `leave` n times *)
      @ [ ILabel loop_start
        ; ICmp (Reg RAX, Const 0L)
        ; IJe (Label done_leaving)
        ; ILeave
          (* After each leave instruction, we need to decrement the depths of all the handlers
           * to keep the table of depths up to date. Stash RAX so it doesn't get clobbered. *)
        ; IMov (Reg reserved_temp_register_1, Reg RAX)
        ]
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
    in
    tag_instructions_with_location code (get_sourcespan tag)

(* Compile the given immexpr to a list of instructions *)
and compile_imm (e : tag immexpr) (env : arg envt) : arg =
  match e with
  | ImmNum (n, _) -> Const (Int64.shift_left n 1)
  | ImmBool (true, _) -> const_true
  | ImmBool (false, _) -> const_false
  | ImmId (x, _) -> find env x
  | ImmNil _ -> const_nil

and compile_exn (exn : string) : arg =
  let rec find x lst =
    match lst with
    | [] -> raise (InternalCompilerError (sprintf "Failed to find exception %s" x))
    | first :: rest -> if x = first then 0 else 1 + find x rest
  in
  Const (Int64.of_int (find exn !global_defined_exns))

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
    let found_bool = sprintf "_is_bool_found_bool_%d" (get_int tag) in
    let done_label = sprintf "_is_bool_done_%d" (get_int tag) in
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
    let true_label = sprintf "is_tuple_true_%d" (get_int tag) in
    let done_label = sprintf "is_tuple_done_%d" (get_int tag) in
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
  | ( CIf _
    | CPrim2 _
    | CApp _
    | CImmExpr _
    | CSetItem _
    | CTuple _
    | CGetItem _
    | CLambda _
    | CString _
    | CTryCatch _
    | CThrow _ ) as err ->
    raise (InternalCompilerError (sprintf "compile_prim1 called on a non-prim1: %s" (string_of_cexpr err)))

(* Compile the given cexpr which must be a prim2 to a list of instructions *)
and compile_prim2 (e : tag cexpr) (si : int) (env : arg envt) (num_args : int) (was_typechecked : bool)
    : instruction list
  =
  match e with
  | CPrim2 (((Plus | Minus | Times | Divides) as op), lhs, rhs, tag) ->
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
      | Divides ->
        [ ISar (Reg reserved_temp_register_1, Const 1L)
        ; ISar (Reg reserved_temp_register_2, Const 1L)
        ; IMov (Reg RAX, Reg reserved_temp_register_1)
        ; ICqo
        ; IIDiv (Reg reserved_temp_register_2)
        ; IShl (Reg RAX, Const 1L)
        ]
      | err ->
        raise
          (InternalCompilerError
             (sprintf "Found a not plus/minus/times while compiling a plus/minus/times: %s" (string_of_op2 err))))
    @ [ IJo (Label overflow_label) ]
  (* And, Or short circuit evaluation of their LHS and RHS *)
  | CPrim2 (Or, lhs, rhs, tag) ->
    let done_label = sprintf "or_done_%d" (get_int tag) in
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
    let done_label = sprintf "and_done_%d" (get_int tag) in
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
    let cmp_fail_label = sprintf "_cmp_fail_%d" (get_int tag) in
    let cmp_done_label = sprintf "_cmp_done_%d" (get_int tag) in
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
  | ( CIf _
    | CPrim1 _
    | CApp _
    | CImmExpr _
    | CSetItem _
    | CTuple _
    | CGetItem _
    | CLambda _
    | CString _
    | CTryCatch _
    | CThrow _ ) as err ->
    raise (InternalCompilerError (sprintf "compile_prim2 called on a non-prim2: %s" (string_of_cexpr err)))

(* Assert that the given argument is an int. If it is not, jump to the given label which 
 * should be a label that exits the program with the correct error message. Uses a provided
 * label so that this function can be used to assert that arguments are an int in different
 * contexts. Note that if the arg is a Const that is not an int, this does *not* raise a 
 * compile time exception and instead generates assembly to raise a runtime error. *)
and compile_assert_is_int (v : arg) (error_label : string) (was_typechecked : bool) : instruction list =
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
  | Sized (_, arg) -> compile_assert_is_int arg error_label was_typechecked

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
    | Sized (_, arg) -> compile_assert_has_tag tag arg error_label was_typechecked)

and reserve (size : int64) (tag : tag) =
  let ok = sprintf "memcheck_ok_%d" (get_int tag) in
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
            , "Fill in the padded argument with a zero for padding" )
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
  | ( CTuple _
    | CIf _
    | CPrim1 _
    | CPrim2 _
    | CGetItem _
    | CSetItem _
    | CLambda _
    | CImmExpr _
    | CString _
    | CTryCatch _
    | CThrow _ ) as err ->
    raise (InternalCompilerError ("compile_fun_app called on a non-CApp: " ^ string_of_cexpr err))
;;

let compile_prog (was_typechecked : bool) (anfed : tag aprogram) : string =
  match anfed with
  | AProgram ([], body, tag) ->
    let externs =
      [ "error"
      ; "native#print"
      ; "print_stack"
      ; "try_gc"
      ; "STACK_BOTTOM"
      ; "STACK_SIZE"
      ; "native#string_len"
      ; "native#string_append"
      ; "native#char_at"
      ; "native#input"
      ; "native#equal"
      ; "HEAP_END"
      ; "add_to_exn_table"
      ; "get_exn_depth"
      ; "get_exn_location"
      ; "clear_from_exn_table"
      ; "clear_exn_table_before_jmp"
      ; "increment_exn_depths"
      ; "decrement_exn_depths"
      ]
    in
    let prelude =
      "section .text\nglobal our_code_starts_here\nglobal EXCEPTION_NAMES\n"
      ^ String.concat "\n" (List.map (fun x -> "extern " ^ x) externs)
    in
    (* Postlude for our program that contains labels used for error handling *)
    let postlude =
      [ ILeave
      ; IRet
      ; ILineComment "Error labels: "
      ; ILabel assertion_failed_arith_not_num
      ; IMov (Reg RDI, Const err_ARITH_NOT_NUM)
      ; ICall (Label "error")
      ; ILabel assertion_failed_comparison_not_num
      ; IMov (Reg RDI, Const err_COMP_NOT_NUM)
      ; ICall (Label "error")
      ; ILabel assertion_failed_if_not_bool
      ; IMov (Reg RDI, Const err_IF_NOT_BOOL)
      ; ICall (Label "error")
      ; ILabel assertion_failed_logic_not_bool
      ; IMov (Reg RDI, Const err_LOGIC_NOT_BOOL)
      ; ICall (Label "error")
      ; ILabel overflow_label
      ; IMov (Reg RDI, Const err_OVERFLOW)
      ; ICall (Label "error")
      ; ILabel assertion_failed_not_tuple
      ; IMov (Reg RDI, Const err_GET_NOT_TUPLE)
      ; ICall (Label "error")
      ; ILabel assertion_failed_get_index_too_large
      ; IMov (Reg RDI, Const err_GET_HIGH_INDEX)
      ; ICall (Label "error")
      ; ILabel assertion_failed_get_index_too_small
      ; IMov (Reg RDI, Const err_GET_LOW_INDEX)
      ; ICall (Label "error")
      ; ILabel assertion_failed_index_nil
      ; IMov (Reg RDI, Const err_NIL_DEREF)
      ; ICall (Label "error")
      ; ILabel assertion_failed_no_more_heap_space
      ; IMov (Reg RDI, Const err_OUT_OF_MEMORY)
      ; ICall (Label "error")
      ; ILabel assertion_failed_not_a_closure
      ; IMov (Reg RDI, Const err_CALL_NOT_CLOSURE)
      ; ICall (Label "error")
      ; ILabel assertion_failed_arity_error
      ; IMov (Reg RDI, Const err_CALL_ARITY_ERR)
      ; ICall (Label "error")
      ; ILabel assertion_failed_out_of_stack_memory
      ; IMov (Reg RDI, Const err_OUT_OF_STACK_MEMORY)
      ; ICall (Label "error")
      ]
    in
    let postlude =
      postlude
      @ List.mapi (fun i e -> StringConstant (sprintf "exception_%d" i, e)) !global_defined_exns
      @ [ ArrayConstant ("EXCEPTION_NAMES", List.mapi (fun i _ -> sprintf "exception_%d" i) !global_defined_exns) ]
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
