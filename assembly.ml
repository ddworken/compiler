open Printf
open Int64
open Errors

(* Abstract syntax of (a small subset of) x86 assembly instructions *)
let word_size = 8

type reg =
  | RAX
  | RSP
  | RBP
  | RSI
  | RDI
  | RDX
  | RCX
  | R8
  | R9
  | R10
  | R11
  | R12
  | R13
  | R14
  | R15
  | CL

(* A reserved register used for holding 64 bit immediates for operations that can't handle 64 bit immediates *)
let reserved_immediate_register = R10

(* Two reserved registers used when computing binops *)
let reserved_temp_register_1 = R11
let reserved_temp_register_2 = R12

(* A register that always holds the next available location on the heap *)
let reserved_heap_reg = R15

type size =
  | QWORD_PTR
  | DWORD_PTR
  | WORD_PTR
  | BYTE_PTR

type arg =
  | Const of int64
  | HexConst of int64
  | Reg of reg
  | RegOffset of int * reg (* int is # words of offset *)
  | RegByteOffset of int * reg (* int is the # bytes of offset *)
  | RegOffsetReg of reg * reg * int * int
  | Sized of size * arg
  | LabelContents of string
  | Label of string

type instruction =
  | IMov of arg * arg
  | IAdd of arg * arg
  | ISub of arg * arg
  | IMul of arg * arg
  | ILabel of string
  | ICmp of arg * arg
  | IJo of arg
  | IJe of arg
  | IJne of arg
  | IJno of arg
  | IJl of arg
  | IJle of arg
  | IJg of arg
  | IJge of arg
  | IJmp of arg
  | IJz of arg
  | IJnz of arg
  | IRet
  | IAnd of arg * arg
  | IOr of arg * arg
  | IXor of arg * arg
  | IShl of arg * arg
  | IShr of arg * arg
  | ISar of arg * arg
  | IPush of arg
  | IPop of arg
  | ICall of arg
  | ITest of arg * arg
  | ILineComment of string
  | IInstrComment of instruction * string
  | IEnter of int * int
  | ILeave
  | CMovne of arg * arg
  | CMove of arg * arg
  | CMovle of arg * arg
  | CMovl of arg * arg
  | StringConstant of string * string 
  | ArrayConstant of string * string list 

let r_to_asm (r : reg) : string =
  match r with
  | RAX -> "RAX"
  | RSI -> "RSI"
  | RDI -> "RDI"
  | RCX -> "RCX"
  | RDX -> "RDX"
  | RSP -> "RSP"
  | RBP -> "RBP"
  | R8 -> "R8"
  | R9 -> "R9"
  | R10 -> "R10"
  | R11 -> "R11"
  | R12 -> "R12"
  | R13 -> "R13"
  | R14 -> "R14"
  | R15 -> "R15"
  | CL -> "CL"
;;

let rec arg_to_asm (a : arg) : string =
  match a with
  | Const n -> sprintf "%Ld" n
  | HexConst n -> sprintf "0x%Lx" n
  | Reg r -> r_to_asm r
  | RegOffset (n, r) ->
    if n >= 0
    then sprintf "[%s+%d]" (r_to_asm r) (n * word_size)
    else sprintf "[%s-%d]" (r_to_asm r) (-1 * word_size * n)
  | RegByteOffset (n, r) ->
    if n >= 0
    then sprintf "[%s+%d]" (r_to_asm r) (n)
    else sprintf "[%s-%d]" (r_to_asm r) (-1 * n)
  | RegOffsetReg (r1, r2, mul, off) -> sprintf "[%s + %s * %d + %d]" (r_to_asm r1) (r_to_asm r2) mul off
  | Sized (size, a) ->
    sprintf
      "%s %s"
      (match size with
      | QWORD_PTR -> "QWORD"
      | DWORD_PTR -> "DWORD"
      | WORD_PTR -> "WORD"
      | BYTE_PTR -> "BYTE")
      (arg_to_asm a)
  | LabelContents s -> sprintf "[%s]" s
  | Label s -> s
;;

let rec i_to_asm (i : instruction) : string =
  match i with
  | IMov (dest, value) -> sprintf "  mov %s, %s" (arg_to_asm dest) (arg_to_asm value)
  | IAdd (dest, to_add) -> sprintf "  add %s, %s" (arg_to_asm dest) (arg_to_asm to_add)
  | ISub (dest, to_sub) -> sprintf "  sub %s, %s" (arg_to_asm dest) (arg_to_asm to_sub)
  | IMul (dest, to_mul) -> sprintf "  imul %s, %s" (arg_to_asm dest) (arg_to_asm to_mul)
  | ICmp (left, right) -> sprintf "  cmp %s, %s" (arg_to_asm left) (arg_to_asm right)
  | ILabel name -> name ^ ":"
  | IJo label -> sprintf "  jo %s" (arg_to_asm label)
  | IJe label -> sprintf "  je %s" (arg_to_asm label)
  | IJne label -> sprintf "  jne %s" (arg_to_asm label)
  | IJno label -> sprintf "  jno %s" (arg_to_asm label)
  | IJl label -> sprintf "  jl %s" (arg_to_asm label)
  | IJle label -> sprintf "  jle %s" (arg_to_asm label)
  | IJg label -> sprintf "  jg %s" (arg_to_asm label)
  | IJge label -> sprintf "  jge %s" (arg_to_asm label)
  | IJmp label -> sprintf "  jmp %s" (arg_to_asm label)
  | IJz label -> sprintf "  jz %s" (arg_to_asm label)
  | IJnz label -> sprintf "  jnz %s" (arg_to_asm label)
  | IAnd (dest, value) -> sprintf "  and %s, %s" (arg_to_asm dest) (arg_to_asm value)
  | IOr (dest, value) -> sprintf "  or %s, %s" (arg_to_asm dest) (arg_to_asm value)
  | IXor (dest, value) -> sprintf "  xor %s, %s" (arg_to_asm dest) (arg_to_asm value)
  | IShl (dest, value) -> sprintf "  shl %s, %s" (arg_to_asm dest) (arg_to_asm value)
  | IShr (dest, value) -> sprintf "  shr %s, %s" (arg_to_asm dest) (arg_to_asm value)
  | ISar (dest, value) -> sprintf "  sar %s, %s" (arg_to_asm dest) (arg_to_asm value)
  | IPush value -> sprintf "  push %s" (arg_to_asm value)
  | IPop dest -> sprintf "  pop %s" (arg_to_asm dest)
  | ICall label -> sprintf "  call %s" (arg_to_asm label)
  | IRet -> "  ret"
  | ITest (arg, comp) -> sprintf "  test %s, %s" (arg_to_asm arg) (arg_to_asm comp)
  | ILineComment str -> sprintf "  ;; %s" str
  | IInstrComment (instr, str) -> sprintf "%s ; %s" (i_to_asm instr) str
  | IEnter (slots, depth) -> sprintf "  enter %d, %d" slots depth
  | ILeave -> "  leave"
  | CMovne (a, b) -> sprintf "  cmovne %s, %s" (arg_to_asm a) (arg_to_asm b)
  | CMove (a, b) -> sprintf "  cmove %s, %s" (arg_to_asm a) (arg_to_asm b)
  | CMovle (a, b) -> sprintf "  cmovle %s, %s" (arg_to_asm a) (arg_to_asm b)
  | CMovl (a, b) -> sprintf "  cmovl %s, %s" (arg_to_asm a) (arg_to_asm b)
  | StringConstant(a,b) -> sprintf "%s: db \"%s\", 0" a b 
  | ArrayConstant(n, l) -> sprintf "%s: dq %s" n (String.concat ", " l)
;;

let to_asm (is : instruction list) : string = List.fold_left (fun s i -> sprintf "%s\n%s" s (i_to_asm i)) "" is

(* Remove illegal immediates from the given list of instructions. 
   64 bit assembly does not allow add, sub, mul, cmp, and, or, xor, and test instructions to have
   64 bit immediates as their second argument. In our compiler, we compile exprs to instructions
   assuming that this restriction does not exist (thereby using instructions as a sort of IR). This
   function then processes the instructions in order to ensure that 64 bit immediates are never 
   given to assembly instructions as a second argument. Note that this uses reserved_immediate_register
   as scratch space and thus it will clobber reserved_immediate_register if it is ever used. 
 *)
let rec remove_illegal_immediates (instructions : instruction list) : instruction list =
  let inner op a b rest =
    (* Use op_constructor since we can't pass type constructors as values *)
    let op_constructor =
      match op with
      | IAdd (_, _) -> fun (a, b) -> IAdd (a, b)
      | ISub (_, _) -> fun (a, b) -> ISub (a, b)
      | IMul (_, _) -> fun (a, b) -> IMul (a, b)
      | ICmp (_, _) -> fun (a, b) -> ICmp (a, b)
      | IAnd (_, _) -> fun (a, b) -> IAnd (a, b)
      | IOr (_, _) -> fun (a, b) -> IOr (a, b)
      | IXor (_, _) -> fun (a, b) -> IXor (a, b)
      | ITest (_, _) -> fun (a, b) -> ITest (a, b)
      | CMovne (_, _) -> fun (a, b) -> CMovne (a, b)
      | CMovle (_, _) -> fun (a, b) -> CMovle (a, b)
      | CMove (_, _) -> fun (a, b) -> CMove (a, b)
      | CMovl (_, _) -> fun (a, b) -> CMovl (a, b)
      | _ -> raise (InternalCompilerError (sprintf "Matched illegal instruction in remove_illegal_immediates"))
    in
    [ IMov (Reg reserved_immediate_register, b); op_constructor (a, Reg reserved_immediate_register) ]
    @ remove_illegal_immediates rest
  in
  match instructions with
  | (( IAdd (a, ((Const n | HexConst n | Sized (QWORD_PTR, (Const n | HexConst n))) as b))
     | ISub (a, ((Const n | HexConst n | Sized (QWORD_PTR, (Const n | HexConst n))) as b))
     | IMul (a, ((Const n | HexConst n | Sized (QWORD_PTR, (Const n | HexConst n))) as b))
     | ICmp (a, ((Const n | HexConst n | Sized (QWORD_PTR, (Const n | HexConst n))) as b))
     | IAnd (a, ((Const n | HexConst n | Sized (QWORD_PTR, (Const n | HexConst n))) as b))
     | IOr (a, ((Const n | HexConst n | Sized (QWORD_PTR, (Const n | HexConst n))) as b))
     | IXor (a, ((Const n | HexConst n | Sized (QWORD_PTR, (Const n | HexConst n))) as b))
     | ITest (a, ((Const n | HexConst n | Sized (QWORD_PTR, (Const n | HexConst n))) as b)) ) as op)
    :: rest
    when n > Int64.of_int32 Int32.max_int || n < Int64.of_int32 Int32.min_int -> inner op a b rest
  | (CMovne (Reg _, Reg _) | CMove (Reg _, Reg _) | CMovl (Reg _, Reg _) | CMovle (Reg _, Reg _)) as op :: rest ->
    op :: remove_illegal_immediates rest
  | ((CMovne (a, b) | CMove (a, b) | CMovl (a, b) | CMovle (a, b)) as op) :: rest -> inner op a b rest
  | IInstrComment (i, s) :: rest ->
    (match remove_illegal_immediates [ i ] with
    | [ i ] -> IInstrComment (i, s) :: remove_illegal_immediates rest
    | [ a; b ] -> a :: IInstrComment (b, s) :: remove_illegal_immediates rest
    | err ->
      raise
        (InternalCompilerError
           (sprintf "remove_illegal_immediates encountered %s when expecting an IInstrComment" (to_asm err))))
  | op :: rest -> op :: remove_illegal_immediates rest
  | [] -> []
;;
