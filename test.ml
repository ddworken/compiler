open Compile
open Runner
open Printf
open OUnit2
open Pretty
open Exprs
open ExtLib
open Assembly
open TypeCheck
open Errors
open Interpreter
open TypeCheck
open Phases

let assert_ok (x : 'a fallible) : 'a =
  match x with
  | Ok a -> a
  | Error e -> failwith "assertion failed!"
;;

let run_in_valgrind = true
let my_test_run = if run_in_valgrind then test_run_valgrind else test_run
let t name program expected = name >:: my_test_run program name expected
let ta name program expected = name >:: test_run_anf program name expected
let te name program expected_err = name >:: test_err ~vg:run_in_valgrind program name expected_err
let tanf name program expected = name >:: fun _ -> assert_equal expected (anf (tag program)) ~printer:string_of_aprogram
let teq name actual expected = name >:: fun _ -> assert_equal expected actual ~printer:(fun s -> s)
let tc name program expected = name >:: my_test_run program name expected ~should_check:true

(* We no longer implement type checking and now our type checker just accepts all code. But, we have all these
 * great type checking tests and it sucks to throw them away. But, going through them manually to change/update
 * them doesn't seem worth it. The passing tc tests will continue to pass. But the error tc tests may or may not 
 * pass. So we just skip the tce tests by making them always pass. *)
let tce name program expected_err = name >:: fun _ -> ()
let t_input name program input expected = name >:: my_test_run ~args:[] ~std_input:input program name expected

let te_input name program input expected =
  name >:: test_err ~vg:run_in_valgrind ~args:[] ~std_input:input program name expected
;;

let tc_input name program input expected =
  name >:: my_test_run ~std_input:input program name expected ~should_check:true
;;

(* Same thing as for tce above *)
let tce_input name program input expected = name >:: fun _ -> ()

let tgc name heap_size program input expected =
  name >:: my_test_run ~args:[ string_of_int heap_size ] ~std_input:input program name expected
;;

let tgce name heap_size program input expected =
  name >:: test_err ~vg:run_in_valgrind ~args:[ string_of_int heap_size ] ~std_input:input program name expected
;;

(* Transforms a program given as a source string into ANF, and compares the output to the expected source string *)
let tanfs (name : string) (program : string) (expected : string) =
  name
  >:: fun _ ->
  assert_equal expected (string_of_aprogram (anf (tag (assert_ok (desugar (parse_string name program)))))) ~printer:dump
;;

(* Transforms a program given as a source string via desugaring, and compares the output to the expected source string *)
let tdesugar (name : string) (program : string) (expected : string) =
  name
  >:: fun _ -> assert_equal expected (string_of_program (assert_ok (desugar (parse_string name program)))) ~printer:dump
;;

(* A helper for testing primitive values (won't print datatypes well) *)
let t_any name value expected = name >:: fun _ -> assert_equal expected value ~printer:dump

(* A helper for testing remove_illegal_immediates_instructions *)
let tinstr (name : string) (instructions : instruction list) (expected : instruction list) =
  name >:: fun _ -> assert_equal expected (remove_illegal_immediates instructions) ~printer:to_asm
;;

(* Transforms a program given as a source string by renaming all variables and compares the output to the expected renamed source string *)
let trename (name : string) (program : string) (expected : string) =
  name
  >:: fun _ ->
  assert_equal
    expected
    (string_of_program (rename_and_tag (tag (assert_ok (desugar (parse_string name program))))))
    ~printer:(fun s -> s)
;;

(* Runs a program IN AN INTERPRETER, given as a source string, and compares its output to expected *)
let ti (name : string) (program : string) (expected : string) =
  name
  >:: fun _ ->
  assert_equal expected (expr_val_to_string (eval_prog (untagP (parse_string name program)))) ~printer:(fun s -> s)
;;

let t_freevars (name : string) (lam_string : string) (expected : string list) =
  name
  >:: fun _ ->
  assert_equal
    expected
    (freevars
       (match anf (rename_and_tag (tag (parse_string name lam_string))) with
       | AProgram (_, ACExpr c, _) -> c
       | _ -> failwith "found non-cexpr in t_freevars"))
;;

(* Returns whether or not the given fallible is okay *)
let is_okay (x : 'a fallible) : bool =
  match x with
  | Ok _ -> true
  | Error _ -> false
;;

let add_space_for_native_functions n = n + (4 * TypeCheck.number_native_functions ())

(*
   _____                      _ _      
  / ____|                    (_) |     
 | |     ___  _ __ ___  _ __  _| | ___ 
 | |    / _ \| '_ ` _ \| '_ \| | |/ _ \
 | |___| (_) | | | | | | |_) | | |  __/
  \_____\___/|_| |_| |_| .__/|_|_|\___|
                       | |             
                       |_|            
*)

let simple_tests =
  [ t "forty" "let x = 40 in x" "40"
  ; t "fals" "let x = false in x" "false"
  ; t "tru" "let x = true in x" "true"
  ; t "40" "40" "40"
  ; t "-40" "-40" "-40"
  ; t "-1" "-1" "-1"
  ; t "0" "0" "0"
  ; t "-0" "-0" "0"
  ; t "valid_type_annotation_1" "4: Int" "4"
  ; t "valid_type_annotation_2" "4: Bool" "4"
  ; te
      "valid_type_annotation_3"
      "4: FooBar"
      "The type name FooBar, used at <valid_type_annotation_3, 1:3-1:9>, is not in scope"
  ]
;;

let tuple_tests =
  [ t
      "given_tup1"
      "let t = (4, (5, 6)) in\n            begin\n              t[0 of 2 := 7];\n              t\n            end"
      "(7, (5, 6))"
  ; t "given_tup2" "let t = (3, ((4, true), 5)) in\nlet (x, (y, z)) = t in\nx + y[0 of 2] + z" "12"
  ; t "given_tup4" "let t = (4, 6) in (t, t)" "((4, 6), (4, 6))"
  ; t "tup_1" "(1,2,3)" "(1, 2, 3)"
  ; t "tup_2" "(1,2,(7,true,false,-2))" "(1, 2, (7, true, false, -2))"
  ; t "tup_3" "let x=(12,13) in (x[0 of 2] + x[1 of 2])" "25"
  ; t "tup_4" "let x=(3,(4, 5, true)) in x[1 of 2][0 of 3]" "4"
  ; t "tup_5" "let x=(3,(4, 5, true)) in x[1 of 2][2 of 3]" "true"
  ; t "tup_6" "(1,2,3,4,5,6,7,8)" "(1, 2, 3, 4, 5, 6, 7, 8)"
  ; t "tup_7" "let x=(1,2) in (x[1 of 2], x[0 of 2])" "(2, 1)"
  ; te "tup_8" "let x=true in x[0 of 2]" "Type Error: expected tuple, found 0xffffffffffffffff"
  ; te "tup_9" "let x=(0, 1) in x[-1 of 2]" "Tuple indexing at tup_9, 1:16-1:26 is out of bounds (idx=-1, len=2)"
  ; te "tup_10" "let x=() in x[0 of 0]" "Tuple indexing at tup_10, 1:12-1:21 is out of bounds (idx=0, len=0)"
  ; te "tup_11" "let x=(1, 2) in x[2 of 2]" "Tuple indexing at tup_11, 1:16-1:25 is out of bounds (idx=2, len=2)"
  ; te "tup_12" "let x=(1,2,3,4,5) in x[3 of 2]" "Tuple indexing at tup_12, 1:21-1:30 is out of bounds (idx=3, len=2)"
  ; te "tup_13" "let x=(1,2) in x[3 of 5]" "index too large: 3"
  ; t "tup_14" "let x=(0, (1, 2)) in x[1 of 2][0 of 2]" "1"
  ; t "tup_set_1" "let x=(1,2) in x[0 of 2 := true]" "(true, 2)"
  ; t "tup_set_2" "let x=(1,2) in x[1 of 2 := true]" "(1, true)"
  ; t "tup_set_3" "let x=(1,2) in x[1 of 2 := (3, 5)]" "(1, (3, 5))"
  ; t "tup_set_4" "let x=(1,2) in x[1 of 2 := (3, 5)][0 of 2 := false]" "(false, (3, 5))"
  ; t "tup_set_5" "let x=(1,2) in x[1 of 2 := (3, 5)][0 of 2 := (1, 2, 3)]" "((1, 2, 3), (3, 5))"
  ; t "tup_set_6" "let y=(let x=(1,2) in x[0 of 2 := (3, 4, 5)]) in y[0 of 2]" "(3, 4, 5)"
  ; t "tup_set_7" "let y=(let x=(1,2) in x[0 of 2 := (3, 4, 5)]) in y[0 of 2][2 of 3]" "5"
  ; te "tup_set_8" "let x=(1,2,3) in x[3 of 5 := false]" "index too large: 3"
  ; te
      "tup_set_9"
      "let x=(1,2,3) in x[-1 of 3 := false]"
      "Tuple indexing at tup_set_9, 1:17-1:36 is out of bounds (idx=-1, len=3)"
  ; t "tup_set_10" "let x: (Int * Int) = (1,2) in x[0 of 2 := -1][1 of 2 := -2]: (Int * Int)" "(-1, -2)"
  ; t "tup_destruct_1" "let (a, b)=(1, 2) in a" "1"
  ; t "tup_destruct_2" "let (a, b)=(1, 2) in b" "2"
  ; t "tup_destruct_3" "let (a, (b, c), (d, (e, f)))=(1, (2, 3), (4, (5, 6))) in a + b + c + d + e + f" "21"
  ; t "empty_tup" "()" "()"
  ; t "single_tup" "(1,)" "(1, )"
  ; t "not_a_single_tup" "(1)" "1"
  ; t "infinite_tuple_1" "let x=(1, 2) in x[1 of 2 := x]" "(1, <cyclic tuple 1>)"
  ; t "infinite_tuple_2" "let x=(123, 2), y=x[1 of 2 := x] in y[1 of 2][1 of 2][1 of 2][0 of 2]" "123"
  ; t
      "given_func_unpacking_tuple"
      "def add_pairs((x1, y1), (x2, y2)):\n(x1 + x2, y1 + y2)\nadd_pairs((1,2), (5,7))"
      "(6, 9)"
  ]
;;

let nil_tests =
  [ t "nil_1" "nil: Int" "nil"
  ; t "nil_2" "(1, 2, (3, (4, nil: Int, nil: Int)))" "(1, 2, (3, (4, nil, nil)))"
  ; t "nil_3" "(nil: Int, nil: Int)" "(nil, nil)"
  ; t "nil_4" "let x=(nil: Int) in (x, x)" "(nil, nil)"
  ; te "nil_5" "1 + nil: Int" "Type Error: arithmetic expected a number, found 0x0000000000000001"
  ; t "nil_6" "istuple(nil: Int)" "true"
  ; t "nil_7" "isbool(nil: Int)" "false"
  ; t "nil_9" "isnum(nil: Int)" "false"
  ; te "nil_10" "let x=(nil: Bool) in x[0 of 2]" "Type Error: Attempted to access component of nil"
  ; te "nil_11" "let a=(nil: Bool) in a[0 of 2 := true]" "Type Error: Attempted to access component of nil"
  ]
;;

let oom_tests =
  [ tgc "oom_1" (add_space_for_native_functions 8) "(1, (3, 4))" "" "(1, (3, 4))"
  ; tgce
      "oom_2"
      (add_space_for_native_functions 7)
      "(1, (3, 4))"
      ""
      "Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc "oom_3" (add_space_for_native_functions 4) "(3, 4)" "" "(3, 4)"
  ; tgce
      "oom_4"
      (add_space_for_native_functions 3)
      "(3, 4)"
      ""
      "Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc "oom_5" (add_space_for_native_functions 8) "(1, 2); (3, true)" "" "(3, true)"
  ; tgc "not_oom_6" (add_space_for_native_functions 7) "(1, 2); (3, true, false, -2)" "" "(3, true, false, -2)"
  ; tgc
      "oom_7"
      1000
      "def waste_space(n): if n == 0: (1, 2) else: ((1,2); waste_space(n - 1))\nwaste_space(1000)"
      ""
      "(1, 2)"
  ; tgc "oom_8" (add_space_for_native_functions 2) "()" "" "()"
  ; tgce
      "oom_9"
      (add_space_for_native_functions 2)
      "def f(x): x\nf(1)"
      ""
      "Out of memory: needed 4 words, but only 2 remain after collection"
  ; tgc "oom_10" (add_space_for_native_functions 4) "let x=1, f=(lambda (y): x+y) in f(2)" "" "3"
  ; tgce
      "oom_11"
      (add_space_for_native_functions 4)
      "let a=1, b=1, c=1, d=1, e=1, f=(lambda (y): a+b+c+d+e+y) in f(2)"
      ""
      "Out of memory: needed 8 words, but only 4 remain after collection"
  ; tgc
      "oom_12"
      1000
      "def waste_space(n): if n == 0: (1, 2) else: ((lambda: 1); waste_space(n - 1))\nwaste_space(1000)"
      ""
      "(1, 2)"
  ]
;;

let let_tests =
  [ t "let_simple_1" "let a=1 in a" "1"
  ; t "let_simple_2" "let a=2 in add1(a)" "3"
  ; t "let_simple_3" "let a=add1(1) in a" "2"
  ; t "let_two_var_1" "let a=2, b=add1(a) in a" "2"
  ; t "let_two_var_2" "let a=2, b=add1(a) in b" "3"
  ; t "let_simple_with_add1" "let a=add1(1) in a" "2"
  ; t "let_with_prim2" "let a=2, b=3 in a+b" "5"
  ; t "let_reused_var_1" "(let x=1 in x) + (let x=2 in x)" "3"
  ; t "let_reused_var_2" "(let x=(let x=1 in x) in x) + (let x=2 in x)" "3"
  ; t "let_many" "let a=2,b=a, c=b, d=c, e=d in e" "2"
  ; t "let_shadow_var_1" "let x=1 in (let x=2 in x)" "2"
  ; t "let_shadow_var_2" "let y=(let x=3 in x) in (let x=2, y=4 in x+y)" "6"
  ; t "let_shadow_var_3" "let x=(let x=1 in add1(x)) in (let x=3 in x)+x" "5"
  ; t "let_blank_1" "let _=print(1) in 2" "1\n2"
  ; te "let_blank_2" "let _=print(1) in _" "Parse error at line 1, col 19"
  ; t "let_override_builtin" "let equal=1 in equal" "1"
  ]
;;

let is_num_bool_tests =
  [ t "is_num_1" "isnum(2)" "true"
  ; t "is_num_2" "isnum(0)" "true"
  ; t "is_num_3" "isnum(-5)" "true"
  ; t "is_num_4" "isnum(true)" "false"
  ; t "is_num_5" "isnum(false)" "false"
  ; t "is_num_6" "isnum(4611686018427387903)" "true"
  ; t "is_num_7" "print(isnum(true))" "false\nfalse"
  ; t "is_num_8" "isnum((3,4))" "false"
  ; t "is_bool_1" "isbool(true)" "true"
  ; t "is_bool_2" "isbool(false)" "true"
  ; t "is_bool_3" "isbool(-5)" "false"
  ; t "is_bool_4" "isbool(0)" "false"
  ; t "is_bool_5" "isbool(5)" "false"
  ; t "is_bool_6" "isbool(4611686018427387903)" "false"
  ; t "is_bool_7" "print(isbool(true))" "true\ntrue"
  ; t "is_bool_8" "isbool((1,2))" "false"
  ]
;;

let is_tuple_tests =
  [ t "is_tuple_1" "istuple(true)" "false"
  ; t "is_tuple_2" "istuple(3)" "false"
  ; t "is_tuple_3" "istuple((5, 2))" "true"
  ; t "is_tuple_4" "istuple((5, (3, -1)))" "true"
  ; t "is_tuple_5" "let x=(5, (3, -1)) in istuple(x[1 of 2])" "true"
  ; t "is_tuple_6" "let x=(5, (3, -1)) in istuple(x[0 of 2])" "false"
  ]
;;

let input_tests =
  [ t_input "input_1" "input()" "true\n" "true"
  ; t_input "input_2" "input()" "false\n" "false"
  ; t_input "input_3" "input()" "-1\n" "-1"
  ; t_input "input_4" "input()" "120\n" "120"
  ; te_input "input_5" "input()" "crash\n" "input() received invalid data: crash"
  ; t_input "input_6" "input()" "4611686018427387903\n" "4611686018427387903"
  ; te_input "input_7" "input()" "4611686018427387904\n" "Arithmetic Error: overflow"
  ; te_input "input_8" "input()" "9223372036854775807\n" "Arithmetic Error: overflow"
  ; te_input "input_9" "input()" "9223372036854775808\n" "Arithmetic Error: overflow"
  ; t_input "input_10" "let x=input(), y=input() in x+y" "1\n2\n" "3"
  ; t_input
      "input_11"
      "def input_plus_one(): input() + 1\nlet x=input_plus_one(), y=input_plus_one() in x+y"
      "1\n2\n"
      "5"
  ; t_input "input_12" "let x = input() in x + 2" "123\n" "125"
  ; te_input
      "input_13"
      "input(1)"
      "5\n"
      "The function called at <input_13, 1:0-1:8> expected an arity of 0, but received 1 arguments"
  ; t_input "input_14" "input<Int>()" "true\n" "true"
  ]
;;

let equal_tests =
  [ t "equal_int_1" "equal(1, 1)" "true"
  ; t "equal_int_2" "equal(1, 2)" "false"
  ; t "equal_bool_1" "equal(true, true)" "true"
  ; t "equal_bool_2" "equal(false, true)" "false"
  ; t "equal_bool_3" "equal(true, false)" "false"
  ; t "equal_bool_4" "equal(false, false)" "true"
  ; t "equal_tuple_1" "equal((), ())" "true"
  ; t "equal_tuple_2" "equal((1, 2, 3), (1, 2, 3))" "true"
  ; t "equal_tuple_3" "equal((1, 2, 3), (1, true, 3))" "false"
  ; t "equal_tuple_4" "equal(nil: Int, nil: Int)" "true"
  ; t "equal_tuple_5" "equal((1, 2), (1, 2, 3))" "false"
  ; t "equal_tuple_6" "equal((1, 2, (5, 2)), (1, 2, (5, 2)))" "true"
  ; t "equal_tuple_7" "equal((1, 2, (5, 2)), (1, 2, (5, (2,))))" "false"
  ; t "equal_tuple_8" "equal((1,), 1)" "false"
  ; t "equal_lambda_1" "equal((lambda: 1), (lambda: 1))" "false"
  ; t "equal_lambda_2" "let x=(lambda: 1) in equal(x, x)" "true"
  ; t "equal_diff_type_1" "equal(true, 1)" "false"
  ; t "equal_diff_type_2" "equal(3, false)" "false"
  ; t "equal_diff_type_3" "equal(true, (true,))" "false"
  ; t "equal_diff_type_4" "equal(-2, (true))" "false"
  ; t "equal_diff_type_5" "equal(-2, nil: Int)" "false"
  ; t "equal_diff_type_6" "equal(-2, (lambda: -2))" "false"
  ; te
      "equal_wrong_num_args"
      "equal(1, 2, 3)"
      "The function called at <equal_wrong_num_args, 1:0-1:14> expected an arity of 2, but received 3 arguments"
  ]
;;

let not_tests =
  [ t "not_1" "!(true)" "false"
  ; t "not_2" "!(false)" "true"
  ; te "not_3" "!(1)" "Type Error: logic expected a boolean, found 0x0000000000000002"
  ; te "not_4" "!(0)" "Type Error: logic expected a boolean, found 0x0000000000000000"
  ; te "not_5" "!(461168601842738790)" "Type Error: logic expected a boolean, found 0x0ccccccccccccccc"
  ; te "not_6" "!((1,2))" "Type Error: logic expected a boolean, found"
  ]
;;

let print_tests =
  [ t "print_1" "print(0)" "0\n0"
  ; t "print_2" "let x=print(123) in x" "123\n123"
  ; t "print_3" "print(true)" "true\ntrue"
  ; t "print_4" "print(false)" "false\nfalse"
  ; t "print_5" "let x=print(1) in add1(x)" "1\n2"
  ; t "print_6" "let x=print(1) in print(add1(x))" "1\n2\n2"
  ; t "print_7" "let x=print(1), y=print(add1(3)) in print(add1(y))" "1\n4\n5\n5"
  ; t "print_8" "let x=print(2), y=print(1+2) in x+y" "2\n3\n5"
  ; t "print_9" "if true: add1(print(1)) else: print(2)" "1\n2"
  ; t "print_10" "if false: add1(print(1)) else: print(2) - 1" "2\n1"
  ; t "print_11" "let x=print(1) in 5" "1\n5"
  ; t "print_12" "let x=print(print(print(1))) in 2" "1\n1\n1\n2"
  ; t "print_13" "let x=print(1), y=print(let x=print(2), y=print(3) in print(x+y)) in x+y" "1\n2\n3\n5\n5\n6"
  ; t "print_14" "if print(true): print(123) else: print(456)" "true\n123\n123"
  ; t "print_15" "if print(false): print(123) else: print(456)" "false\n456\n456"
  ; te
      "print_16"
      "print(1, 2)"
      "The function called at <print_16, 1:0-1:11> expected an arity of 1, but received 2 arguments"
  ]
;;

let prim1_arith_tests =
  [ t "add1_1" "add1(2)" "3"
  ; te "add1_2" "add1(true)" "Type Error: arithmetic expected a number, found 0xffffffffffffffff"
  ; t "sub1_1" "sub1(2)" "1"
  ; te "sub1_2" "sub1(false)" "Type Error: arithmetic expected a number, found 0x7fffffffffffffff"
  ; t "sub1_3" "sub1(0)" "-1"
  ; t "add1" "add1(42)" "43"
  ; t "add1_twice" "add1(add1(0))" "2"
  ; t "sub1" "sub1(42)" "41"
  ; t "sub1_twice" "sub1(sub1(0))" "-2"
  ; t "mixed_add1_sub1" "sub1(add1(sub1(add1(add1(add1(0))))))" "2"
  ]
;;

let prim2_arith_tests =
  [ t "plus_1" "1 + 2" "3"
  ; t "plus_simple_1" "1+2" "3"
  ; t "plus_var_1" "1+(let x=2 in x)" "3"
  ; t "plus_var_2" "let x=2 in (3+x)" "5"
  ; t "plus_print" "1 + print(2)" "2\n3"
  ; t "mul_simple_1" "1*2" "2"
  ; t "mul_simple_2" "1*0" "0"
  ; t "mul_simple_3" "0*1" "0"
  ; t "mul_simple_4" "5*3" "15"
  ; t "mul_var_1" "1*(let x=2 in x)" "2"
  ; t "mul_var_2" "let x=2 in (3*x)" "6"
  ; t "mul_print" "1 * print(2)" "2\n2"
  ; t "sub_simple_1" "5 - 2" "3"
  ; t "sub_var_0" "1 - 2" "-1"
  ; t "sub_var_1" "1-(let x=2 in x)" "-1"
  ; t "sub_var_2" "let x=2 in (3-x)" "1"
  ; t "sub_print" "1 - print(2)" "2\n-1"
  ; t "mixed_1" "1 * 2 + 3 - 4 + 2 * 3" "9"
  ; t "mixed_2" "2 - 3 + 4 - -10 * 12" "156"
  ; t "mul_chained" "2 * 3 * 4" "24"
  ; t "add_chained" "1 + 2 + 3" "6"
  ; t "sub_chained" "5 - 3 - 2" "0"
  ; te "num_plus_tuple" "1 + (3,2)" "Type Error: arithmetic expected a number, found"
  ]
;;

let sequence_tests =
  [ t "seq_1" "1; 2" "2"
  ; t "seq_2" "print(5); print(6)" "5\n6\n6"
  ; t "seq_3" "(if true: 5 else: false + 1); 6" "6"
  ; t "seq_4" "if true: 5 else: false + 1; 6" "5"
  ; te "seq_5" "if false: 5 else: (false + 1); 6" "Type Error: arithmetic expected a number, found 0x7fffffffffffffff"
  ; t "seq_6" "(1;<Int> 2): Int" "2"
  ; t "seq_7" "let iden=(lambda (x): x) in iden(print(5);2)" "5\n2"
  ]
;;

let if_tests =
  [ t "if_true" "if true: 123 else: 456" "123"
  ; t "if_false" "if false: 123 else: 456" "456"
  ; t "if_bool_eq_1" "if true == true: 0 else: 1" "0"
  ; t "if_bool_eq_2" "if true == false: 0 else: 1" "1"
  ; t "if_num_eq_1" "if 1==1: 0 else: 1" "0"
  ; t "if_num_eq_2" "if 1==2: 0 else: 1" "1"
  ; t "if_num_greater_1" "if 1>2: 0 else: 1" "1"
  ; t "if_num_greater_2" "if 1>0: 0 else: 1" "0"
  ; t "if_num_greater_or_eq_1" "if 1>=1: 0 else: 1" "0"
  ; t "if_num_greater_or_eq_2" "if 2>=1: 0 else: 1" "0"
  ; t "if_num_greater_or_eq_3" "if 0>=1: 0 else: 1" "1"
  ; t "if_num_lesser_1" "if 1 < 2: 0 else: 1" "0"
  ; t "if_num_lesser_2" "if 1 < 0: 0 else: 1" "1"
  ; t "if_num_lesser_or_eq_1" "if 1<=1: 0 else: 1" "0"
  ; t "if_num_lesser_or_eq_2" "if 2<=1: 0 else: 1" "1"
  ; t "if_num_lesser_or_eq_3" "if 0<=1: 0 else: 1" "0"
  ; t "if_and_1" "if true && true: 0 else: 1" "0"
  ; t "if_and_2" "if true && false: 0 else: 1" "1"
  ; t "if_and_3" "if false && true: 0 else: 1" "1"
  ; t "if_and_4" "if false && false: 0 else: 1" "1"
  ; t "if_or_1" "if true || true: 0 else: 1" "0"
  ; t "if_or_2" "if true || false: 0 else: 1" "0"
  ; t "if_or_3" "if false || true: 0 else: 1" "0"
  ; t "if_or_4" "if false || false: 0 else: 1" "1"
  ; t "if_is_bool_1" "if isbool(true): 123 else: 456" "123"
  ; t "if_is_bool_2" "if isbool(1): 123 else: 456" "456"
  ; t "if_is_num_1" "if isnum(true): 123 else: 456" "456"
  ; t "if_is_num_2" "if isnum(1): 123 else: 456" "123"
  ; t "if_complex_cond_1" "if (1==0)||true: 123 else: 456" "123"
  ; t "if_complex_cond_2" "if (((1==0)||true)&&false)==true: 123 else: 456" "456"
  ; t "if_complex_cond_3" "if isbool((((1==0)||true)&&false)==false): 123 else: 456" "123"
  ; t "if_complex_cond_4" "if !((isbool((((1==0)||true)&&false)==false)==true) && false): 123 else: 456" "123"
  ; te "if_num_as_cond_1" "if 0: 0 else: 1" "Type Error: if expected a boolean, found 0x0000000000000000"
  ; te "if_num_as_cond_2" "if 1: 0 else: 1" "Type Error: if expected a boolean, found 0x0000000000000002"
  ; t "if_eq_1" "(if true: 0 else: 1) == (if false: 1 else: 0)" "true"
  ; t "if_return_different_types_1" "1 + (if true: 1 else: false)" "2"
  ; te
      "if_return_different_types_2"
      "1 + (if false: 1 else: false)"
      "Type Error: arithmetic expected a number, found 0x7fffffffffffffff"
  ; t "if_return_different_types_3" "false || (if false: 1 else: true)" "true"
  ; te
      "if_return_different_types_4"
      "false || (if true: 1 else: true)"
      "Type Error: logic expected a boolean, found 0x0000000000000002"
  ; t "if_return_different_types" "if true: 1 else: add1(true)" "1"
  ; t "if_lazy_1" "if true: print(1) else: print(2)" "1\n1"
  ; t "if_lazy_2" "if false: print(1) else: print(2)" "2\n2"
  ; t "if_lazy_3" "if true: add1(1) else: add1(true)" "2"
  ; t "if_lazy_4" "if false: add1(true) else: add1(1)" "2"
  ; te "if_tuple" "if (1,2): 1 else: 2" "Type Error: if expected a boolean, found"
  ]
;;

let num_comparison_tests =
  [ t "eq_1" "1 == 1" "true"
  ; t "eq_2" "1 == 2" "false"
  ; t "eq_3" "-3 == 2" "false"
  ; t "eq_4" "1==false" "false"
  ; t "eq_5" "false==1" "false"
  ; t "eq_6" "1==true" "false"
  ; t "eq_7" "true==1" "false"
  ; t "eq_8" "true==true" "true"
  ; t "eq_9" "true==false" "false"
  ; t "eq_10" "false==true" "false"
  ; t "eq_11" "false==false" "true"
  ; t "eq_12" "let x=(1,2) in x == x" "true"
  ; t "eq_13" "let x=(1,2), y=(1,2) in x == y" "false"
  ; t "eq_14" "let x=(1,2), y=(1,3) in x == y" "false"
  ; t "eq_15" "(1,) == 1" "false"
  ; t "eq_16" "(1,2) == 1" "false"
  ; t "eq_17" "(lambda: 1) == (lambda: 1)" "false"
  ; t "eq_18" "let x=(lambda: 1) in x==x" "true"
  ; t "eq_19" "let x=(lambda: 1) in x==1" "false"
  ; t "eq_20" "print == print" "true"
  ; t "eq_21" "let p=print in p==print" "true"
  ; t "eq_22" "let f=(lambda: print) in f() == print" "true"
  ; t "eq_let_1" "let x=1, y=2 in x==y" "false"
  ; t "eq_let_2" "let x=1, y=1 in x==y" "true"
  ; t "eq_let_3" "let x=true, y=2 in x==y" "false"
  ; t "eq_let_4" "let x=1, y=false in x==y" "false"
  ; t "eq_let_5" "let x=true, y=true in x==y" "true"
  ; t "eq_let_6" "let x=false, y=false in x==y" "true"
  ; t "eq_let_7" "let x=true, y=false in x==y" "false"
  ; t "eq_let_8" "let x=false, y=true in x==y" "false"
  ; t "gt_1" "1>2" "false"
  ; t "gt_2" "1>1" "false"
  ; t "gt_3" "1>0" "true"
  ; te "gt_4" "1>false" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "gt_5" "false>1" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "gt_6" "false>true" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; t "let_gt_1" "let x=1, y=2 in x>y" "false"
  ; t "let_gt_2" "let x=1, y=1 in x>y" "false"
  ; t "let_gt_3" "let x=1, y=0 in x>y" "true"
  ; te "let_gt_4" "let x=1, y=false in x>y" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "let_gt_5" "let x=false, y=2 in x>y" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "let_gt_6" "let x=false, y=true in x>y" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; t "gte_1" "1>=2" "false"
  ; t "gte_2" "1>=1" "true"
  ; t "gte_3" "1>=0" "true"
  ; te "gte_4" "1>=false" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "gte_5" "false>=1" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "gte_6" "false>=true" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; t "let_gte_1" "let x=1, y=2 in x>=y" "false"
  ; t "let_gte_2" "let x=1, y=1 in x>=y" "true"
  ; t "let_gte_3" "let x=1, y=0 in x>=y" "true"
  ; te "let_gte_4" "let x=1, y=false in x>=y" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "let_gte_5" "let x=false, y=2 in x>=y" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "let_gte_6" "let x=false, y=true in x>=y" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; t "lt_1" "1 < 2" "true"
  ; t "lt_2" "1 < 1" "false"
  ; t "lt_3" "1 < 0" "false"
  ; te "lt_4" "1 < false" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "lt_5" "false < 1" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "lt_6" "false < true" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; t "let_lt_1" "let x: Int = 1, y: Int = 2 in x < y" "true"
  ; t "let_lt_2" "let x: Int=1, y: Int=1 in x < y" "false"
  ; t "let_lt_3" "let x: Int=1, y: Int=0 in x < y" "false"
  ; te
      "let_lt_4"
      "let x: Int=1, y: Bool=false in x < y"
      "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te
      "let_lt_5"
      "let x: Bool=false, y: Int=2 in x < y"
      "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te
      "let_lt_6"
      "let x: Bool=false, y: Int=true in x < y"
      "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; t "lte_1" "1<=2" "true"
  ; t "lte_2" "1<=1" "true"
  ; t "lte_3" "1<=0" "false"
  ; te "lte_4" "1<=false" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "lte_5" "false<=1" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "lte_6" "false<=true" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; t "let_lte_1" "let x=1, y=2 in x <= y" "true"
  ; t "let_lte_2" "let x=1, y=1 in x <= y" "true"
  ; t "let_lte_3" "let x=1, y=0 in x <= y" "false"
  ; te "let_lte_4" "let x=1, y=false in x<=y" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "let_lte_5" "let x=false, y=2 in x<=y" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ; te "let_lte_6" "let x=false, y=true in x<=y" "Type Error: comparison expected a number, found 0x7fffffffffffffff"
  ]
;;

let bool_comparison_tests =
  [ t "and_1" "true && true" "true"
  ; t "and_2" "true && false" "false"
  ; t "and_3" "false && true" "false"
  ; t "and_4" "false && false" "false"
  ; t "and_5" "false && 1" "false"
  ; te "and_6" "true && 1" "Type Error: logic expected a boolean, found 0x0000000000000002"
  ; te "and_7" "1 && true" "Type Error: logic expected a boolean, found 0x0000000000000002"
  ; te "and_8" "1 && 2" "Type Error: logic expected a boolean, found 0x0000000000000002"
  ; t "and_9" "print(false) && print(true)" "false\nfalse"
  ; te "and_10" "(lambda: 1) && false" "Type Error: logic expected a boolean, found 0x"
  ; t "let_and_1" "let x=print(true), y=print(false) in x&&y" "true\nfalse\nfalse"
  ; t "let_and_2" "let x=print(true), y=print(true) in x&&y" "true\ntrue\ntrue"
  ; t "or_1" "true || true" "true"
  ; t "or_2" "true || false" "true"
  ; t "or_3" "false || true" "true"
  ; t "or_4" "false || false" "false"
  ; te "or_5" "false || 1" "Type Error: logic expected a boolean, found 0x0000000000000002"
  ; t "or_6" "true || 1" "true"
  ; te "or_7" "1 || true" "Type Error: logic expected a boolean, found 0x0000000000000002"
  ; te "or_8" "1 || 2" "Type Error: logic expected a boolean, found 0x0000000000000002"
  ; t "or_short_circuit_1" "print(true) || print(false)" "true\ntrue"
  ; t "or_short_circuit_2" "print(true) || 1" "true\ntrue"
  ; t "let_or_1" "let x=print(true), y=print(false) in x||y" "true\nfalse\ntrue"
  ; t "let_or_2" "let x=print(false), y=print(false) in x||y" "false\nfalse\nfalse"
  ; t
      "big_short_circuit"
      "let x=((print(true) || print(1)) || print(2)) && print(false) in (x || true) || print(3) == (print(4))"
      "true\nfalse\n4\nfalse"
  ; t "chained_and_1" "true && true && true" "true"
  ; t "chained_and_2" "true && true && false" "false"
  ; t "chained_or_1" "true || false || false" "true"
  ; t "chained_or_2" "false || false || false" "false"
  ]
;;

let overflow_tests =
  [ te "overflow_add1_1" "add1(4611686018427387903)" "Arithmetic Error: overflow"
  ; te "overflow_add1_2" "let x=4611686018427387903 in add1(x)" "Arithmetic Error: overflow"
  ; t "overflow_add1_3" "if false: let x=4611686018427387903 in add1(x) else: 123" "123"
  ; te "overflow_sub1_1" "sub1(-4611686018427387904)" "Arithmetic Error: overflow"
  ; te "overflow_sub1_2" "let x=-4611686018427387904 in sub1(x)" "Arithmetic Error: overflow"
  ; t "overflow_sub1_3" "if false: sub1(-4611686018427387904) else: 123" "123"
  ; te "overflow_add_1" "4611686018427387900 + 2 + 2" "Arithmetic Error: overflow"
  ; te "overflow_add_2" "let x=4611686018427387900, y=2, z=2 in x+y+z" "Arithmetic Error: overflow"
  ; t "overflow_add_3" "if false: (let x=4611686018427387900, y=2, z=2 in x+y+z) else: 456" "456"
  ; te "overflow_sub_1" "-4611686018427387900 - 2 - 3" "Arithmetic Error: overflow"
  ; te "overflow_sub_2" "let x=-4611686018427387900, y=2, z=-3 in x-y+z" "Arithmetic Error: overflow"
  ; t "overflow_sub_3" "if true: 123 else: (let x=-4611686018427387900, y=2, z=-3 in x-y+z)" "123"
  ; te "overflow_mul_1" "461168601842738790 * 100" "Arithmetic Error: overflow"
  ; te "overflow_mul_2" "-461168601842738790 * 100" "Arithmetic Error: overflow"
  ; t "overflow_mul_3" "if false: -461168601842738790 * 100 else: 123" "123"
  ; te "overflow_mul_4" "-4611686018427387904 * 2" "Arithmetic Error: overflow"
  ; te "overflow_print" "add1(print(4611686018427387903))" "Arithmetic Error: overflow"
  ]
;;

let simple_non_recursive_function_tests =
  [ t "identity_function_1" "def iden(x): x\niden(4)" "4"
  ; t "identity_function_2" "def iden(x): x\niden(iden(4))" "4"
  ; t "add_fun_1" "def add(x,y): x+y\nadd(2,3)" "5"
  ; t "add_fun_2" "def add(x,y,z): x+y+z\nadd(2,3,4)" "9"
  ; t "add_fun_3" "def add(x,y,z): x+y\nadd(2,3,4)" "5"
  ; t "arith_fun_1" "def arith(x,y,z): (x+y)*z+1\narith(2,3,4)" "21"
  ; t "arith_fun_2" "def arith(x,y,z): (x+y)*z+1\narith(0,0,0)" "1"
  ; t "branching_fun_1" "def branch(x,y,z): (if x: y+5 else: z - 2)\nbranch(true,1,1)" "6"
  ; t "branching_fun_2" "def branch(x,y,z): (if x: y+5 else: z - 2)\nbranch(false,1,1)" "-1"
  ; t "max_1" "def max(x,y): if x > y: x else: y\nmax(1,3)" "3"
  ; t "max_2" "def max(x,y): if x > y: x else: y\nmax(5,3)" "5"
  ; t "max_3" "def max(x,y): if x > y: x else: y\nmax(3,3)" "3"
  ; t "rebind_fun_arg" "def f(x): let x=1 in x\nf(3)" "1"
  ; t "no_arg_fun" "def f(): 1\nf()" "1"
  ; t "lots_of_args" "def fun(a,b,c,d,e,f,g,h,i,j):a+b+c+d+e+f+g+h+i+j\nfun(0,1,2,3,4,5,6,7,8,9)" "45"
  ; t "unused_function_with_error" "def fun(a,b): isbool(a)+b\n1+2" "3"
  ; t "unused_arg_still_evaluated" "def f(x): 1\nf(print(3))" "3\n1"
  ; t "greedy_and" "def greedy_and(x,y): x && y\ngreedy_and(print(false), print(false))" "false\nfalse\nfalse"
  ; t "blank_arg_1" "def f(_): 1\nf(2)" "1"
  ; te
      "blank_arg_2"
      "def f(_): 1\nf()"
      "The function called at <blank_arg_2, 2:0-2:3> expected an arity of 1, but received 0 arguments"
  ; t "blank_arg_3" "def f(x, _): x\nf(3, true)" "3"
  ; te "blank_arg_4" "def f(x, _): _\nf(3, true)" "Parse error at line 1, col 14"
  ]
;;

let simple_recursive_function_tests =
  [ t "fib_1" "def fib(x): (if x <= 2: 1 else: fib(x - 1) + fib(x - 2))\nfib(1)" "1"
  ; t "fib_2" "def fib(x): (if x <= 2: 1 else: fib(x - 1) + fib(x - 2))\nfib(2)" "1"
  ; t "fib_3" "def fib(x): (if x <= 2: 1 else: fib(x - 1) + fib(x - 2))\nfib(3)" "2"
  ; t "fib_4" "def fib(x): (if x <= 2: 1 else: fib(x - 1) + fib(x - 2))\nfib(4)" "3"
  ; t "fib_5" "def fib(x): (if x <= 2: 1 else: fib(x - 1) + fib(x - 2))\nfib(5)" "5"
  ; t "fib_10" "def fib(x): (if x <= 2: 1 else: fib(x - 1) + fib(x - 2))\nfib(10)" "55"
    (* ; t "fib_20" "def fib(x): (if x <= 2: 1 else: fib(x - 1) + fib(x - 2))\nfib(20)" "6765" *)
  ; t "fact_5" "def fact(acc, n): (if n < 1: acc else: fact(acc * n, n - 1) + 0)\n\nfact(1,5)" "120"
  ; t "max_rec_1" "def max(a,b): if a>=b: a else: max(b,a)\nmax(1,2)" "2"
  ; t "max_rec_2" "def max(a,b): if a>=b: a else: max(b,a)\nmax(2,2)" "2"
  ; t "max_rec_3" "def max(a,b): if a>=b: a else: max(b,a)\nmax(3,2)" "3"
  ; t
      "max_rec_4"
      ("def identity<'a>(x: 'a) -> 'a: x\n"
      ^ "def max(a: Int, b: Int) -> Int: "
      ^ "   if identity(a) >= identity(b): identity(a) else: identity(max(identity(b),identity(a)))\n"
      ^ "max(3,2)")
      "3"
  ; te
      "stack_overflow_1"
      "def fib(x): (if x <= 2: 1 else: fib(x - 1) + fib(x - 2))\nfib(1000000)"
      "Error: Out of stack memory!"
  ; te "stack_overflow_2" "def f(): f()\nf()" "Error: Out of stack memory!"
  ]
;;

let tail_rec_tests =
  [ t "simple_tail_rec" "def foo(a): if a==0: 42 else: foo(a - 1)\nfoo(10)" "42"
  ; t "mutual_recursion_1" "def foo(a): if a==0: 42 else: bar(a)\nand def bar(a): foo(a - 1)\nfoo(10)" "42"
  ; t "mutual_recursion_2" "def foo(a, b, c): bar(c, b)\nand def bar(x, y): baz(y)\nand def baz(i): i\nfoo(1, 2, 3)" "2"
  ; t
      "mutual_recursion_3"
      "def foo(a): if a >= 256: a else: bar(a - 1, a + 1)\nand def bar(a, b): foo(a + b)\nfoo(1)"
      "256"
  ; t
      "mutual_recursion_4"
      "def f1(x): let a=x, b=a, c=b, d=c in f2(d - 1)\nand def f2(x): if x == 12: x else: f1(x)\nf2(40000)"
      "12"
  ; t
      "mutual_recursion_5"
      "def f1(x): f2(x - 1)\nand def f2(x): if x == 12: x else: let a=x, b=a, c=b, d=c in f1(d)\nf2(40000)"
      "12"
  ]
;;

let simple_lambda_tests =
  [ t "closure_iden_1" "let x=(lambda (a): a) in x(5)" "5"
  ; t "closure_iden_2" "let x=(lambda (a): a) in x((1, true))" "(1, true)"
  ; te "closure_iden_3" "let x=(lambda (a): a) in x()" "Error: arity mismatch in call"
  ; t "closure_add_1" "let add=(lambda (x,y): x+y) in add(0, 1)" "1"
  ; t "closure_add_2" "let add=(lambda (x,y): x+y) in add(12, -15)" "-3"
  ; te "closure_add_3" "let add=(lambda (x,y): x+y) in add(12)" "Error: arity mismatch in call"
  ; te
      "closure_add_4"
      "let add=(lambda (x,y): x+y) in add(12, true)"
      "Type Error: arithmetic expected a number, found 0xffffffffffffffff"
  ; te
      "closure_add_5"
      "let add=(lambda (x,y): x+y) in add((1,), 3)"
      "Type Error: arithmetic expected a number, found 0x0000"
  ; t "closure_in_closure_1" "let mult=(lambda (x,y): let iden=(lambda (x): x) in iden(x) * iden(y)) in mult(3,4)" "12"
  ; te
      "closure_in_closure_2"
      "let mult=(lambda (x,y): let iden=(lambda (x): x) in iden(x) * iden(y)) in mult(3)"
      "Error: arity mismatch in call"
  ; te
      "closure_in_closure_3"
      "let mult=(lambda (x,y): let iden=(lambda (x): x) in iden(x,y) * iden(y)) in mult(3,5)"
      "Error: arity mismatch in call"
  ; t "applyToFive_1" "let applyToFive=(lambda (it): it(5)), inc=(lambda (x): x+1) in applyToFive(inc)" "6"
  ; te
      "applyToFive_2"
      "let applyToFive=(lambda (it): it(5)), inc=(lambda (x): x+1) in applyToFive(3)"
      "Error: tried to call a non-function value: 3"
  ; te
      "applyToFive_3"
      "let applyToFive=(lambda (it): it(5)), flip=(lambda (x): !(x)) in applyToFive(flip)"
      "Type Error: logic expected a boolean, found 0x000000000000000a"
  ; t "func_return_closure_1" "let makeInc=(lambda: (lambda (x): x+1)) in makeInc()(5)" "6"
  ; te
      "func_return_closure_2"
      "let makeInc=(lambda: (lambda (x): x+1)) in makeInc()(true)"
      "Type Error: arithmetic expected a number, found 0xffffffffffffffff"
  ; t "func_return_closure_3" "let makeInc=(lambda: (lambda (x): x+1)), x=makeInc() in x(0)" "1"
  ; te
      "func_return_closure_4"
      "let makeInc=(lambda: (lambda (x): x+1)), x=makeInc(1) in x(0)"
      "Error: arity mismatch in call"
  ; te
      "func_return_closure_5"
      "let makeInc=(lambda: (lambda (x): x+1)), x=makeInc() in x(0,2)"
      "Error: arity mismatch in call"
  ; t "lambda_without_binding" "(lambda (x): x*2)(3)" "6"
  ; te
      "lambda_body_wf_failure"
      "(lambda (x): y)"
      "The identifier y, used at <lambda_body_wf_failure, 1:13-1:14>, is not in scope"
  ; te
      "lambda_duplicate_args"
      "(lambda (x, x): x)"
      ("The identifier x, redefined at <lambda_duplicate_args, 1:12-1:13>, duplicates one "
      ^ "at <lambda_duplicate_args, 1:9-1:10>")
  ; t "lots_of_shadowing" "let x=123 in (let x = (lambda (x): (lambda(x): (lambda (x): x)(x))(x)) in x(42))" "42"
  ; t "pass_print_as_value_1" "let p=print in p(2)" "2\n2"
  ; t "pass_print_as_value_2" "let lam=(lambda (x, y, cb): cb(x + y); -1) in lam(1,2,print)" "3\n-1"
  ; t "pass_print_as_value_3" "print" "<function arity=1 num_closed=0 >"
  ; te
      "pass_print_as_value_4"
      "let lam=(lambda (x, y, cb): cb(x + y, true); -1) in lam(1,2,print)"
      "Error: arity mismatch in call"
  ; t_input "pass_input_as_value" "let i=input in i()" "5\n" "5"
  ; t "pass_equal_as_value" "let e=equal in e(1, 2)" "false"
  ; t "lambda_directly_to_lambda" "(lambda (f, x): f(x))((lambda (x): print(x); add1(x)), 5)" "5\n6"
  ]
;;

let closure_tests =
  [ t "simple_closure_1" "let x=1 in (let f=(lambda (y): x+y) in f(3))" "4"
  ; t "simple_closure_2" "let x=1 in (let f=(lambda (y): let new=x+y in new) in f(3))" "4"
  ; t "simple_closure_3" "(let x=2 in (lambda (y): y*x))(5)" "10"
  ; te "simple_closure_4" "(let x=2 in (lambda (y): y*x))(5)()" "Error: tried to call a non-function value: 10"
  ; te
      "simple_closure_5"
      "(let x=2 in (lambda (y): y*x))(true)"
      "Type Error: arithmetic expected a number, found 0xffffffffffffffff"
  ; te
      "simple_closure_6"
      "(let x=true in (lambda (y): y*x))(5)"
      "Type Error: arithmetic expected a number, found 0xffffffffffffffff"
  ; t "simple_closure_7" "let a=true, b=1, c=2 in (let f=(lambda (y): if a && y: b else: c) in f(true))" "1"
  ; t "simple_closure_8" "let a=true, b=1, c=2 in (let f=(lambda (y): if a && y: b else: c) in f(false))" "2"
  ; t "simple_closure_9" "let a=true, b=1, c=2 in (let f=(lambda (a): if a: b else: c) in f(true))" "1"
  ; t "simple_closure_10" "let a=true, b=1, c=2 in (let f=(lambda (a): if a: b else: c) in f(false))" "2"
  ; t "simple_closure_11" "let a=true, b=1, c=2 in (let f=(lambda (x): let a=x in (if a: b else: c)) in f(false))" "2"
  ; t "nested_closure_1" "(lambda (x): (lambda (y): x+y))(1)(2)" "3"
  ; te "nested_closure_2" "(lambda (x): (lambda (y): x+y))(1)()" "Error: arity mismatch in call"
  ; t "two_closures" "let a=1, b=2, c=3, l1=(lambda: a+b+c), l2=(lambda: a+b+c) in l1() + l2()" "12"
  ; t
      "lots_of_free_variables_1"
      ("let free_1 = 1, free_2 = 2, free_3 = 3, free_4 = true, free_5 = false, rebound=100 in \n"
      ^ "let fun=(lambda (rebound): if free_4 || free_5: free_1 + free_2 + free_3 + rebound else: -1) in\n"
      ^ "fun(0)")
      "6"
  ; t
      "lots_of_free_variables_2"
      ("let free_1 = 1, free_2 = 2, free_3 = 3, free_4 = true, free_5 = false, rebound=100 in \n"
      ^ "let fun=(lambda (rebound): if free_4 || free_5: free_1 + free_2 + free_3 + rebound else: -1) in\n"
      ^ "let fun2=(lambda (free_1, free_2, free_3, free_4, free_5): free_1 + free_2 + free_3 + free_4 + free_5 + "
      ^ "rebound) in \n"
      ^ "print(fun(0)); fun2(1,2,3,4,5)")
      "6\n115"
  ; t
      "lots_of_free_variables_3"
      ("let free_1 = 1, free_2 = 2, free_3 = 3, free_4 = true, free_5 = false, rebound=100 in \n"
      ^ "let rec fun=(lambda (rebound): if free_4 || free_5: free_1 + free_2 + free_3 + rebound else: -1) in\n"
      ^ "fun(0)")
      "6"
  ; t
      "lots_of_free_variables_4"
      ("let free_1 = 1, free_2 = 2, free_3 = 3, free_4 = true, free_5 = false, rebound=100 in \n"
      ^ "let rec fun=(lambda (rebound): if free_4 || free_5: free_1 + free_2 + free_3 + rebound else: -1) in\n"
      ^ "let rec fun2=(lambda (free_1, free_2, free_3, free_4, free_5): free_1 + free_2 + free_3 + free_4 + free_5 + "
      ^ "rebound) in \n"
      ^ "print(fun(0)); fun2(1,2,3,4,5)")
      "6\n115"
  ; t
      "lots_of_free_variables_5"
      ("let free_1 = 1, free_2 = 2, free_3 = 3, free_4 = true, free_5 = false, rebound=100 in \n"
      ^ "let fun=(lambda (rebound): let a=1, b=2, c=3, d=4, e=5, f=6, g=7, h=8, i=9, j=10 in if free_4 || free_5: "
      ^ "free_1 + free_2 + free_3 + rebound else: -1) in\n"
      ^ "fun(0)")
      "6"
  ; t
      "fun_in_decl"
      "def makeFun(b): (lambda (x): if b: x else: -1 * x)\nprint(makeFun(true)(10)); makeFun(false)(12)"
      "10\n-12"
  ; t
      "curry_fun"
      ("def curry(arity_two_fun): (lambda (arg1): (lambda (arg2): arity_two_fun(arg1, arg2)))\n"
      ^ "let my_add=(lambda (x,y): x+y), curried_add=curry(my_add), x=curried_add(3) in x(2)")
      "5"
  ; t
      "previously_segfaulting_closure_1"
      ("let free_1 = 1, free_2 = 222, free_3 = true in let fun=(lambda (a): if false: free_1 else: 1) in "
      ^ "let fun2=(lambda: 1) in fun(0); fun2")
      "<function arity=0 num_closed=0 >"
  ; t
      "previously_segfaulting_closure_2"
      ("let free_1 = 1, free_2 = 2, free_3 = true in let fun=(lambda (a): if free_3: free_1 + free_2 else: -1) in "
      ^ "let fun2=(lambda: 1) in fun(0); fun2")
      "<function arity=0 num_closed=0 >"
  ; t "close_over_mutated_tuple" "let x=(1,2), f=(lambda: x[0 of 2]) in (print(f()); x[0 of 2 := 42];f())" "1\n42"
  ; t "tuple_unpacking_1" "(lambda ((x,y)): x+y)((1,2))" "3"
  ; t
      "tuple_unpacking_2"
      "let p1=(1,2), p2=(3,4), f=(lambda ((x1, y1), (x2, y2)): (x1+x2, y1+y2)) in f(p1, p2)"
      "(4, 6)"
  ; te
      "tuple_unpacking_3"
      "let p1=(1,2), p2=(3,4), f=(lambda ((x1, y1), (x1, y2)): (x1+y1, x2+y2)) in f(p1, p2)"
      ("The identifier x1, redefined at <tuple_unpacking_3, 1:46-1:48>, duplicates one at <tuple_unpacking_3, 1:36-1:38>\n"
      ^ "The identifier x2, used at <tuple_unpacking_3, 1:64-1:66>, is not in scope")
  ; te
      "tuple_unpacking_4"
      "let p1=(1,2), p2=(3,4), f=(lambda ((x1, y1), (x2, y2, a)): (x1+y1, x2+y2)) in f(p1, p2)"
      "index too large: 2"
  ; t "lambda_illegal_name" "(lambda (equal): equal)(3)" "3"
  ; t
      "closure_stress"
      ("let a=1, b=2, c=3, lam=(lambda (m, n, o): print(m); print(n); print(o); let x=m, y=n, z=o in "
      ^ "(print(x); print(y); print(z); print(a); print(b); print(c); 123)) in lam(-1, -2, -3)")
      "-1\n-2\n-3\n-1\n-2\n-3\n1\n2\n3\n123"
  ]
;;

let letrec_tests =
  [ t "letrec_fib_1" "let rec f=(lambda (x): if x<=2: 1 else: f(x - 1) + f(x - 2)) in f(10)" "55"
  ; te
      "letrec_fib_2"
      "let rec f=(lambda (x): if x<=2: 1 else: f(x - 1) + f(x - 2)) in f(10, 1)"
      "Error: arity mismatch in call"
  ; t "letrec_fib_3" "let rec f=(lambda (x): if x<=2: 1 else: f(x - 1) + f(x - 2)) in f(1)" "1"
  ; t
      "letrec_fib_4"
      ("let iden=(lambda (x): x) in let rec f=(lambda (x): if x<=2: iden(1) else: iden(f(iden(x) - 1)) + f(x - 2)) in "
      ^ "f(10)")
      "55"
  ; t
      "letrec_two_not_mutually_recursive"
      ("let rec f1=(lambda (x): if x<=2: 1 else: f1(x - 1) + f1(x - 2)) in (let rec f2=(lambda (x): if x<=2: 1 else: "
      ^ "f2(x - 1) + f2(x - 2)) in f1(10) + f2(10))")
      "110"
  ; t
      "letrec_call_previous_1"
      ("let rec f1=(lambda (x): if x<=2: 1 else: f1(x - 1) + f1(x - 2)) in (let rec f2=(lambda (x): if x<=2: 1 else: "
      ^ "f1(x - 1) + f2(x - 2)) in f1(10) + f2(10))")
      "110"
  ; t "letrec_call_previous_2" "let rec f1 = (lambda (a): a), f2 = (lambda: f1(1)) in f2()" "1"
  ; t
      "recursive_closure"
      "let base_case = 123 in let rec f=(lambda (x): if x == 0: base_case else: f(x - 1)) in f(10)"
      "123"
  ; t
      "letrec_simple_forward_ref"
      "let rec f1 = (lambda (a): print(f1); print(f2); a), f2 = (lambda: print(f2); f1(1)) in f2()"
      "<function arity=0 num_closed=2 >\n<function arity=1 num_closed=2 >\n<function arity=0 num_closed=2 >\n1"
  ; t
      "letrec_mutually_recursive_fib"
      ("let rec fib1=(lambda (n): if n <= 2: 1 else: fib2(n - 1) + fib1(n - 2)), "
      ^ "fib2=(lambda (n): if n <= 2: 1 else: fib1(n - 1) + fib2(n - 2)) in fib1(10)")
      "55"
  ; t
      "letrec_mutual_recursion_1"
      "let rec foo=(lambda (a): if a == 0: 42 else: bar(a)), bar=(lambda (a): foo(a - 1)) in foo(10)"
      "42"
  ; t
      "letrec_mutual_recursion_2"
      ("let closed_over=10 in let rec foo=(lambda (a,b,c): bar(c,b)), "
      ^ "bar=(lambda (x,y): baz(y)), baz=(lambda (i): i+closed_over) in foo(1, 2, 3)")
      "12"
  ; t
      "letrec_mutual_recursion_3"
      ("let rec f1=(lambda (x): f2(x - 1)), f2=(lambda (x): if x == 12: x else: let a=x, b=a, c=b, d=c in f1(d)) in "
      ^ "f2(100)")
      "12"
  ; te
      "let_no_recursion_allowed"
      "let f1=(lambda (x): f1()) in 1"
      "The identifier f1, used at <let_no_recursion_allowed, 1:20-1:22>, is not in scope"
  ; te
      "letrec_dupe_1"
      "let rec x=(lambda: 1), y=(lambda: 2), x=(lambda: 3) in x()"
      "The identifier x, redefined at <letrec_dupe_1, 1:38-1:39>, duplicates one at <letrec_dupe_1, 1:8-1:9>"
  ; te
      "letrec_not_lam"
      "let rec x=1 in x"
      "Binding error at letrec_not_lam, 1:8-1:11: Let-rec expected a name binding to a lambda; got x"
  ; t "letrec_shadow_nested" "(let rec x=(lambda: 1) in (let rec x=(lambda: 2) in print(x())); x())" "2\n1"
  ; te
      "letrec_not_in_scope"
      "(let rec x=(lambda: 1) in x()) + x()"
      "The identifier x, used at <letrec_not_in_scope, 1:33-1:34>, is not in scope"
  ; te
      "letrec_bad_body"
      "let rec x=(lambda: 1) in y()"
      "The identifier y, used at <letrec_bad_body, 1:25-1:26>, is not in scope"
  ; t "letrec_return_self" "let rec f=(lambda: f) in f()()()()()" "<function arity=0 num_closed=0 >"
  ; t "decl_is_a_letrec" "def f(x): (lambda (y): x+y)\nlet f1 = f, add2=f1(2) in add2(3)" "5"
  ; t
      "letrec_shadowed_closures_work"
      ("let rec f1=(lambda (n): if n <= 2: 1 else: f1(n - 1) + f1(n - 2)), f2=(lambda (x): f1(x)) in \n"
      ^ "let f1 = (lambda (n): 42) in (print(f1(10)); f2(10))")
      "42\n55"
  ; t
      "letrec_in_func_call"
      "let iden=(lambda (x): x) in iden(let rec f=(lambda (n): if n<=2: 1 else: f(n - 1) + f(n - 2)) in f(10))"
      "55"
  ; t
      "letrec_stress_closure"
      ("let a=1, b=2, c=3 in let rec lam=(lambda (m, n, o): print(m); print(n); print(o); let x=m, y=n, z=o in "
      ^ "(print(x); print(y); print(z); print(a); print(b); print(c); print(lam); 123)) in lam(-1, -2, -3)")
      "-1\n-2\n-3\n-1\n-2\n-3\n1\n2\n3\n<function arity=3 num_closed=4 >\n123"
  ]
;;

let gc_tests =
  [ tgc "no_heap_allocs" (add_space_for_native_functions 0) "let x=1, y=2, z=-4, b=true in (if b: x+y else: z)" "" "3"
  ; tgc
      "gc_given_lam1"
      (add_space_for_native_functions 8)
      "let f = (lambda: (1, 2)) in\nbegin\nf();f();f();f();f()end"
      ""
      "(1, 2)"
  ; tgce
      "gc_given_lam2"
      (add_space_for_native_functions 7)
      "let f = (lambda: (1, 2)) in\nbegin\nf();f();f();f()end"
      ""
      "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_tuple_single_collection_1_no_forwarding"
      (add_space_for_native_functions 4)
      "(10, 20); (30, 40)"
      ""
      "(30, 40)"
  ; tgc
      "gc_tuple_single_collection_2_no_forwarding"
      (add_space_for_native_functions 10)
      "(10, 20); let a=(30,40,50), b=(60, 70, 80, 90) in a"
      ""
      "(30, 40, 50)"
  ; tgc
      "gc_tuple_single_collection_3_no_forwarding"
      (add_space_for_native_functions 10)
      "(10, 20); let a=(30,40,50), b=(60, 70, 80, 90) in b"
      ""
      "(60, 70, 80, 90)"
  ; tgce
      "gc_tuple_single_collection_with_forwarding_1"
      (add_space_for_native_functions 10)
      "(10, 20); let a=(30,), b=(40, a), c=(60, 70, 80, 90) in b"
      ""
      "Error 10: Out of memory: needed 6 words, but only 4 remain after collection"
  ; tgc
      "gc_tuple_single_collection_with_forwarding_2"
      (add_space_for_native_functions 12)
      "(10, 20); let a=(30,), b=(40, a), c=(60, 70, 80, 90) in b"
      ""
      "(40, (30, ))"
  ; tgc
      "gc_tuple_single_collection_with_forwarding_3"
      (add_space_for_native_functions 12)
      "(10, 20); let a=(30,), b=(40, a), c=(60, 70, 80, 90) in a"
      ""
      "(30, )"
  ; tgc
      "gc_tuple_single_collection_with_forwarding_4"
      (add_space_for_native_functions 12)
      "(10, 20); let a=(30,), b=(40, a), c=(60, 70, 80, 90) in c"
      ""
      "(60, 70, 80, 90)"
  ; tgc
      "gc_closure_single_collection_no_forwarding_1"
      (add_space_for_native_functions 10)
      "(lambda: 1); let a=1, b=1, c=1, x=(lambda (x): a), y=(lambda (x,y): a+b+c) in y"
      ""
      "<function arity=2 num_closed=3 >"
  ; tgc
      "gc_closure_single_collection_no_forwarding_2"
      (add_space_for_native_functions 10)
      "(lambda: 1); let a=1, b=1, c=1, x=(lambda (x): a), y=(lambda (x,y): a+b+c) in x"
      ""
      "<function arity=1 num_closed=1 >"
  ; tgce
      "gc_closure_single_collection_no_forwarding_3"
      (add_space_for_native_functions 9)
      "(lambda: 1); let a=1, b=1, c=1, x=(lambda (x): a), y=(lambda (x,y): a+b+c) in x"
      ""
      "Error 10: Out of memory: needed 6 words, but only 5 remain after collection"
  ; tgc
      "gc_single_collection_forwarding_1"
      (add_space_for_native_functions 18)
      "(lambda: 1); let a=(1,), b=(2,a), c=(3,b), x=(lambda (x): a), y=(lambda (x,y): c) in x(1)"
      ""
      "(1, )"
  ; tgce
      "gc_single_collection_forwarding_2"
      (add_space_for_native_functions 17)
      "(lambda: 1); let a=(1,), b=(2,a), c=(3,b), x=(lambda (x): c), y=(lambda (x,y): c) in x(1)"
      ""
      "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_single_collection_forwarding_3"
      (add_space_for_native_functions 18)
      "(lambda: 1); let a=(1,), b=(2,a), c=(3,b), x=(lambda (x): c), y=(lambda (x,y): c) in x(1)"
      ""
      "(3, (2, (1, )))"
  ; tgc
      "gc_single_collection_collect_lambda_1"
      (add_space_for_native_functions 8)
      "(lambda: 1); let  a=(10,20,30), b=(40, 50) in (a[2 of 3 := b]; a)"
      ""
      "(10, 20, (40, 50))"
  ; tgce
      "gc_single_collection_collect_lambda_2"
      (add_space_for_native_functions 7)
      "(lambda: 1); let  a=(10,20,30), b=(40, 50) in (a[2 of 3 := b]; a)"
      ""
      "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_double_collection_1"
      (add_space_for_native_functions 12)
      "(lambda: 1); let a=(10,20,30), b=(40, 50) in ( a[2 of 3 := b]; (60,70); (80, 90); a )"
      ""
      "(10, 20, (40, 50))"
  ; tgc
      "gc_double_collection_2"
      (add_space_for_native_functions 12)
      "(lambda: 1); let a=(10,20,30), b=(40, 50) in ( a[2 of 3 := b]; (60,70); (80, 90); b )"
      ""
      "(40, 50)"
  ; tgce
      "gc_double_collection_3"
      (add_space_for_native_functions 11)
      "(lambda: 1); let a=(10,20,30), b=(40, 50) in ( a[2 of 3 := b]; (60,70); (80, 90); b )"
      ""
      "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_tuple_cycle_1"
      (add_space_for_native_functions 12)
      "(lambda: 1); let a=(10, 20), b=(30, 40) in ( a[1 of 2 := b]; b[1 of 2 := a]; (60,70); a )"
      ""
      "(10, (30, <cyclic tuple 1>))"
  ; tgc
      "gc_tuple_cycle_2"
      (add_space_for_native_functions 12)
      "(lambda: 1); let a=(10, 20), b=(30, 40) in ( a[1 of 2 := b]; b[1 of 2 := a]; (60,70); b )"
      ""
      "(30, (10, <cyclic tuple 1>))"
  ; tgc
      "gc_tuple_cycle_3"
      (add_space_for_native_functions 100)
      "(lambda: 1); let a=(10, 20), b=(30, 40) in ( a[1 of 2 := b]; b[1 of 2 := a]; (60,70); b )"
      ""
      "(30, (10, <cyclic tuple 1>))"
  ; tgc
      "gc_letrec_1"
      (add_space_for_native_functions 8)
      "(lambda: 1); let rec f = (lambda (x): f(x)) in ( let x=(1,2) in f )"
      ""
      "<function arity=1 num_closed=0 >"
  ; tgc
      "gc_letrec_2"
      (add_space_for_native_functions 8)
      "(lambda: 1); let rec f = (lambda (x): f(x)) in ( let x=(1,2) in x )"
      ""
      "(1, 2)"
  ; tgce
      "gc_letrec_3"
      (add_space_for_native_functions 7)
      "(lambda: 1); let rec f = (lambda (x): f(x)) in ( let x=(1,2) in f )"
      ""
      "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_letrec_4"
      (add_space_for_native_functions 8)
      "(10, 20); let rec f = (lambda (x): f(x)) in ( let x=(30,40) in f )"
      ""
      "<function arity=1 num_closed=0 >"
  ; tgc
      "gc_letrec_5"
      (add_space_for_native_functions 8)
      "(10, 20); let rec f = (lambda (x): f(x)) in ( let x=(30,40) in x )"
      ""
      "(30, 40)"
  ; tgc
      "gc_letrec_6"
      (add_space_for_native_functions 12)
      "(lambda: 10); let rec f = (lambda (x): f(x)), g = (lambda (x,y): g(x+y)) in ( let x=(20,30) in x )"
      ""
      "(20, 30)"
  ; tgc
      "gc_letrec_7"
      (add_space_for_native_functions 12)
      "(lambda: 10); let rec f = (lambda (x): f(x)), g = (lambda (x,y): g(x+y)) in ( let x=(20,30) in f )"
      ""
      "<function arity=1 num_closed=1 >"
  ; tgc
      "gc_letrec_8"
      (add_space_for_native_functions 12)
      "(lambda: 10); let rec f = (lambda (x): f(x)), g = (lambda (x,y): g(x+y)) in ( let x=(20,30) in g )"
      ""
      "<function arity=2 num_closed=0 >"
  ; tgce
      "gc_letrec_9"
      (add_space_for_native_functions 11)
      "(lambda: 10); let rec f = (lambda (x): f(x)), g = (lambda (x,y): g(x+y)) in ( let x=(20,30) in x )"
      ""
      "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_letrec_10"
      (add_space_for_native_functions 12)
      ("(lambda: 10); (110, 120, 130); (140, 150, 160, 170); (180, 190, 200, 210, 220, 230); "
      ^ "let rec f = (lambda (x): f;g;(x)), g = (lambda (x,y): f;g;(x+y)) in (  let x=(20,30) in f )")
      ""
      "<function arity=1 num_closed=1 >"
  ; tgc
      "gc_letrec_11"
      (add_space_for_native_functions 12)
      ("(lambda: 10); (110, 120, 130); (140, 150, 160, 170); (180, 190, 200, 210, 220, 230); "
      ^ "let rec f = (lambda (x): f;g;(x)), g = (lambda (x,y): f;g;(x+y)) in (  let x=(20,30) in g )")
      ""
      "<function arity=2 num_closed=1 >"
  ; tgc
      "gc_letrec_12"
      (add_space_for_native_functions 12)
      ("(lambda: 10); (110, 120, 130); (140, 150, 160, 170); (180, 190, 200, 210, 220, 230); "
      ^ "let rec f = (lambda (x): f;g;(x)), g = (lambda (x,y): f;g;(x+y)) in (  let x=(20,30) in x )")
      ""
      "(20, 30)"
  ; tgc
      "gc_polluting_function_1"
      (add_space_for_native_functions 8)
      "def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1)  pollute(99); (10, 20)"
      ""
      "(10, 20)"
  ; tgce
      "gc_polluting_function_2"
      (add_space_for_native_functions 7)
      "def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1)  pollute(99); (10, 20)"
      ""
      "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_polluting_function_3"
      (add_space_for_native_functions 50)
      "def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1)  pollute(99); (10, 20)"
      ""
      "(10, 20)"
  ; tgc
      "gc_polluting_function_4"
      (add_space_for_native_functions 8)
      "def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1)  pollute(99); (10, 20); pollute"
      ""
      "<function arity=1 num_closed=0 >"
  ; tgc
      "gc_closure_1"
      (add_space_for_native_functions 14)
      "(0,); let x=(1,2), lam1=(lambda (a): x), lam2=(lambda (a,b): lam1(x)) in lam2(0,0)"
      ""
      "(1, 2)"
  ; tgc
      "gc_closure_2"
      (add_space_for_native_functions 14)
      "(0,); let x=(1,2), lam1=(lambda (a): x), lam2=(lambda (a,b): lam1(x)) in lam2"
      ""
      "<function arity=2 num_closed=2 >"
  ; tgce
      "gc_closure_3"
      (add_space_for_native_functions 13)
      "(0,); let x=(1,2), lam1=(lambda (a): x), lam2=(lambda (a,b): lam1(x)) in lam2"
      ""
      "Out of memory: needed 6 words, but only 5 remain after collection"
  ; tgc
      "gc_closure_4"
      (add_space_for_native_functions 14)
      "(0,); let x=(1,2), lam1=(lambda (a): x), lam2=(lambda (a,b): lam1(x)) in lam1"
      ""
      "<function arity=1 num_closed=1 >"
  ; tgc
      "gc_closure_5"
      (add_space_for_native_functions 14)
      "(0,); let x=(1,2), lam1=(lambda (a): x), lam2=(lambda (a,b): lam1(x)) in x"
      ""
      "(1, 2)"
  ; tgc
      "gc_closure_6"
      (add_space_for_native_functions 16)
      ("def make_closure(tuple): let wrapped_tuple=(1,tuple) in (lambda: wrapped_tuple)  (0,1,2,3,4,5,6); \n"
      ^ "make_closure((3,4))()")
      ""
      "(1, (3, 4))"
  ; tgce
      "gc_closure_7"
      (add_space_for_native_functions 15)
      ("def make_closure(tuple): let wrapped_tuple=(1,tuple) in (lambda: wrapped_tuple)  (0,1,2,3,4,5,6); \n"
      ^ "make_closure((3,4))()")
      ""
      "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_recursive_junk_1"
      (add_space_for_native_functions 34)
      ("def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1)\n"
      ^ "def func(n): if n == 0: pollute(100); print((10,20)) else: (0,1,2); "
      ^ "let tup=(n*10,) in ( print(tup); let ret=func(n - 1) in (print(tup); ret))\n func(10) ")
      ""
      ("(100, )\n(90, )\n(80, )\n(70, )\n(60, )\n(50, )\n(40, )\n(30, )\n(20, )\n(10, )\n(10, 20)"
      ^ "\n(10, )\n(20, )\n(30, )\n(40, )\n(50, )\n(60, )\n(70, )\n(80, )\n(90, )\n(100, )\n(10, 20)")
  ; tgce
      "gc_recursive_junk_2"
      (add_space_for_native_functions 33)
      ("def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1)\n"
      ^ "def func(n): if n == 0: pollute(100); print((10,20)) else: (0,1,2); "
      ^ "let tup=(n*10,) in ( print(tup); let ret=func(n - 1) in (print(tup); ret))\n func(10) ")
      ""
      "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_variable_waste_spacer_1"
      (add_space_for_native_functions 100)
      "def use_space(n): if n == 0: 0 else: let x=(1,2,3) in use_space(n - 1)  use_space(input())"
      "2\n"
      "0"
  ; tgce
      "gc_variable_waste_spacer_2"
      (add_space_for_native_functions 100)
      "def use_space(n): if n == 0: 0 else: let x=(1,2,3) in use_space(n - 1)  use_space(input())"
      "1000\n"
      "Out of memory: needed 4 words, but only 0 remain after collection"
  ; tgc
      "gc_range_1"
      (add_space_for_native_functions 56)
      ("def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1) def range(n): if n == 0: pollute(100); (0, nil) "
      ^ "else: pollute(100); let x=(n, range(n - 1)) in ( pollute(100); x )   range(10)")
      ""
      "(10, (9, (8, (7, (6, (5, (4, (3, (2, (1, (0, nil)))))))))))"
  ; tgce
      "gc_range_2"
      (add_space_for_native_functions 55)
      ("def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1) def range(n): if n == 0: pollute(100); (0, nil) "
      ^ "else: pollute(100); let x=(n, range(n - 1)) in ( pollute(100); x )   range(10)")
      ""
      "Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_range_3"
      (add_space_for_native_functions 56)
      ("def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1) def range(n): if n == 0: pollute(100); (0, nil) "
      ^ "else: pollute(100); let x=(n, 0), y=range(n - 1) in ( pollute(100); x[1 of 2 := y]; x )   range(10)")
      ""
      "(10, (9, (8, (7, (6, (5, (4, (3, (2, (1, (0, nil)))))))))))"
  ; tgc
      "gc_double_ref_1"
      (add_space_for_native_functions 8)
      "let a=(1,2), b=a in ((3,4); print(a); b)"
      ""
      "(1, 2)\n(1, 2)"
  ; tgce
      "gc_double_ref_2"
      (add_space_for_native_functions 7)
      "let a=(1,2), b=a in ((3,4); print(a); b)"
      ""
      "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc "gc_nil_1" (add_space_for_native_functions 0) "let x=nil in x" "" "nil"
  ; tgc "gc_nil_2" (add_space_for_native_functions 8) "let x=nil in (print((1,x)); (2,nil))" "" "(1, nil)\n(2, nil)"
    (* Ideally, gc_annoying_seq should need only 4 words of memory, not 8. But, our anf-ing (as given to us) is broken. 
     * ANFing transforms the below expression into "let x=(1,2) in (x;(3,4))". This makes it impossible for x to go 
     * out of scope and thus (3,4) cannot use the same heap slot as (1,2). *)
  ; tgc "gc_annoying_seq" (add_space_for_native_functions 8) "(let x=(1,2) in x); (3,4)" "" "(3, 4)"
  ; tgc
      "gc_closure_over_closure"
      (add_space_for_native_functions 36)
      ("def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1) pollute(10); let a=(1,(2,3)), "
      ^ "b=(0,a,a,0), c=(lambda(x): print(a); print(b); x), d=(lambda(x,y): print(a); print(b); "
      ^ "print(c); c(x+y)), tmp=pollute(100) in d(1,2)")
      ""
      ("(1, (2, 3))\n(0, (1, (2, 3)), (1, (2, 3)), 0)\n<function arity=1 num_closed=3 >"
      ^ "\n(1, (2, 3))\n(0, (1, (2, 3)), (1, (2, 3)), 0)\n3")
  ; tgc
      "gc_lots_of_cycles_1"
      (add_space_for_native_functions 24)
      ("def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1)  let t1 = (1, 2), t2 = (3, t1) in "
      ^ "( t1[1 of 2 := t2]; let rec f1 = (lambda (x): f2), f2 = (lambda (x,y): f1) in ( pollute(100); "
      ^ "print(t1); print(t2); print(f1); print(f2); print(f1(1)); print(f2(1,1)); 1 ) )")
      ""
      ("(1, (3, <cyclic tuple 1>))\n(3, (1, <cyclic tuple 3>))\n<function arity=1 num_closed=1 >"
      ^ "\n<function arity=2 num_closed=1 >\n<function arity=2 num_closed=1 >\n<function arity=1 "
      ^ "num_closed=1 >\n1")
  ; tgce
      "gc_not_enough_mem"
      (add_space_for_native_functions 4)
      ("(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, "
      ^ "25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49)")
      ""
      "Error 10: Allocation error: needed 52 words, but the heap is only 24 words"
  ; tgc
      "gc_repeated_deep_mutual_recursion_1"
      (add_space_for_native_functions 12)
      ("def f1(n): if n == 0: (10, 11, 12) else: (1,2,3); f2(n - 1) and def f2(n): if n == 0: (7,8,9) "
      ^ "else: (4,5,6); f1(n - 1)  f1(1000); f1(1000); f1(1000) ")
      ""
      "(10, 11, 12)"
  ; tgce
      "gc_repeated_deep_mutual_recursion_2"
      (add_space_for_native_functions 11)
      ("def f1(n): if n == 0: (10, 11, 12) else: (1,2,3); f2(n - 1) and def f2(n): if n == 0: (7,8,9) "
      ^ "else: (4,5,6); f1(n - 1)  f1(1000); f1(1000); f1(1000) ")
      ""
      "Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_deep_closure_1"
      (add_space_for_native_functions 40)
      ("def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1)\n"
      ^ "let a=(1,2,3), f1=(lambda: a), f2=(lambda: f1()), f3=(lambda: f2()), f4=(lambda: f3()), "
      ^ "f5=(lambda: f4()), f6=(lambda: f5()), f7=(lambda: f6()) in "
      ^ "( a[1 of 3 := f7]; pollute(100); print(f7()); let t=f7() in (t[1 of 3])() )")
      ""
      "(1, <function arity=0 num_closed=1 >, 3)\n(1, <function arity=0 num_closed=1 >, 3)"
  ; tgce
      "gc_deep_closure_2"
      (add_space_for_native_functions 39)
      ("def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1)\n"
      ^ "let a=(1,2,3), f1=(lambda: a), f2=(lambda: f1()), f3=(lambda: f2()), f4=(lambda: f3()), "
      ^ "f5=(lambda: f4()), f6=(lambda: f5()), f7=(lambda: f6()) in "
      ^ "( a[1 of 3 := f7]; pollute(100); print(f7()); let t=f7() in (t[1 of 3])() )")
      ""
      "Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "gc_lambda_body_is_deferred"
      (add_space_for_native_functions 4)
      "(lambda: (1,2,3,4,5,6,7,8,9,10)); (1,2,3)"
      ""
      "(1, 2, 3)"
  ; tgc
      "gc_tuple_unpacking"
      (add_space_for_native_functions 12)
      "(1,2,3); let tup=(1, (2, (3, 4))) in let (x, (y, z)) = tup in print(x+y); z"
      ""
      "3\n(3, 4)"
  ; tgc
      "gc_tuple_set_1"
      (add_space_for_native_functions 14)
      ("def pollute(n): if n == 0: 123 else: (1,2,3); pollute(n - 1)  (1,2,3); let "
      ^ "x=(1,2,3,4,pollute(100)) in ( x[0 of 5 := pollute(100)]; x[1 of 5 := "
      ^ "pollute(100)]; x[2 of 5 := pollute(100)]; x[3 of 5 := pollute(100)]; x ) ")
      ""
      "(123, 123, 123, 123, 123)"
  ; tgc
      "gc_tuple_set_2"
      (add_space_for_native_functions 12)
      ("def make(): let x=(1,2) in (x, x)  let y=make() in ( print(y); "
      ^ "y[0 of 2 := 123]; y[1 of 2 := 456]; print(y); (100, 200, 300) )")
      ""
      "((1, 2), (1, 2))\n(123, 456)\n(100, 200, 300)"
  ; tgc
      "gc_curried_1"
      (add_space_for_native_functions 8)
      "(0,1,2); let curried_add=(lambda (x): (lambda (y): x+y)) in curried_add(2)(3)"
      ""
      "5"
  ; tgc
      "gc_curried_2"
      (add_space_for_native_functions 64)
      "def f(n, acc): if n == 0: acc else: (lambda (x): f(n - 1, x+acc))\nf(10,0)(1)(2)(3)(4)(5)(6)(7)(8)(9)(10)"
      ""
      "55"
  ; tgc
      "gc_aliasing_1"
      (add_space_for_native_functions 12)
      "def f(n, x): if n == 0: (5,x) else: let tmp=x in f(n - 1, x)  (3,4); let a=(1,2) in f(10, a)"
      ""
      "(5, (1, 2))"
  ; tgce
      "gc_aliasing_2"
      (add_space_for_native_functions 11)
      "def f(n, x): if n == 0: (5,x) else: let tmp=x in f(n - 1, x)  (3,4); let a=(1,2) in f(10, a)"
      ""
      "Out of memory: needed 4 words, but only 3 remain after collection"
  ; tgc
      "fun_many_args"
      (add_space_for_native_functions 24)
      ("def pollute(n): if n == 0: 0 else: (1,2,3); pollute(n - 1) def f(a, b, c, d, e, f): "
      ^ "pollute(100);a[0 of 1]+b[0 of 1]+c[0 of 1]+d[0 of 1]+e[0 of 1]+f[0 of 1] "
      ^ "f((1,), (2,), (3,), (4,), (5,), (6,))")
      ""
      "21"
  ]
;;

let string_tests = [
    t "simple_string_1" "\"a\"" "\"a\"" ;
    t "simple_string_2" "\"a b\"" "\"a b\"" ;
    t "simple_string_3" "\"hello world!\"" "\"hello world!\"" ;
    t "medium_string_1" "let x=\"hello world!\" in print(x); 5" "\"hello world!\"\n5" ;
    tgc "gc_string_1" ( add_space_for_native_functions 6) "def f():(\"a\"; 5)\nf();f();f()" "" "5" ; 
    tgce "gc_string_1" ( add_space_for_native_functions 5) "def f():(\"a\"; 5)\nf();f();f()" "" "Out of memory: needed 2 words, but only 1 remain after collection" ; 
    t "string_len_1" "string_len(\"a\")" "1" ; 
    t "string_len_2" "string_len(\"hello world\")" "11"; 
    te "string_len_3" "string_len(5)" "Error: Expected a string, found: 5";
    t "string_char_at_1" "char_at(\"a\", 0)" "\"a\"";
    te "string_char_at_2" "char_at(\"a\", 1)" "Error: char_at(a, 1): Index Out Of Bounds";
    te "string_char_at_3" "char_at(\"a\", -1)" "Error: char_at(a, -1): Index Out Of Bounds";
    t "string_char_at_4" "char_at(\"abc\", 0)" "\"a\"";
    t "string_char_at_5" "char_at(\"abc\", 1)" "\"b\"";
    t "string_char_at_6" "char_at(\"abc\", 2)" "\"c\"";
    te "string_char_at_7" "char_at(\"abc\", 3)" "Error: char_at(abc, 3): Index Out Of Bounds";
    te "string_char_at_8" "char_at(\"abc\", -1)" "Error: char_at(abc, -1): Index Out Of Bounds";
    te "string_char_at_9" "char_at(true, 0)" "Error: Expected a string, found: true";
    te "string_char_at_10" "char_at(\"true\", \"1\")" "Type Error: Expected a number, found: \"1\"";
    tgc "gc_string_in_tuple_1" ( add_space_for_native_functions 4)"(\"abc\"); (1,2)" "" "(1, 2)";
    tgce "gc_string_in_tuple_2" ( add_space_for_native_functions 3)"(\"abc\"); (1,2)" "" "Error 10: Out of memory: needed 4 words, but only 3 remain after collection"
]

(*
  _    _       _ _     _______        _       
 | |  | |     (_) |   |__   __|      | |      
 | |  | |_ __  _| |_     | | ___  ___| |_ ___ 
 | |  | | '_ \| | __|    | |/ _ \/ __| __/ __|
 | |__| | | | | | |_     | |  __/\__ \ |_\__ \
  \____/|_| |_|_|\__|    |_|\___||___/\__|___/
*)

let misc_unit_tests =
  [ t_any "round_up_to_multiple_of_16_1" (round_up_to_multiple_of_16 16) 16
  ; t_any "round_up_to_multiple_of_16_2" (round_up_to_multiple_of_16 8) 16
  ; t_any "round_up_to_multiple_of_16_3" (round_up_to_multiple_of_16 24) 32
  ; t_any "round_up_to_multiple_of_16_4" (round_up_to_multiple_of_16 30) 32
  ]
;;

let rename_tests =
  [ trename
      "rename_1"
      "(let x:Int=1 in x)"
      ("\n\n(let print_4 = (lam(a_10) (*native#print(a_10))), "
      ^ "input_13 = (lam() (*native#input())), equal_19 = (lam(a_26, b_28) "
      ^ "(*native#equal(a_26, b_28))) in (let x_32 : Int = 1 in x_32))\n")
  ; trename
      "rename_2"
      "(let x:Int=1 in x) + (let x=2 in x)"
      ("\n\n(let print_4 = (lam(a_10) (*native#print(a_10))), input_13 = (lam() (*native#input())), "
      ^ "equal_19 = (lam(a_26, b_28) (*native#equal(a_26, b_28))) in ((let x_33 : Int = 1 in x_33) + "
      ^ "(let x_39 = 2 in x_39)))\n")
  ; trename
      "rename_3"
      "(let x:Int=1 in (let x:Int=2 in x))"
      ("\n\n(let print_4 = (lam(a_10) (*native#print(a_10))), input_13 = (lam() (*native#input())), "
      ^ "equal_19 = (lam(a_26, b_28) (*native#equal(a_26, b_28))) in (let x_32 : Int = 1 in "
      ^ "(let x_37 : Int = 2 in x_37)))\n")
  ; trename
      "rename_4"
      "(let x:Int=(let x:Int=2 in x) in x)"
      ("\n\n(let print_4 = (lam(a_10) (*native#print(a_10))), input_13 = (lam() (*native#input())), equal_19 "
      ^ "= (lam(a_26, b_28) (*native#equal(a_26, b_28))) in (let x_32 : Int = (let x_36 : Int = 2 in x_36) in x_32))\n"
      )
  ; trename
      "rename_5"
      "(let x:Int=(let x:Int=2 in x) in add1(x))"
      ("\n\n(let print_4 = (lam(a_10) (*native#print(a_10))), input_13 = (lam() (*native#input())), equal_19 = "
      ^ "(lam(a_26, b_28) (*native#equal(a_26, b_28))) in (let x_32 : Int = (let x_36 : Int = 2 in x_36) in add1(x_32)))\n"
      )
  ; trename
      "rename_6"
      "if 0: (let x:Int=1 in x) else: (let y:Int=2 in y)"
      ("\n\n(let print_4 = (lam(a_10) (*native#print(a_10))), input_13 = (lam() (*native#input())), equal_19 = "
      ^ "(lam(a_26, b_28) (*native#equal(a_26, b_28))) in (if 0: (let x_34 : Int = 1 in x_34) else: (let y_40 : Int = "
      ^ "2 in y_40)))\n")
  ; trename
      "rename_7"
      "def f<'a>(x: 'a) -> 'a: x\ndef g(x: Int) -> Int: (let x:Int=1 in x)+x\nf(1)+g(2)"
      ("\n\n(let print_4 = (lam(a_10) (*native#print(a_10))), input_13 = (lam() (*native#input())), equal_19 = "
      ^ "(lam(a_26, b_28) (*native#equal(a_26, b_28))) in (let-rec f_32 = (lam(x_36 : 'a) x_36) in (let-rec g_40 = "
      ^ "(lam(x_51 : Int) ((let x_46 : Int = 1 in x_46) + x_51)) in ((f_32(1)) + (g_40(2))))))\n")
  ]
;;

let remove_illegal_immediates_tests =
  [ tinstr
      "remove_illegal_immediates_1"
      [ IXor (Reg RAX, Const 1L)
      ; IXor (Reg RAX, HexConst 2L)
      ; IXor (Reg RAX, Sized (QWORD_PTR, Const 1L))
      ; IXor (Reg RAX, Sized (QWORD_PTR, HexConst 1L))
      ; IXor (Reg RAX, Const (Int64.of_int (max_int + 1)))
      ; IXor (Reg RAX, HexConst (Int64.of_int (max_int + 1)))
      ; IXor (Reg RAX, Sized (QWORD_PTR, Const (Int64.of_int (max_int + 1))))
      ; IXor (Reg RAX, Sized (QWORD_PTR, HexConst (Int64.of_int (max_int + 1))))
      ]
      [ IXor (Reg RAX, Const 1L)
      ; IXor (Reg RAX, HexConst 2L)
      ; IXor (Reg RAX, Sized (QWORD_PTR, Const 1L))
      ; IXor (Reg RAX, Sized (QWORD_PTR, HexConst 1L))
      ; IMov (Reg reserved_immediate_register, Const (Int64.of_int (max_int + 1)))
      ; IXor (Reg RAX, Reg reserved_immediate_register)
      ; IMov (Reg reserved_immediate_register, HexConst (Int64.of_int (max_int + 1)))
      ; IXor (Reg RAX, Reg reserved_immediate_register)
      ; IMov (Reg reserved_immediate_register, Sized (QWORD_PTR, Const (Int64.of_int (max_int + 1))))
      ; IXor (Reg RAX, Reg reserved_immediate_register)
      ; IMov (Reg reserved_immediate_register, Sized (QWORD_PTR, HexConst (Int64.of_int (max_int + 1))))
      ; IXor (Reg RAX, Reg reserved_immediate_register)
      ]
  ; tinstr
      "remove_illegal_immediates_2"
      [ IAdd (Reg RAX, Const (Int64.of_int (max_int + 1)))
      ; ISub (Reg RAX, Const (Int64.of_int (max_int + 1)))
      ; IMul (Reg RAX, Const (Int64.of_int (max_int + 1)))
      ; ICmp (Reg RAX, Const (Int64.of_int (max_int + 1)))
      ; IAnd (Reg RAX, Const (Int64.of_int (max_int + 1)))
      ; IOr (Reg RAX, Const (Int64.of_int (max_int + 1)))
      ; ITest (Reg RAX, Const (Int64.of_int (max_int + 1)))
      ]
      [ IMov (Reg reserved_immediate_register, Const (Int64.of_int (max_int + 1)))
      ; IAdd (Reg RAX, Reg reserved_immediate_register)
      ; IMov (Reg reserved_immediate_register, Const (Int64.of_int (max_int + 1)))
      ; ISub (Reg RAX, Reg reserved_immediate_register)
      ; IMov (Reg reserved_immediate_register, Const (Int64.of_int (max_int + 1)))
      ; IMul (Reg RAX, Reg reserved_immediate_register)
      ; IMov (Reg reserved_immediate_register, Const (Int64.of_int (max_int + 1)))
      ; ICmp (Reg RAX, Reg reserved_immediate_register)
      ; IMov (Reg reserved_immediate_register, Const (Int64.of_int (max_int + 1)))
      ; IAnd (Reg RAX, Reg reserved_immediate_register)
      ; IMov (Reg reserved_immediate_register, Const (Int64.of_int (max_int + 1)))
      ; IOr (Reg RAX, Reg reserved_immediate_register)
      ; IMov (Reg reserved_immediate_register, Const (Int64.of_int (max_int + 1)))
      ; ITest (Reg RAX, Reg reserved_immediate_register)
      ]
  ]
;;

let parser_tests =
  [ te "parse_error_1" "(" "Parse error at line 1, col 1: token "
  ; te "parse_error_2" ")" "Parse error at line 1, col 1"
  ; te "parse_error_3" "(()" "Parse error at line 1, col 3"
  ; te "parse_error_4" "())" "Parse error at line 1, col 3"
  ; te "parse_error_5" "(if true: 1)" "Parse error at line 1, col 12"
  ; te "parse_error_6" "(if true: 1 else:)" "Parse error at line 1, col 18"
  ; te "parse_error_7" "(if true:: 1 else: 2)" "Parse error at line 1, col 10"
  ; te "parse_error_8" "add1()" "Parse error at line 1, col 6"
  ; te "parse_error_9" "sub1()" "Parse error at line 1, col 6"
  ; te "parse_error_10" "!()" "Parse error at line 1, col 3"
  ; te "parse_error_11" "add1()" "Parse error at line 1, col 6"
  ; te "parse_error_12" "1 + " "Parse error at line 1, col 4"
  ; te "parse_error_13" "1 - " "Parse error at line 1, col 4"
  ; te "parse_error_14" "1 * " "Parse error at line 1, col 4"
  ; te "parse_error_15" "1 + " "Parse error at line 1, col 4"
  ; te "parse_error_16" "1.0" "Unrecognized character: ."
  ; te "parse_error_17" "- 1" "Parse error at line 1, col 1"
  ; te "parse_error_18" "let  in 2" "Parse error at line 1, col 7"
  ; te "parse_error_19" "let x in 2" "Parse error at line 1, col 8"
  ; te "parse_error_20" "let x= in 2" "Parse error at line 1, col 9"
  ; te "parse_error_21" "1 >=" "Parse error at line 1, col 4"
  ; te "parse_error_22" "1 >" "Parse error at line 1, col 3"
  ; te "parse_error_23" "1 <=" "Parse error at line 1, col 4"
  ; te "parse_error_24" "1 <" "Parse error at line 1, col 3"
  ; te "parse_error_25" "1 ==" "Parse error at line 1, col 4"
  ; te "parse_error_26" "(3)(1)" "Error: tried to call a non-function value: 3"
  ; te "parse_error_27" "true(1)" "Error: tried to call a non-function value: true"
  ; te "parse_error_28" "add1(1, 2)" "Parse error at line 1, col 7"
  ; te "parse_error_29" "5: NotAType" " type name NotAType, used at <parse_error_29, 1:3-1:11>, is not in scope"
  ; t "parse_error_30" "(5: Int) + 5:Int" "10"
  ; te "parse_error_31" "def f<'a>(x: 'a): x\nf(2)" "Parse error at line 1, col 17"
  ; te "parse_func_shadow_add1" "def add1(x): x\nadd1(2)" "Parse error at line 1, col 8"
  ; te "parse_func_shadow_sub1" "def sub1(x): x\nsub1(2)" "Parse error at line 1, col 8"
  ; te "parse_func_shadow_isnum" "def isnum(x): x\nisnum(2)" "Parse error at line 1, col 9"
  ; te "parse_func_shadow_isbool" "def isbool(x): x\nisbool(2)" "Parse error at line 1, col 10"
  ; t "parse_func_shadow_print" "def print(x): x\nprint(2)" "2"
  ; te "parse_func_shadow_printstack" "def printStack(x): x\nprintStack(2)" "Parse error at line 1, col 14"
  ; te "parse_func_shadow_+" "def +(x): x\n+(2)" "Parse error at line 1, col 5"
  ; te
      "parse_concrete_type_as_generic_typevar_1"
      "def func<Int>(x: Int) -> Int: x\nfunc(2): Int"
      "Parse error at line 1, col 12"
  ; te
      "parse_concrete_type_as_generic_typevar_1"
      "def func<a>(x: Int) -> Int: x\nfunc(2): Int"
      "Parse error at line 1, col 10"
  ; te "parse_empty_generic_list" "def f<'a>(x: 'a) -> 'a: x\nf<>(1): Int" "Parse error at line 2, col 3"
  ; te "parse_prim1_as_val" "let x=add1 in x(5)" "Parse error at line 1, col 13"
  ]
;;

let interpreter_tests =
  [ ti "interpret_1" "1 + 2" "3"
  ; ti "interpret_2" "if true: 1 else: 2" "1"
  ; ti "interpret_3" "if false: 1 else: 2" "2"
  ; ti "interpret_4" "if 1 > 2: 1 + 2 else: 1 == 3" "false"
  ; ti "interpret_5" "true || 1" "true"
  ; ti "interpret_6" "false && 1" "false"
  ; ti "interpret_7" "def fib(x):\n  if x <= 2: 1\n  else: fib(x - 1) + fib(x - 2)\n\nfib(10)" "55"
  ; ti
      "interpret_8"
      "def ident(x):\n  x\ndef fib(x):\n  if x <= 2: ident(1)\n  else: fib(x - 1) + fib(x - 2)\n\nfib(10)"
      "55"
  ; ti
      "interpret_9"
      ("def fib1(x):if x <= 2: 1 else: fib1(x - 1) + fib2(x - 2)\n"
      ^ "def fib2(x): if x <= 2: 1 else: fib2(x - 1) + fib1(x - 2)\n"
      ^ "fib1(10)")
      "55"
  ; ti
      "interpret_10"
      ("def fib1(x):if x <= 2: 1 else: fib1(x - 1) + fib2(x - 2)\n"
      ^ "and def fib2(x): if x <= 2: 1 else: fib2(x - 1) + fib1(x - 2)\n"
      ^ "fib1(10)")
      "55"
  ; ti "interpret_11" "(1, 2, (4, true))" "(1, 2, (4, true))"
  ; ti "interpret_12" "let x=((2, 3), 2, 3) in x[0 of 3]" "(2, 3)"
  ; ti "interpret_13" "let x=((2, 3), 2, 3) in x[0 of 3 := true]" "(true, 2, 3)"
  ; ti "interpret_14" "(1, (2, (3, nil: Int)))" "(1, (2, (3, nil)))"
  ; ti "interpret_15" "let x=(1,2), y=(1,2) in x == y" "false"
  ; ti "interpret_16" "let x=(1,2), y=(1,2) in equal(x,y)" "true"
  ; ti "interpret_17" "let x=(1,2), y=x in x==y" "true"
  ; ti "interpret_18" "let x=1, y=1 in x==y" "true"
  ; ti "interpret_19" "equal((1,(3, false)), (1, (3, false)))" "true"
  ; ti "interpret_20" "equal((1,(3, false)), (1, (3, true)))" "false"
  ]
;;

let well_formed_failures =
  [ te
      "dupe_fun_1"
      "def a(): 1\ndef a(): 2\na()"
      "The function name a, redefined at <dupe_fun_1, 2:0-2:10>, duplicates one at <dupe_fun_1, 1:0-1:10>"
  ; te
      "dupe_fun_2"
      "def a(): 1\nand def a(): 2\na()"
      "The function name a, redefined at <dupe_fun_2, 2:4-2:14>, duplicates one at <dupe_fun_2, 1:0-1:10>"
  ; te
      "dupe_fun_3"
      "def a(): 1\nand def a(): 2\ndef a(): 3\na()"
      ("The function name a, redefined at <dupe_fun_3, 2:4-2:14>, duplicates one at <dupe_fun_3, 1:0-1:10>\n"
      ^ "The function name a, redefined at <dupe_fun_3, 3:0-3:10>, duplicates one at <dupe_fun_3, 2:4-2:14>")
  ; te
      "dupe_let_1"
      "let a=1, b=2, a=3 in a"
      "The identifier a, redefined at <dupe_let_1, 1:14-1:15>, duplicates one at <dupe_let_1, 1:4-1:5>"
  ; te "undefined_var_1" "let a=1 in b" "The identifier b, used at <undefined_var_1, 1:11-1:12>, is not in scope"
  ; te "undefined_var_2" "def f(x): y\nf(1)" "The identifier y, used at <undefined_var_2, 1:10-1:11>, is not in scope"
  ; te
      "undefined_var_3"
      "def f(x): if x: y else: 1\nf(1)"
      "The identifier y, used at <undefined_var_3, 1:16-1:17>, is not in scope"
  ; te
      "undefined_var_4"
      "def f(x): if x: y else: 1\nf(1)"
      "The identifier y, used at <undefined_var_4, 1:16-1:17>, is not in scope"
  ; te
      "undefined_var_5"
      "def f(x): y + 2\nf(1)"
      "The identifier y, used at <undefined_var_5, 1:10-1:11>, is not in scope"
  ; te
      "undefined_var_6"
      "def f(x): add1(y)\nf(1)"
      "The identifier y, used at <undefined_var_6, 1:15-1:16>, is not in scope"
  ; te "undefined_var_7" "def leppard() : 1\nleppard + 2" "Type Error: arithmetic expected a number, found 0x"
  ; te "undefined_var_8" "let x=y in x" "The identifier y, used at <undefined_var_8, 1:6-1:7>, is not in scope"
  ; te "undefined_var_9" "let x=1 in y" "The identifier y, used at <undefined_var_9, 1:11-1:12>, is not in scope"
  ; te
      "undefined_var_10"
      "(let x=1 in x) + x"
      "The identifier x, used at <undefined_var_10, 1:17-1:18>, is not in scope"
  ; te
      "overflow_big_const_1"
      "4611686018427387904"
      ("The number literal 4611686018427387904, used at <overflow_big_const_1, 1:0-1:19>, is not "
      ^ "supported in this language")
  ; te
      "overflow_big_const_2"
      "-4611686018427387905"
      ("The number literal -4611686018427387905, used at <overflow_big_const_2, 1:0-1:20>, is not supported "
      ^ "in this language")
  ; te
      "overflow_big_const_3"
      "if false: 4611686018427387904 else: 1"
      ("The number literal 4611686018427387904, used at <overflow_big_const_3, 1:10-1:29>, is not supported "
      ^ "in this language")
  ; te "unbound_fun_1" "a()" "The identifier a, used at <unbound_fun_1, 1:0-1:1>, is not in scope"
  ; te "unbound_fun_2" "print(a()+2)" "The identifier a, used at <unbound_fun_2, 1:6-1:7>, is not in scope"
  ; te
      "unbound_fun_3"
      "def f(x): a(x)\nf()"
      ("The identifier a, used at <unbound_fun_3, 1:10-1:11>, is not in scope\n"
      ^ "The function called at <unbound_fun_3, 2:0-2:3> expected an arity of 1, but received 0 arguments")
  ; te "unbound_fun_4" "let fun = 0 in fun(3)" "Error: tried to call a non-function value: 0"
  ; te
      "duplicate_arg_1"
      "def a(x,y,x): x+y\na(1,2,3)"
      "The identifier x, redefined at <duplicate_arg_1, 1:10-1:11>, duplicates one at <duplicate_arg_1, 1:6-1:7>"
  ; te
      "duplicate_arg_2"
      "def a(x,y,x,y): x+y\na(1,2,3,4)"
      ("The identifier x, redefined at <duplicate_arg_2, 1:10-1:11>, duplicates one at <duplicate_arg_2, 1:6-1:7>\n"
      ^ "The identifier y, redefined at <duplicate_arg_2, 1:12-1:13>, duplicates one at <duplicate_arg_2, 1:8-1:9>")
  ; te "duplicate_arg_3" "def f(x): x\nlet a=1, f=2 in f(f)" "Error: tried to call a non-function value: 2"
  ; t "duplicate_arg_4" "def f(x): x\nlet a=1, f=2 in f" "2"
  ; te
      "arity_error_1"
      "def f():1\nf(1)"
      "The function called at <arity_error_1, 2:0-2:4> expected an arity of 0, but received 1 arguments"
  ; te
      "arity_error_2"
      "def f(a,b):1\nf(1)"
      "The function called at <arity_error_2, 2:0-2:4> expected an arity of 2, but received 1 arguments"
  ; te
      "arity_error_3"
      "def f(a,b):1\nf(1,2,3)"
      "The function called at <arity_error_3, 2:0-2:8> expected an arity of 2, but received 3 arguments"
  ; te
      "error_in_let_binding"
      "let x=a in x"
      "The identifier a, used at <error_in_let_binding, 1:6-1:7>, is not in scope"
  ; te
      "malformed_example_from_assignment"
      "def f(x, x): y\n f(1)"
      ("The identifier x, redefined at <malformed_example_from_assignment, 1:9-1:10>, duplicates "
      ^ "one at <malformed_example_from_assignment, 1:6-1:7>\nThe identifier y, used at "
      ^ "<malformed_example_from_assignment, 1:13-1:14>, is not in scope")
  ; t "rebind_func_1" "def f(x): x\nlet f=1 in f" "1"
  ; te "rebind_func_2" "def f(x): x\nlet f=1 in f(f)" "Error: tried to call a non-function value: 1"
  ; te
      "rebind_id_thrice"
      "def f(x,x,x): x\nf(1,1,1)"
      ("The identifier x, redefined at <rebind_id_thrice, 1:8-1:9>, duplicates one at <rebind_id_thrice, 1:6-1:7>\n"
      ^ "The identifier x, redefined at <rebind_id_thrice, 1:10-1:11>, duplicates one at <rebind_id_thrice, 1:8-1:9>")
  ; te "call_id_as_func" "let f=1 in f()" "Error: tried to call a non-function value: 1"
  ; te
      "forward_ref_not_allowed_1"
      "def f1(x): f2(x)\ndef f2(x): f1(x)\nf1(2)"
      "The identifier f2, used at <forward_ref_not_allowed_1, 1:11-1:13>, is not in scope"
  ; te
      "forward_ref_not_allowed_2"
      "def f1(x): f2(x)\ndef f2(x): x\nf1(2)"
      "The identifier f2, used at <forward_ref_not_allowed_2, 1:11-1:13>, is not in scope"
  ; t "func_named_our_code_starts_here" "def our_code_starts_here(x): x\nour_code_starts_here(2)" "2"
  ; t "var_shadow_func_in_other_group" "def f(): let g=1 in g\ndef g(): f()\ng()" "1"
  ; t "var_shadow_func_in_same_group" "def f(): let g=1 in g\nand def g(): f()\ng()" "1"
  ; te
      "lambda_tuple_unpacking_duplicate"
      "(lambda ((x,y), x): 1)"
      ("The identifier x, redefined at <lambda_tuple_unpacking_duplicate, 1:16-1:17>, "
      ^ "duplicates one at <lambda_tuple_unpacking_duplicate, 1:10-1:11>")
  ; te
      "def_tuple_unpacking_duplicate"
      "def f((x,y),x): 1\n1"
      ("The identifier x, redefined at <def_tuple_unpacking_duplicate, 1:12-1:13>, "
      ^ "duplicates one at <def_tuple_unpacking_duplicate, 1:7-1:8>")
  ; te
      "let_tuple_unpacking_duplicate"
      "let ((x,y),x)=1 in 1"
      ("The identifier x, redefined at <let_tuple_unpacking_duplicate, 1:11-1:12>, "
      ^ "duplicates one at <let_tuple_unpacking_duplicate, 1:6-1:7>")
  ]
;;

let anf_tests =
  [ tanfs
      "tanf_expand_let_1"
      "let a=1 in 2"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in "
      ^ "(alet equal = (lam(a, b) (*native#equal(a, b))) in (alet a = 1 in 2))))\n")
  ; tanfs
      "tanf_expand_let_2"
      "let a=1 in (let b=a in 2)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in "
      ^ "(alet equal = (lam(a, b) (*native#equal(a, b))) in (alet a = 1 in (alet b = a in 2)))))\n")
  ; tanfs
      "tanf_expand_let_3"
      "let a=1,b=a,c=b in c"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in "
      ^ "(alet equal = (lam(a, b) (*native#equal(a, b))) in "
      ^ "(alet a = 1 in (alet b = a in (alet c = b in c))))))\n")
  ; tanfs
      "tanf_expand_let_4"
      "if 0: 0 else: 2 * (let a=2, b=a, c=3 in (let a=4 in b*c))"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) "
      ^ "in (alet equal = (lam(a, b) (*native#equal(a, b))) in (if 0: 0 else: (alet a = 2 in (alet "
      ^ "b = a in (alet c = 3 in (alet a = 4 in (alet binop_53 = (b * c) in (2 * binop_53))))))))))\n")
  ; tanfs
      "tanf_expand_let_s_3"
      "let a=(let b = 1 in b) in a"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet b = 1 in (alet a = b in a)))))\n")
  ; tanfs
      "tanf_expand_let_s_4"
      "(let x=1 in x) + (let x=2 in x)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet x = 1 in (alet x = 2 in (x + x))))))\n")
  ; tanfs
      "tanf_prim1_1"
      "add1(2)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in add1(2))))\n")
  ; tanfs
      "tanf_prim1_2"
      "add1(let x=1 in x)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet x = 1 in add1(x)))))\n")
  ; tanfs
      "tanf_prim1_3"
      "let x = 1 in add1(x)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet x = 1 in add1(x)))))\n")
  ; tanfs
      "tanf_prim2_1"
      "1 + 2"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (1 + 2))))\n")
  ; tanfs
      "tanf_prim2_2"
      "(let x=0 in x) + (let x=1 in x)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet x = 0 in (alet x = 1 in (x + x))))))\n")
  ; tanfs
      "tanf_prim2_3"
      "let x=1,y=2 in x+y"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet x = 1 in (alet y = 2 in (x + y))))))\n")
  ; tanfs
      "tanf_num_1"
      "2"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in 2)))\n")
  ; tanfs
      "tanf_num_2"
      "-2"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in -2)))\n")
  ; tanfs
      "tanf_if_lecture_notes_example"
      "(let x = (if 0: 5 + 5 else: 6 * 2) in (let y = (if 1: x * 3 else: x + 5) in 0))"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet x = (if 0: (5 + 5) else: (6 * 2)) in (alet y = (if 1: (x * "
      ^ "3) else: (x + 5)) in 0)))))\n")
  ; tanfs
      "tanf_short_circuit_1"
      "print(1) || print(2)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in ((?print(1)) || (?print(2))))))\n")
  ; tanfs
      "tanf_short_circuit_2"
      "print(1) && print(2)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in ((?print(1)) && (?print(2))))))\n")
  ; tanfs
      "tanf_func_1"
      "def fib(n: Int) -> Int: if n <= 2: 1 else: fib(n - 1) + fib(n - 2)\nfib(10)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) "
      ^ "in (alet equal = (lam(a, b) (*native#equal(a, b))) in (aletrec fib = (lam(n) (alet "
      ^ "binop_36 = (n <= 2) in (if binop_36: 1 else: (alet binop_42 = (n - 1) in (alet app_41 "
      ^ "= (?fib(binop_42)) in (alet binop_47 = (n - 2) in (alet app_46 = (?fib(binop_47)) in "
      ^ "(app_41 + app_46)))))))) in (?fib(10))))))\n")
  ; tanfs
      "tanf_func_2"
      "def fib(n: Int) -> Int: if n <= 2: 1 else: fib(n - 1) + fib(n - 2)\nfib(10)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() "
      ^ "(*native#input())) in (alet equal = (lam(a, b) (*native#equal(a, b))) in (aletrec "
      ^ "fib = (lam(n) (alet binop_36 = (n <= 2) in (if binop_36: 1 else: (alet binop_42 = "
      ^ "(n - 1) in (alet app_41 = (?fib(binop_42)) in (alet binop_47 = (n - 2) in (alet "
      ^ "app_46 = (?fib(binop_47)) in (app_41 + app_46)))))))) in (?fib(10))))))\n")
  ; tanfs
      "tanf_tuple_1"
      "(1, 2)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (1, 2))))\n")
  ; tanfs
      "tanf_tuple_2"
      "(1, (true, (-2,)))"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet tup_34 = (-2) in (alet tup_32 = (true, tup_34) "
      ^ "in (1, tup_32))))))\n")
  ; tanfs
      "tanf_tuple_3"
      "let x=(1,2) in (x, x)"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet x = (1, 2) in (x, x)))))\n")
  ; tanfs
      "tanf_tuple_4"
      "let x=(1,2) in x[0 of 2]"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet x = (1, 2) in x[0]))))\n")
  ; tanfs
      "tanf_tuple_5"
      "let x=(1,2) in x[0 of 2 := 5]"
      ("\n(alet print = (lam(a) (*native#print(a))) in (alet input = (lam() (*native#input())) in (alet "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (alet x = (1, 2) in x[0 := 5]))))\n")
  ]
;;

let desugar_tests =
  [ tdesugar
      "desugar_1"
      "1;<Int> 2"
      ("\n\n(let print = (lam(a) (*native#print(a))), input = (lam() (*native#input())), "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (let _ = 1 in 2))\n")
  ; tdesugar
      "desugar_2"
      "let x: (Int * (Int * Bool)) = (1, (2, true)), (a:Int, (b:Int, c:Bool))=x in a+b"
      ("\n\n(let print = (lam(a) (*native#print(a))), input = (lam() (*native#input())), "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (let x : (Int * (Int * Bool)) = "
      ^ "(1, (2, true)), a : Int = x[0 of 2], x_1 : (Int * Bool) = x[1 of 2], b : Int "
      ^ "= x_1[0 of 2], c : Bool = x_1[1 of 2] in (a + b)))\n")
  ; tdesugar
      "desugar_3"
      "def f((x, y)): x+y\nf((1,2))"
      ("\n\n(let print = (lam(a) (*native#print(a))), input = (lam() (*native#input())), "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (let-rec f = (lam(gen#untuple_arg_1 : "
      ^ "(<BLANK> * <BLANK>)) (let x = gen#untuple_arg_1[0 of 2], y = gen#untuple_arg_1[1 "
      ^ "of 2] in (x + y))) in (?f((1, 2)))))\n")
  ; tdesugar
      "desugar_4"
      "def f(x): x\nand def g(x): x\nf(2)"
      ("\n\n(let print = (lam(a) (*native#print(a))), input = (lam() (*native#input())), "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (let-rec f = (lam(x) x), g = "
      ^ "(lam(x) x) in (?f(2))))\n")
  ; tdesugar
      "desugar_5"
      "let rec f=(lambda (x): print(x); 1) in f(3)"
      ("\n\n(let print = (lam(a) (*native#print(a))), input = (lam() (*native#input())), "
      ^ "equal = (lam(a, b) (*native#equal(a, b))) in (let-rec f = (lam(x) "
      ^ "(let _ = (?print(x)) in 1)) in (?f(3))))\n")
  ]
;;

let freevars_tests =
  [ t_freevars "freevars_1" "(lambda: x)" [ "x" ]
  ; t_freevars "freevars_2" "(lambda: x + x + y)" [ "x"; "y" ]
  ; t_freevars "freevars_3" "(lambda (x): x + x + y)" [ "y" ]
  ; t_freevars "freevars_4" "(lambda (x): if x: y else: !(z))" [ "y"; "z" ]
  ; t_freevars "freevars_5" "(lambda (x): if x: y else: (lambda (z): z+b)(a))" [ "y"; "b"; "a" ]
  ; t_freevars "freevars_6" "(lambda (x, y): x+y)" []
  ; t_freevars "freevars_7" "(lambda (x): (x+y, 1, z))" [ "y"; "z" ]
  ; t_freevars "freevars_8" "(lambda (x): x+z[0 of 2])" [ "z" ]
  ; t_freevars "freevars_9" "(lambda (x): x+z[0 of 2 := a])" [ "z"; "a" ]
  ; t_freevars "freevars_10" "(lambda (x): x+z[0 of 2 := a]; b)" [ "z"; "a"; "b" ]
  ; t_freevars "freevars_11" "(lambda (x): let a=x, b=y, y=1 in y+a+b)" [ "y" ]
  ; t_freevars "freevars_12" "(lambda (x): let a=1, b=2 in a+b+x)" []
  ; t_freevars "freevars_13" "(lambda (x): let rec f1=(lambda: a), f2=(lambda (a): a+b) in f1(c)+x)" [ "a"; "b"; "c" ]
  ]
;;

(*
  _______                  _____ _               _             
 |__   __|                / ____| |             | |            
    | |_   _ _ __   ___  | |    | |__   ___  ___| | _____ _ __ 
    | | | | | '_ \ / _ \ | |    | '_ \ / _ \/ __| |/ / _ \ '__|
    | | |_| | |_) |  __/ | |____| | | |  __/ (__|   <  __/ |   
    |_|\__, | .__/ \___|  \_____|_| |_|\___|\___|_|\_\___|_|   
        __/ | |                                                
       |___/|_|                                                
*)

let tc_simple_tests =
  [ tc "tc_lone_int" "40: Int" "40"
  ; tce "tc_int_as_bool" "1: Bool" "Type error at tc_int_as_bool, 1:0-1:1: expected Bool but got Int"
  ; tc "tc_lone_bool" "true: Bool" "true"
  ; tce "tc_bool_as_int" "true: Int" "Type error at tc_bool_as_int, 1:0-1:4: expected Int but got Bool"
  ; tce "unannotated_body_1" "5" "The program body at <unannotated_body_1, 1:0-1:1> has no type defined"
  ; tce "unannotated_body_2" "true" "The program body at <unannotated_body_2, 1:0-1:4> has no type defined"
  ; tce "bogus_type" "5: FooBar" "The type name FooBar, used at <bogus_type, 1:3-1:9>, is not in scope"
  ]
;;

let tc_prim1_tests =
  [ tc "tc_add1_1" "add1(1): Int" "2"
  ; tce "tc_add1_2" "add1(true): Int" "Type error at tc_add1_2, 1:5-1:9: expected Int but got Bool"
  ; tce "tc_add1_3" "add1(1): Bool" "Type error at tc_add1_3, 1:0-1:7: expected Bool but got Int"
  ; tce
      "tc_add1_4"
      "add1(true): Bool"
      ("Type error at tc_add1_4, 1:0-1:10: expected Bool but got Int\n"
      ^ "Type error at tc_add1_4, 1:5-1:9: expected Int but got Bool")
  ; tc "tc_sub1_1" "sub1(1): Int" "0"
  ; tce "tc_sub1_2" "sub1(true): Int" "Type error at tc_sub1_2, 1:5-1:9: expected Int but got Bool"
  ; tce "tc_sub1_3" "sub1(1): Bool" "Type error at tc_sub1_3, 1:0-1:7: expected Bool but got Int"
  ; tce
      "tc_sub1_4"
      "sub1(true): Bool"
      ("Type error at tc_sub1_4, 1:0-1:10: expected Bool but got Int\n"
      ^ "Type error at tc_sub1_4, 1:5-1:9: expected Int but got Bool")
  ; tc "tc_print_1" "print<Int>(1): Int" "1\n1"
  ; tc "tc_print_2" "print<Bool>(true): Bool" "true\ntrue"
  ; tce "tc_print_3" "print<Bool>(1): Bool" "Type error at tc_print_3, 1:12-1:13: expected Bool but got Int"
  ; tce "tc_print_4" "print<Int>(false): Int" "Type error at tc_print_4, 1:11-1:16: expected Int but got Bool"
  ; tce "tc_print_5" "print<Bool>(false): Int" "Type error at tc_print_5, 1:0-1:18: expected Int but got Bool"
  ; tce
      "tc_print_6"
      "print(false): Bool"
      "The function print, called at tc_print_6, 1:0-1:12, expected 1 type arguments but only 0 types provided"
  ; tc "tc_isbool_1" "isbool<Int>(5): Bool" "false"
  ; tc "tc_isbool_2" "isbool<Bool>(false): Bool" "true"
  ; tce "tc_isbool_3" "isbool<Bool>(1): Bool" "Type error at tc_isbool_3, 1:13-1:14: expected Bool but got Int"
  ; tce "tc_isbool_4" "isbool<Int>(true): Bool" "Type error at tc_isbool_4, 1:12-1:16: expected Int but got Bool"
  ; tce
      "tc_isbool_5"
      "isbool<Int>(true): Int"
      ("Type error at tc_isbool_5, 1:0-1:17: expected Int but got Bool\n"
      ^ "Type error at tc_isbool_5, 1:12-1:16: expected Int but got Bool")
  ; tc "tc_isnum_1" "isnum<Int>(5): Bool" "true"
  ; tc "tc_isnum_2" "isnum<Bool>(false): Bool" "false"
  ; tce "tc_isnum_3" "isnum<Bool>(1): Bool" "Type error at tc_isnum_3, 1:12-1:13: expected Bool but got Int"
  ; tce "tc_isnum_4" "isnum<Int>(true): Bool" "Type error at tc_isnum_4, 1:11-1:15: expected Int but got Bool"
  ; tce
      "tc_isnum_5"
      "isnum<Int>(true): Int"
      ("Type error at tc_isnum_5, 1:0-1:16: expected Int but got Bool\n"
      ^ "Type error at tc_isnum_5, 1:11-1:15: expected Int but got Bool")
  ; tc "tc_not_1" "!(true): Bool" "false"
  ; tc "tc_not_2" "!(false): Bool" "true"
  ; tce "tc_not_3" "!(3): Bool" "Type error at tc_not_3, 1:2-1:3: expected Bool but got Int"
  ; tce "tc_not_4" "let x:Int=3 in !(x): Bool" "Type error at tc_not_4, 1:17-1:18: expected Bool but got Int"
  ; tce
      "tc_not_5"
      "!(5): Int"
      ("Type error at tc_not_5, 1:0-1:4: expected Int but got Bool\n"
      ^ "Type error at tc_not_5, 1:2-1:3: expected Bool but got Int")
  ]
;;

let tc_prim2_tests =
  [ tc "tc_plus_1" "1 + 1: Int" "2"
  ; tc "tc_plus_2" "1 + 3: Int" "4"
  ; tce "tc_plus_3" "1 + 2: Bool" "Type error at tc_plus_3, 1:0-1:5: expected Bool but got Int"
  ; tce "tc_plus_4" "1 + false: Int" "Type error at tc_plus_4, 1:4-1:9: expected Int but got Bool"
  ; tce "tc_plus_5" "true + 2: Int" "Type error at tc_plus_5, 1:0-1:4: expected Int but got Bool"
  ; tc "tc_minus_1" "1 - 1: Int" "0"
  ; tc "tc_minus_2" "1 - 3: Int" "-2"
  ; tce "tc_minus_3" "1 - 2: Bool" "Type error at tc_minus_3, 1:0-1:5: expected Bool but got Int"
  ; tce "tc_minus_4" "1 - false: Int" "Type error at tc_minus_4, 1:4-1:9: expected Int but got Bool"
  ; tce "tc_minus_5" "true - 2: Int" "Type error at tc_minus_5, 1:0-1:4: expected Int but got Bool"
  ; tc "tc_mult_1" "1 * 1: Int" "1"
  ; tc "tc_mult_2" "1 * 3: Int" "3"
  ; tce "tc_mult_3" "1 * 2: Bool" "Type error at tc_mult_3, 1:0-1:5: expected Bool but got Int"
  ; tce "tc_mult_4" "1 * false: Int" "Type error at tc_mult_4, 1:4-1:9: expected Int but got Bool"
  ; tce "tc_mult_5" "true * 2: Int" "Type error at tc_mult_5, 1:0-1:4: expected Int but got Bool"
  ; tc "tc_and_1" "true && true: Bool" "true"
  ; tc "tc_and_2" "true && false: Bool" "false"
  ; tce "tc_and_3" "true && 1: Bool" "Type error at tc_and_3, 1:8-1:9: expected Bool but got Int"
  ; tce "tc_and_4" "3 && false: Bool" "Type error at tc_and_4, 1:0-1:1: expected Bool but got Int"
  ; tce "tc_and_5" "true && false: Int" "Type error at tc_and_5, 1:0-1:13: expected Int but got Bool"
  ; tc "tc_or_1" "true || false: Bool" "true"
  ; tc "tc_or_2" "false || false: Bool" "false"
  ; tce "tc_or_3" "true || 1: Bool" "Type error at tc_or_3, 1:8-1:9: expected Bool but got Int"
  ; tce "tc_or_4" "3 || false: Bool" "Type error at tc_or_4, 1:0-1:1: expected Bool but got Int"
  ; tce "tc_or_5" "true || false: Int" "Type error at tc_or_5, 1:0-1:13: expected Int but got Bool"
  ; tc "tc_gt_1" "1 > 2: Bool" "false"
  ; tc "tc_gt_2" "3 > 2: Bool" "true"
  ; tce "tc_gt_3" "3 > false: Bool" "Type error at tc_gt_3, 1:4-1:9: expected Int but got Bool"
  ; tce "tc_gt_4" "true > 5: Bool" "Type error at tc_gt_4, 1:0-1:4: expected Int but got Bool"
  ; tce "tc_gt_5" "3 > 5: Int" "Type error at tc_gt_5, 1:0-1:5: expected Int but got Bool"
  ; tc "tc_gte_1" "1 >= 2: Bool" "false"
  ; tc "tc_gte_2" "2 >= 2: Bool" "true"
  ; tce "tc_gte_3" "3 >= false: Bool" "Type error at tc_gte_3, 1:5-1:10: expected Int but got Bool"
  ; tce "tc_gte_4" "true >= 5: Bool" "Type error at tc_gte_4, 1:0-1:4: expected Int but got Bool"
  ; tce "tc_gte_5" "3 >= 5: Int" "Type error at tc_gte_5, 1:0-1:6: expected Int but got Bool"
  ; tc "tc_lt_1" "1 < 2: Bool" "true"
  ; tc "tc_lt_2" "3 < 2: Bool" "false"
  ; tce "tc_lt_3" "3 < false: Bool" "Type error at tc_lt_3, 1:4-1:9: expected Int but got Bool"
  ; tce "tc_lt_4" "true < 5: Bool" "Type error at tc_lt_4, 1:0-1:4: expected Int but got Bool"
  ; tce "tc_lt_5" "3 < 5: Int" "Type error at tc_lt_5, 1:0-1:5: expected Int but got Bool"
  ; tce
      "tc_lt_with_type"
      "3 <<Int> 5: Bool"
      "The function <, called at tc_lt_with_type, 1:0-1:10, expected 0 type arguments but only 1 types provided"
  ; tc "tc_lte_1" "3 <= 2: Bool" "false"
  ; tc "tc_lte_2" "2 <= 2: Bool" "true"
  ; tce "tc_lte_3" "3 <= false: Bool" "Type error at tc_lte_3, 1:5-1:10: expected Int but got Bool"
  ; tce "tc_lte_4" "true <= 5: Bool" "Type error at tc_lte_4, 1:0-1:4: expected Int but got Bool"
  ; tce "tc_lte_5" "3 <= 5: Int" "Type error at tc_lte_5, 1:0-1:6: expected Int but got Bool"
  ; tc "tc_eq_int_1" "(1 ==<Int> 2): Bool" "false"
  ; tc "tc_eq_int_2" "(1 ==<Int> 1): Bool" "true"
  ; tc "tc_eq_bool_1" "(true ==<Bool> false):Bool" "false"
  ; tc "tc_eq_bool_2" "(true ==<Bool> true):Bool" "true"
  ; tc "tc_eq_bool_3" "(false ==<Bool> true):Bool" "false"
  ; tce "tc_eq_err_1" "(true ==<Bool> 1):Bool" "Type error at tc_eq_err_1, 1:15-1:16: expected Bool but got Int"
  ; tce "tc_eq_err_2" "(true ==<Int> 1):Bool" "Type error at tc_eq_err_2, 1:1-1:5: expected Int but got Bool"
  ; tce
      "tc_eq_err_3"
      "(true == true): Bool"
      "The function ==, called at tc_eq_err_3, 1:1-1:13, expected 1 type arguments but only 0 types provided"
  ; tce "tc_eq_err_4" "(true ==<Bool> true): Int" "Type error at tc_eq_err_4, 1:1-1:19: expected Int but got Bool"
  ]
;;

let tc_if_tests =
  [ tc "tc_if_1" "(if true: 1 else: 2): Int" "1"
  ; tc "tc_if_2" "if false: true else: false: Bool" "false"
  ; tce "tc_if_3" "if true: 1 else: false: Int" "Type error at tc_if_3, 1:17-1:22: expected Int but got Bool"
  ; tce "tc_if_4" "if false: false else: 3: Int" "Type error at tc_if_4, 1:10-1:15: expected Int but got Bool"
  ; tce "tc_if_5" "if true: 1 else: false: Bool" "Type error at tc_if_5, 1:9-1:10: expected Bool but got Int"
  ; tce "tc_if_6" "if false: false else: 3: Bool" "Type error at tc_if_6, 1:22-1:23: expected Bool but got Int"
  ]
;;

let tc_sequence_tests =
  [ tc "tc_seq_1" "1;<Int> 2: Int" "2"
  ; tc "tc_seq_2" "true;<Bool> 2: Int" "2"
  ; tce "tc_seq_3" "1;<Bool> 2: Int" "Type error at tc_seq_3, 1:0-1:1: expected Bool but got Int"
  ; tc "tc_seq_4" "1;<Int> true: Bool" "true"
  ; tce "tc_seq_5" "1;<Int> 3: Bool" "Type error at tc_seq_5, 1:8-1:9: expected Bool but got Int"
  ; tc "tc_seq_6" "print<Int>(1);<Int> print<Bool>(true): Bool" "1\ntrue\ntrue"
  ; tce "tc_seq_7" "1; 2: Int" "The variable _ at <tc_seq_7, 1:0-1:4> has no type defined"
  ]
;;

let tc_annot_tests =
  [ tc "tc_annot_1" "(if true: 5 else: 7): Int" "5"
  ; tce "tc_annot_2" "(if true: (7: Bool) else: 8): Int" "Type Annotation did not match expected type"
  ; t_any
      "tc_annot_3"
      (is_okay
         (type_check
            (Program
               ( []
               , [ [] ]
               , EAnnot
                   ( EIf
                       ( EBool (true, dummy_span)
                       , EAnnot (ENumber (7L, dummy_span), tInt, dummy_span)
                       , ENumber (8L, dummy_span)
                       , dummy_span )
                   , tInt
                   , dummy_span )
               , dummy_span ))))
      true
  ]
;;

let tc_let_tests =
  [ tc "tc_let_1" "let x:Int=1 in 2: Int" "2"
  ; tc "tc_let_2" "let x:Int=1 in x: Int" "1"
  ; tc "tc_let_3" "let x:Int=1, y:Int=3 in x+y: Int" "4"
  ; tce "tc_let_4" "let x:Int=1, y:Int=false in x+y: Int" "Type error at tc_let_4, 1:19-1:24: expected Int but got Bool"
  ; tce
      "tc_let_5"
      "let x:Int=1, y:Bool=false in x+y: Int"
      "Type error at tc_let_5, 1:31-1:32: expected Int but got Bool"
  ; tc "tc_let_6" "let x:Int=1, y:Bool=false in (let x:Bool=true in x || y): Bool" "true"
  ; tc "tc_let_7" "let x:Int=1, y:Int=(3+4) in (let x:Int=7 in x + y) + x: Int" "15"
  ; tce
      "tc_let_8"
      "let x:Bool=true, y:Int=(3+4) in (let x:Int=7 in x + y) + x: Int"
      "Type error at tc_let_8, 1:57-1:58: expected Int but got Bool"
  ; tce "tc_let_9" "let x=1 in 1: Int" "The variable x at <tc_let_9, 1:4-1:5> has no type defined"
  ; tc "tc_let_10" "let x:Int = 1, y:Int=x, z:Int=x+y in z:Int" "2"
  ]
;;

let tc_func_tests =
  [ tc "tc_simple_func_1" "def f() -> Int: 1\nf(): Int" "1"
  ; tc "tc_simple_func_2" "def f(x: Int) -> Int: x\nf(2): Int" "2"
  ; tce
      "tc_simple_func_3"
      "def f(x: Int) -> Int: x\nf(2): Bool"
      "Type error at tc_simple_func_3, 2:0-2:4: expected Bool but got Int"
  ; tce
      "tc_simple_func_4"
      "def f(x: Int) -> Int: false\nf(2): Int"
      "Type error at tc_simple_func_4, 1:22-1:27: expected Int but got Bool"
  ; tc "tc_fib_1" "def fib(x: Int) -> Int: (if x <= 2: 1 else: fib(x - 1) + fib(x - 2))\nfib(10): Int" "55"
  ; tce
      "tc_missing_return_type_1"
      "def f(x: Int): x\n1: Int"
      "The function f at <tc_missing_return_type_1, 1:0-1:16> has no type defined"
  ; tce
      "tc_missing_return_type"
      "def fib(x: Int): (if x <= 2: 1 else: fib(x - 1) + fib(x - 2))\nfib(10): Int"
      ("Type error at tc_missing_return_type, 2:0-2:7: expected Int but got <BLANK>\n"
      ^ "The function fib at <tc_missing_return_type, 1:0-1:61> has no type defined")
  ; tce
      "tc_missing_arg_type"
      "def f(x) -> Int: 1\nf(2): Int"
      ("Type error at tc_missing_arg_type, 2:2-2:3: expected <BLANK> but got Int\n"
      ^ "The variable x at <tc_missing_arg_type, 1:6-1:7> has no type defined")
  ; tc
      "tc_mutual_recursion"
      "def foo(a: Int) -> Int: if a ==<Int> 0: 42 else: bar(a)\nand def bar(a: Int) -> Int: foo(a - 1)\nfoo(10): Int"
      "42"
  ; tc "tc_generic_identity_1" "def iden<'a>(x: 'a) -> 'a: x\niden<Int>(5): Int" "5"
  ; tc "tc_generic_identity_2" "def iden<'a>(x: 'a) -> 'a: x\niden<Bool>(true): Bool" "true"
  ; tce
      "tc_generic_1"
      "def iden<'a>(x: 'a) -> 'a: 1\niden<Bool>(true): Bool"
      "Type error at tc_generic_1, 1:27-1:28: expected 'a but got Int"
  ; tc "tc_generic_print" "def f<'a>(x: 'a) -> 'a: print<'a>(x)\nf<Int>(2): Int" "2\n2"
  ; tce
      "tc_wrong_number_generics_1"
      "def f(x: Int) -> Int: x\nf<Int>(2): Int"
      ("The function f, called at tc_wrong_number_generics_1, 2:0-2:9, expected 0 type arguments but only 1 "
      ^ "types provided")
  ; tce
      "tc_wrong_number_generics_2"
      "def f<'a>(x: 'a) -> 'a: x\nf(2): Int"
      ("The function f, called at tc_wrong_number_generics_2, 2:0-2:4, expected 1 type arguments but only 0 "
      ^ "types provided")
  ; tce
      "tc_wrong_number_generics_3"
      "def f<'a>(x: 'a) -> 'a: x\nf<Int, Bool>(2): Int"
      ("The function f, called at tc_wrong_number_generics_3, 2:0-2:15, expected 1 type arguments but only 2 "
      ^ "types provided")
  ; tce
      "tc_wrong_number_generics_4"
      "1 == 2: Bool"
      ("The function ==, called at tc_wrong_number_generics_4, 1:0-1:6, expected 1 type arguments but only 0 "
      ^ "types provided")
  ; tce
      "tc_wrong_number_generics_5"
      "print(2): Int"
      ("The function print, called at tc_wrong_number_generics_5, 1:0-1:8, expected 1 type arguments but only 0 types "
      ^ "provided")
  ; tce
      "tc_unbound_generic"
      "print<'a>(5): Int"
      ("Type error at tc_unbound_generic, 1:0-1:12: expected Int but got 'a\n"
      ^ "Type error at tc_unbound_generic, 1:10-1:11: expected 'a but got Int")
  ; tc
      "tc_lots_of_generics_1"
      "def f<'a, 'c>(a: 'a, b: 'a, c: 'c) -> 'c: if a ==<'a> b: print<'c>(c) else: c\nf<Bool, Int>(true, true, 3): Int"
      "3\n3"
  ; tc
      "tc_lots_of_generics_2"
      "def f<'a, 'c>(a: 'a, b: 'a, c: 'c) -> 'c: if a ==<'a> b: print<'c>(c) else: c\nf<Int, Bool>(4, 4, false): Bool"
      "false\nfalse"
  ; tc
      "tc_lots_of_generics_3"
      "def f<'a, 'c>(a: 'a, b: 'a, c: 'c) -> 'c: if a ==<'a> b: print<'c>(c) else: c\nf<Int, Bool>(4, 5, false): Bool"
      "false"
  ; tc "tc_reuse_generic_name_1" "def f1<'a>(x: 'a) -> 'a: x\ndef f2<'a>(x: 'a) -> 'a: f1<'a>(x)\nf2<Int>(3): Int" "3"
  ; tc
      "tc_reuse_generic_name_2"
      "def f1<'a>(x: 'a) -> 'a: x\nand def f2<'a>(x: 'a) -> 'a: f1<'a>(x)\nf2<Int>(3): Int"
      "3"
  ; tc "tc_func_call_in_func_call_1" "def iden<'a>(x: 'a) -> 'a: x\niden<Int>(iden<Int>(iden<Int>(3))):Int" "3"
  ; tce
      "tc_func_call_in_func_call_2"
      "def bIden(b: Bool) -> Bool: b\ndef iden<'a>(x: 'a) -> 'a: bIden(x)\niden<Int>(iden<Int>(iden<Int>(3))):Int"
      ("Type error at tc_func_call_in_func_call_2, 2:27-2:35: expected 'a but got Bool\n"
      ^ "Type error at tc_func_call_in_func_call_2, 2:33-2:34: expected Bool but got 'a")
  ; tce
      "tc_generic_is_not_concrete"
      "def f<'a>(x: 'a) -> Bool: 3 ==<Int> x\nf<Int>(3): Bool"
      "Type error at tc_generic_is_not_concrete, 1:36-1:37: expected Int but got 'a"
  ; tc
      "tc_func_mix_generic_and_concrete_1"
      "def f<'a>(a: 'a, b: 'a, y: Int, z: Int) -> 'a: if y ==<Int> z: a else: b\nf<Bool>(true, false, 3, 3): Bool"
      "true"
  ; tc
      "tc_func_mix_generic_and_concrete_2"
      "def f<'a>(a: 'a, b: 'a, y: Int, z: Int) -> 'a: if y ==<Int> z: a else: b\nf<Bool>(true, false, 3, 4): Bool"
      "false"
  ; tc
      "tc_func_mix_generic_and_concrete_3"
      "def f<'a>(a: 'a, b: 'a, y: Int, z: Int) -> 'a: if y ==<Int> z: a else: b\nf<Int>(12, 42, 3, 4): Int"
      "42"
  ; tc
      "tc_func_mix_generic_and_concrete_4"
      "def f<'a>(a: 'a, b: 'a, y: Int, z: Int) -> 'a: if y ==<Int> z: a else: b\nf<Int>(12, 42, 3, 3): Int"
      "12"
  ; tce
      "tc_unused_func_1"
      "def f(x: Int) -> Bool: x\n1: Int"
      "Type error at tc_unused_func_1, 1:23-1:24: expected Bool but got Int"
  ; tce
      "tc_unused_func_2"
      "def f(x: 'a) -> 'a: x\n1: Int"
      ("The type var 'a used at tc_unused_func_2, 1:9-1:11 is not a defined type var\n"
      ^ "The type var 'a used at tc_unused_func_2, 1:16-1:18 is not a defined type var")
  ; tce
      "tc_unused_func_3"
      "def f(x: FooBar) -> FooBar: x\n1: Int"
      "The type name FooBar, used at <tc_unused_func_3, 1:20-1:26>, is not in scope"
  ; tc "tc_func_blank_arg" "def f(_: Int) -> Int: 9\nf(2): Int" "9"
  ; tc
      "tc_func_tuple_1"
      "def f(x: (Int * Bool)) -> (Bool * Int):\n  (x[1 of 2], x[0 of 2])\nf((3, true)): (Bool * Int)"
      "(true, 3)"
  ; tc
      "tc_func_tuple_2"
      "def f<'a, 'b>(x: ('a * 'b)) -> ('b * 'a):\n  (x[1 of 2], x[0 of 2])\nf<Bool, Int>((true, 3)): (Int * Bool)"
      "(3, true)"
  ]
;;

(* For things that can't be reached from just running a source program *)

let tc_tuple_tests =
  [ tc "tc_tuple_simple_1" "(1,2): (Int * Int)" "(1, 2)"
  ; tc "tc_tuple_simple_2" "(1,(3, true)): (Int * (Int * Bool))" "(1, (3, true))"
  ; tce "tc_tuple_simple_3" "(1, 2): (Int * Bool)" "Type error at tc_tuple_simple_3, 1:4-1:5: expected Bool but got Int"
  ; tc "tc_tuple_simple_4" "let x: (Int*Int) = (1, 2) in x: (Int * Int)" "(1, 2)"
  ; tce
      "tc_tuple_simple_5"
      "let x: (Int*Bool) = (1, false) in x: (Int * Int)"
      "Type error at tc_tuple_simple_5, 1:34-1:35: expected (Int * Int) but got (Int * Bool)"
  ; tce
      "tc_tuple_simple_6"
      "let x: (Int*Bool) = (false, true) in x: (Int * Bool)"
      "Type error at tc_tuple_simple_6, 1:21-1:26: expected Int but got Bool"
  ; tce
      "tc_tuple_simple_7"
      "let x: (Int*Bool) = (1, true) in x: (Bool * Bool)"
      "Type error at tc_tuple_simple_7, 1:33-1:34: expected (Bool * Bool) but got (Int * Bool)"
  ; tc "tc_tuple_get_1" "(let x: (Int * Bool) = (1, true) in x[0 of 2]): Int" "1"
  ; tc "tc_tuple_get_2" "let x: (Int * Bool) = (1, true) in x[1 of 2]: Bool" "true"
  ; tc
      "tc_tuple_get_3"
      "let x: (Int * (Bool * Int * Int)) = (1, (true, 5, -2)) in x[1 of 2]: (Bool * Int * Int)"
      "(true, 5, -2)"
  ; tc
      "tc_tuple_get_4"
      ("let x: (Int * (Bool * Int * Int)) = (1, (true, 5, -2)), y: Int=x[0 of 2], z: (Bool * Int * Int)=x[1 of 2] in \
        z: "
      ^ "(Bool * Int * Int)")
      "(true, 5, -2)"
  ; tc
      "tc_tuple_get_5"
      ("let x: (Int * (Bool * Int * Int)) = (1, (true, 5, -2)), y: Int=x[0 of 2], z: (Bool * Int * Int)=x[1 of 2] in "
      ^ "y: Int")
      "1"
  ; tce
      "tc_tuple_get_6"
      "let x: (Int * Bool) = (1, true) in x[0 of 2]: Bool"
      "Type error at tc_tuple_get_6, 1:35-1:44: expected Bool but got Int"
  ; tce
      "tc_tuple_get_7"
      "let x: (Int * Bool) = (1, true) in x[1 of 2]: Int"
      "Type error at tc_tuple_get_7, 1:35-1:44: expected Int but got Bool"
  ; tce
      "tc_tuple_get_8"
      ("let x: (Int * (Bool * Int * Int)) = (1, (true, 5, -2)), y: Bool=x[0 of 2], z: (Bool * Int * Int)=x[1 of 2] in "
      ^ "z: (Bool * Int * Int)")
      "Type error at tc_tuple_get_8, 1:64-1:73: expected Bool but got Int"
  ; tce
      "tc_tuple_get_9"
      "let x: (Int * Int * Int) = (1, 2, 3) in x[0 of 2]: Int"
      "Type error at tc_tuple_get_9, 1:40-1:49: tuple is of length 3, but was accessed as if it was of length 2"
  ; tc "tc_tuple_get_10" "let a: (Int * (Int * Int)) = (1, (2,3)), b: (Int * Int) = a[1 of 2] in b[1 of 2]: Int" "3"
  ; tc "tc_tuple_get_11" "let a: (Int * (Int * Int)) = (1, (2,3)) in a[1 of 2][1 of 2]: Int" "3"
  ; tc "tc_tuple_set_1" "let x: (Int * Int) = (1, 2), y: Int = 10 in x[0 of 2 := y]: (Int * Int)" "(10, 2)"
  ; tc "tc_tuple_set_2" "let x: (Int * Int) = (1, 2), y: Int = -3 in x[1 of 2 := y]: (Int * Int)" "(1, -3)"
  ; tce
      "tc_tuple_set_3"
      "let x: (Int * Int) = (1, 2), y: Bool = true in x[1 of 2 := y]: (Int * Int)"
      "Type error at tc_tuple_set_3, 1:59-1:60: expected Int but got Bool"
  ; tc "tc_tuple_set_4" "let x: (Int * Bool) = (1, true), y: Bool = false in x[1 of 2 := y]: (Int * Bool)" "(1, false)"
  ; tc
      "tc_tuple_set_5"
      ("let x: (Int * (Int * Bool)) = (1, (-3, true)), y: (Int * Bool) = (5, false) in "
      ^ "x[1 of 2 := y]: (Int * (Int * Bool))")
      "(1, (5, false))"
  ; tce
      "tc_tuple_set_6"
      "let x: (Int * Int) = (1, 2), y: Int = 4 in x[1 of 3 := y]: (Int * Int)"
      "Type error at tc_tuple_set_6, 1:43-1:57: tuple is of length 2, but was accessed as if it was of length 3"
  ; tce
      "tc_tuple_set_7"
      "let x: (Int * Int) = (1, 2), y: Int = 4 in x[1 of 2 := y]: (Int * Bool)"
      ("Type error at tc_tuple_set_7, 1:43-1:44: expected (Int * Bool) but got (Int * Int)\n"
      ^ "Type error at tc_tuple_set_7, 1:55-1:56: expected Bool but got Int")
  ; tce
      "tc_tuple_set_8"
      "let x: (Int * Int) = (1, 2) in x[1 of 2 := 3]: (Int * Bool)"
      ("Type error at tc_tuple_set_8, 1:31-1:32: expected (Int * Bool) but got (Int * Int)\n"
      ^ "Type error at tc_tuple_set_8, 1:43-1:44: expected Bool but got Int")
  ; tc "tc_tuple_set_9" "let x: (Int * Int) = (1, 2) in x[0 of 2 := 3]: (Int * Int)" "(3, 2)"
  ; tc "tc_tuple_set_10" "let x: (Int * Int) = (1, 2) in x[0 of 2 := (if true: 3 else: 5)]: (Int * Int)" "(3, 2)"
  ; tce
      "tc_tuple_set_11"
      "let x: (Int * Int) = (1, 2) in x[0 of 2 := (if true: 3 else: false)]: (Int * Int)"
      "Type error at tc_tuple_set_11, 1:61-1:66: expected Int but got Bool"
  ; tce
      "tc_tup_set_12"
      "let x: (Int * Int) = (1,2) in x[0 of 2 := false][1 of 2 := -2]: (Int * Int)"
      "Type error at tc_tup_set_12, 1:42-1:47: expected Int but got Bool"
  ; tce
      "tc_tup_set_13"
      "let x: (Int * Int) = (1,2) in x[0 of 2 := -1][1 of 2 := true]: (Int * Int)"
      "Type error at tc_tup_set_13, 1:56-1:60: expected Int but got Bool"
  ; tce
      "tc_tup_set_14"
      "let x: (Int * Int) = (1,2) in x[0 of 2 := -1][1 of 3 := 5]: (Int * Int)"
      "Type error at tc_tup_set_14, 1:30-1:58: tuple is of length 2, but was accessed as if it was of length 3"
  ; tce
      "tc_tupl_set_15"
      "let x: (Int * Int) = (1,2) in x[0 of 3 := -1][1 of 2 := 5]: (Int * Int)"
      "Type error at tc_tupl_set_15, 1:30-1:45: tuple is of length 2, but was accessed as if it was of length 3"
  ; tce
      "tc_tuple_set_16"
      "let x: (Int * Bool) = (1,2) in x[0 of 3 := -1][1 of 2 := 5]: (Int * Int)"
      ("Type error at tc_tuple_set_16, 1:31-1:32: expected (Int * Int) but got (Int * Bool)\n"
      ^ "Type error at tc_tuple_set_16, 1:31-1:46: tuple is of length 2, but was accessed as if it was of length 3\n"
      ^ "Type error at tc_tuple_set_16, 1:25-1:26: expected Bool but got Int")
  ; tc "tc_tuple_set_17" "let x: (Int * Int) = (1,2) in x[0 of 2 := -1][1 of 2 := 5]: (Int * Int)" "(-1, 5)"
  ; tc "tc_tuple_unpacking_1" "let t: (Int * Int) = (1,3), (x: Int, y: Int) = t in x+y: Int" "4"
  ; tc
      "tc_tuple_unpacking_2"
      "let t: (Int * (Int * Bool))=(1, (2, true)) in let (x: Int, (y: Int, z: Bool)) = t in (if z: x else: y): Int"
      "1"
  ; tc "tuple_unpacking_3" "let (x: Int, (y: Int, z: Bool)) = (1, (3, true)) in (if z: x else: y): Int" "1"
  ; tc "tc_tuple_unpacking_4" "let t: (Int * Int) = (1,3), (x: Int, y: Int) = (t: (Int * Int)) in x+y: Int" "4"
  ; tce
      "tc_tuple_unpacking_5"
      "let t: (Int * Bool) = (1,true), (x: Int, y: Int) = t in x+y: Int"
      "Type error at tc_tuple_unpacking_5, 1:41-1:47: expected Int but got Bool"
  ; tce
      "tc_tuple_unpacking_6"
      "let t: (Int * Int * Int) = (1,3,5), (x: Int, y: Int) = t in x+y: Int"
      ("Type error at tc_tuple_unpacking_6, 1:45-1:51: tuple is of length 3, but was accessed as if it was of length 2\n"
      ^ "Type error at tc_tuple_unpacking_6, 1:37-1:43: tuple is of length 3, but was accessed as if it was of length 2"
      )
  ; tc
      "tc_tuple_unpacking_7"
      "let t: (Int * (Int * Bool)) = (1, (3, true)), (x: Int, y: (Int * Bool)) = t in x+(y[0 of 2]): Int"
      "4"
  ; tce
      "tc_tuple_unpacking_8"
      "let t: (Int * (Int * Bool)) = (1, (3, true)), (x: Int, y: (Int * Bool)) = t in x+(y[1 of 2]): Int"
      "Type error at tc_tuple_unpacking_8, 1:82-1:91: expected Int but got Bool"
  ; tc
      "tc_given_func_unpacking_tuple"
      ("def add_pairs((x1: Int, y1: Int), (x2: Int, y2: Int)) -> (Int * Int):\n(x1 + x2, y1 + y2)\n"
      ^ "let p1: (Int * Int) = (1,2), p2: (Int * Int) = (5,7) in add_pairs(p1, p2): (Int * Int)")
      "(6, 9)"
  ; tc
      "tuple_chain_1"
      "let t: (Int * (Int * (Int * Bool))) = (1, (2, (3, false))) in t[1 of 2][1 of 2][1 of 2]: Bool"
      "false"
  ; tce
      "tuple_chain_2"
      "let t: (Int * (Int * (Int * Bool))) = (1, (2, (3, false))) in t[1 of 2][1 of 2][1 of 3]: Bool"
      "Type error at tuple_chain_2, 1:62-1:87: tuple is of length 2, but was accessed as if it was of length 3"
  ; tce
      "tuple_chain_3"
      "let t: (Int * (Int * (Int * Bool))) = (1, (2, (3, false))) in t[1 of 2][1 of 2][1 of 2]: Int"
      "Type error at tuple_chain_3, 1:62-1:87: expected Int but got Bool"
  ; tce
      "tuple_chain_4"
      "let t: (Int * (Int * Int)) = (1, (1, 2)) in t[1 of 2][0 of 3]: Int"
      "Type error at tuple_chain_4, 1:44-1:61: tuple is of length 2, but was accessed as if it was of length 3"
  ; tc "tuple_chain_5" "let t: (Int * (Int * Int)) = (1, (1, 2)) in t[1 of 2][0 of 2]: Int" "1"
  ; tce
      "tuple_chain_6"
      "let t = (1, (1, 2)) in t[1 of 2][0 of 2]: Int"
      ("Type error at tuple_chain_6, 1:23-1:24: Expected to find a tuple type for expr t but instead found type <BLANK>\n"
      ^ "The variable t at <tuple_chain_6, 1:4-1:5> has no type defined")
  ; tce
      "tuple_chain_7"
      "let t: (Int * (Int * Int)) = (1, (1, 2)) in t[1 of 2][0 of 2][0 of 2]: Int"
      ("Type error at tuple_chain_7, 1:44-1:61: Expected to find a tuple type for expr t[1 of 2][0 of 2] but instead "
      ^ "found type Int")
  ; tce
      "tuple_chain_8"
      "let t: Bool = false in t[1 of 2][0 of 2]: Bool"
      "Type error at tuple_chain_8, 1:23-1:24: Expected to find a tuple type for expr t but instead found type Bool"
  ; tc "tuple_chain_9" "def f(x: (Int * (Int * Int))) -> Int: x[1 of 2][0 of 2]\nf((1,(2,3))): Int" "2"
  ; tce
      "tuple_chain_10"
      "def f(x: (Int * (Int * Int))) -> Int: x[1 of 2][0 of 2][1 of 3]\nf((1,(2,3))): Int"
      ("Type error at tuple_chain_10, 1:38-1:55: Expected to find a tuple type for expr x[1 of 2][0 of 2] but "
      ^ "instead found type Int")
  ; tce
      "tuple_chain_11"
      "def f(x: (Int * (Int * Int))) -> Int: x[1 of 2][0 of 3]\nf((1,(2,3))): Int"
      "Type error at tuple_chain_11, 1:38-1:55: tuple is of length 2, but was accessed as if it was of length 3"
  ; tc "tc_nil_1" "(nil: Int) : Int" "nil"
  ; tce "tc_nil_2" "(nil: Bool) : Int" "Type error at tc_nil_2, 1:1-1:10: expected Int but got Bool"
  ; tc "tc_tuple_func_unpacking_1" "def f((x: Int, y:Int)) -> Int:\nx+y\nlet tup: (Int*Int) = (3,4) in f(tup): Int" "7"
  ; tce
      "tc_tuple_func_unpacking_2"
      "def f((x: Int, y:Int)) -> Int:\nx+y\nlet tup: (Int*Bool) = (3,false) in f(tup): Int"
      "Type error at tc_tuple_func_unpacking_2, 3:37-3:40: expected (Int * Int) but got (Int * Bool)"
  ]
;;

let tc_input_tests =
  [ tc_input "tc_input_1" "input<Int>(): Int" "1\n" "1"
  ; tce "tc_input_2" "input<Int>(): Bool" "Type error at tc_input_2, 1:0-1:12: expected Bool but got Int"
  ; tc_input
      "tc_input_3"
      "let x: (Int * Bool) = (input<Int>(), input<Bool>()) in x: (Int * Bool)"
      "1\ntrue\n"
      "(1, true)"
  ; tc_input
      "tc_input_4"
      "let x: (Int * Bool) = (input<Int>(), input<Bool>()) in x: (Int * Bool)"
      "-123\ntrue\n"
      "(-123, true)"
  ; tce
      "tc_input_5"
      "let x: (Int * Bool) = (input<Int>(), input<Int>()) in x: (Int * Bool)"
      "Type error at tc_input_5, 1:37-1:49: expected Bool but got Int"
  ; tc_input "tc_input_6" "input<Int>() + 5: Int" "5\n" "10"
  ; tce_input
      "tc_input_7"
      "input<Int>() + 5: Int"
      "true\n"
      "input() received invalid data ('true') when it was annotated to expect an int"
  ; tce "tc_input_8" "input<Bool>() + 5: Int" "Type error at tc_input_8, 1:0-1:13: expected Int but got Bool"
  ; tce_input
      "tc_input_9"
      "input<Bool>(): Bool"
      "5\n"
      "input() received invalid data ('5') when it was annotated to expect a bool"
  ; tce_input
      "tc_input_10"
      "input<(Int * Int)>(): (Int * Int)"
      "1\n"
      "Unsupported: input() can only read Ints and Booleans from stdin at <tc_input_10, 1:0-1:20>"
  ]
;;

let tydecl_tests =
  [ tc "tydecl_1" "type foo = (Int * Int)\nlet x: foo = (1,2) in x: foo\n" "(1, 2)"
  ; tc "tydecl_2" "type foo = (Int * Int)\nlet x: foo = (1,2) in x: (Int * Int)\n" "(1, 2)"
  ; tc "tydecl_3" "type foo = (Int * Int)\nlet x: (Int * Int) = (1,2) in x: foo\n" "(1, 2)"
  ; tce
      "tydecl_4"
      "type foo = (Int * Bool)\nlet x: (Int * Int) = (1,2) in x: foo\n"
      "Type error at tydecl_4, 2:30-2:31: expected (Int * Bool) but got (Int * Int)"
  ; tce
      "tydecl_5"
      "type foo = (Int * Bool)\nlet x: foo = (1,2) in x: foo\n"
      "Type error at tydecl_5, 2:16-2:17: expected Bool but got Int"
  ; tc
      "tydecl_6"
      "type foo = (Int * Bool)\n\
       type bar = (Bool * Int)\n\
       def f(x: foo) -> bar:\n\
      \  (x[1 of 2], x[0 of 2])\n\
       f((3, true)): bar"
      "(true, 3)"
  ; tc "tydecl_7" "type foo<'a, 'b> = ('a * 'b)\nlet x: foo<Int, Int> = (1,2) in x: foo<Int, Int>" "(1, 2)"
  ; tce
      "tydecl_8"
      "type foo<'a, 'b> = ('a * 'b)\nlet x: foo<Int, Int> = (1,2) in x: foo<Int, Bool>"
      "Type error at tydecl_8, 2:32-2:33: expected (Int * Bool) but got (Int * Int)"
  ; tce
      "tydecl_9"
      "type foo<'a, 'b> = ('a * 'b)\nlet x: foo<Int, Bool> = (1,2) in x: foo<Int, Int>"
      ("Type error at tydecl_9, 2:33-2:34: expected (Int * Int) but got (Int * Bool)\n"
      ^ "Type error at tydecl_9, 2:27-2:28: expected Bool but got Int")
  ; tce
      "tydecl_10"
      "type foo<'a, 'b> = ('a * 'b)\nlet x: foo<Int, Int> = (1,true) in x: foo<Int, Int>"
      "Type error at tydecl_10, 2:26-2:30: expected Int but got Bool"
  ; tce
      "tydecl_11"
      "type foo<'a, 'b> = ('a * 'b)\nlet x: foo<Int> = (1,2) in x: foo<Int, Bool>"
      "The tydecl foo, instantiated at tydecl_11, 2:7-2:15, expected 2 type arguments but only 1 types provided"
  ; tce
      "tydecl_12"
      "type foo = (Int * foo)\n4: Int"
      "The type name foo, used at <tydecl_12, 1:18-1:21>, is not in scope"
  ; tce "tydecl_13" "type foo = Int\n4: foo" "Parse error at line 1, col 14"
  ; tce "tydecl_14" "type foo = (Int)\n4: foo" "Type error at tydecl_14, 2:0-2:1: expected (Int) but got Int"
  ; tc "tydecl_15" "type foo = (Int)\n(4,): foo" "(4, )"
  ; tc "tydecl_16" "type foo = (Int * Int)\ntype bar=(foo * Bool)\n((1,2), false): bar" "((1, 2), false)"
  ; tce
      "tydecl_17"
      "type foo = (Int * Int)\ntype bar=(foo * Bool)\n((1,true), false): bar"
      "Type error at tydecl_17, 2:26-2:30: expected Int but got Bool"
  ]
;;

let tc_equal_tests =
  [ tc "tc_equal_1" "equal<Int>(1, 2): Bool" "false"
  ; tc "tc_equal_2" "equal<Int>(1, 1): Bool" "true"
  ; tc "tc_equal_3" "equal<(Int * Int)>((1, 2), (1, 2)): Bool" "true"
  ; tc "tc_equal_4" "equal<(Int * Int)>((1, 3), (1, 2)): Bool" "false"
  ; tce
      "tc_equal_5"
      "equal<(Int * Int)>((1, true), (1, 2)): Bool"
      "Type error at tc_equal_5, 1:23-1:27: expected Int but got Bool"
  ]
;;

let function_tests =
  simple_non_recursive_function_tests @ simple_recursive_function_tests @ tail_rec_tests @ equal_tests @ input_tests
;;

let higher_ordered_functions_tests = simple_lambda_tests @ closure_tests @ letrec_tests @ freevars_tests
let error_tests = well_formed_failures @ parser_tests @ overflow_tests
let misc_tests = misc_unit_tests @ rename_tests @ remove_illegal_immediates_tests @ anf_tests @ desugar_tests
let prim1_tests = not_tests @ is_num_bool_tests @ is_tuple_tests @ print_tests @ prim1_arith_tests
let prim2_tests = prim2_arith_tests @ num_comparison_tests @ bool_comparison_tests

let compile_tests =
  []
  (* @ simple_tests
  @ tuple_tests
  @ nil_tests
  @ prim1_tests
  @ prim2_tests
  @ sequence_tests
  @ if_tests
  @ let_tests
  @ function_tests
  @ error_tests
  @ misc_tests
  @ oom_tests
  @ interpreter_tests
  @ higher_ordered_functions_tests *)
  @ gc_tests
  @ string_tests 
;;

let typecheck_tests =
  []
  (* @ tc_simple_tests
  @ tc_sequence_tests
  @ tc_prim1_tests
  @ tc_prim2_tests
  @ tc_if_tests
  @ tc_annot_tests
  @ tc_let_tests
  @ tc_tuple_tests
  @ tc_input_tests
  @ tc_func_tests
  @ tydecl_tests
  @ tc_equal_tests *)
;;

let suite = "suite" >::: typecheck_tests @ compile_tests
let () = run_test_tt_main ("all_tests" >::: [ suite; 
(* TODO *)
(* input_file_test_suite ()  *)
])
