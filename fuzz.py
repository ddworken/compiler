"""
A fuzzer for our language. Automatically generates complex random expressions and runs them. We compile the expression
and run it. If it outputs something, we compare it to the output from our interpreter (which is far simpler and thus 
more likely to be correct). If it errors, we assert that the error is an overflow error since no other kind of error 
should happen for the expressions that this fuzzer generates. 

Run via `python3 -u fuzz.py`
"""
import random
import sys
import uuid
from itertools import count
from typing import List, Mapping, Tuple
from enum import Enum
import string
import os
from subprocess import check_output, STDOUT, CalledProcessError
import multiprocessing
from dataclasses import dataclass

class ExprTypes(Enum):
    Let = 1
    If = 2
    Add1 = 3
    Sub1 = 4
    Plus = 5
    Sub = 6
    Mul = 7
    Id = 8
    Num = 9
    Bool = 10
    IntCompare = 11
    BoolCompare = 12
    Print = 13 
    IsBool = 14
    IsNum = 15
    Eq = 16 
    Application = 17 
    Equal = 18 
    Tuple = 19 
    TupleGetItem = 20 

class Type():
    @property
    @staticmethod
    def Bool():
        return Bool()
    @property
    @staticmethod
    def Int():
        return Int()
    @staticmethod
    def STuple(typs: List['Type']):
        return STuple(typs)
class Bool():
    def __eq__(self, value):
        return isinstance(value, Bool)
class Int():
    def __eq__(self, value):
        return isinstance(value, Int)
class STuple():
    def __init__(self, typs: List[Type]):
        super().__init__()
        self.typs = typs 
    def __eq__(self, value):
        return isinstance(value, STuple) and self.typs == value.typs    

def random_var_name() -> str:
    return "".join(random.choice(string.ascii_lowercase) for _ in range(10))

def get_stack_size(size=2):
    frame = sys._getframe(size)

    for size in count(size):
        frame = frame.f_back
        if not frame:
            return size

@dataclass
class FunctionData:
    func_name: str 
    return_type: Type
    arguments: List[Type] 

def tuples_that_contain_typ(known_variables: Mapping[str, Type], typ: Type) -> List[str]:
    return [x for x in known_variables if (isinstance(known_variables[x], STuple) and (typ in known_variables[x].typs))]

def random_expr(required_type: Type, known_variables: Mapping[str, Type], known_functions: List[FunctionData]) -> str:
    assert isinstance(known_functions, list)
    expr_options = []

    if required_type == Type.Int:
        expr_options.append(ExprTypes.Num)
    if required_type == Type.Bool:
        expr_options.append(ExprTypes.Bool)
    if isinstance(required_type, STuple):
        expr_options.append(ExprTypes.Tuple)

    if required_type in known_variables.values():
        for _ in range(3):
            expr_options.append(ExprTypes.Id)

    if get_stack_size() < 18:
        expr_options = [ExprTypes.Let, ExprTypes.If, ExprTypes.Print]
        if required_type in [Type.Int]:
            expr_options.extend([ExprTypes.Add1, ExprTypes.Sub1])
            expr_options.extend([ExprTypes.Plus, ExprTypes.Sub, ExprTypes.Mul])
        if required_type in [Type.Bool]:
            expr_options.extend([
                ExprTypes.IntCompare, 
                ExprTypes.BoolCompare, 
                ExprTypes.Eq,
                ExprTypes.Equal
                ])
            expr_options.extend([ExprTypes.IsBool, ExprTypes.IsNum])
        if required_type in [f.return_type for f in known_functions]:
            expr_options.extend([ExprTypes.Application] * 5)
        if tuples_that_contain_typ(known_variables, required_type):
            expr_options.append(ExprTypes.TupleGetItem)

    expr = random.choice(expr_options)

    if expr == ExprTypes.Let:
        num_vars = random.randint(1,10)
        var_names = [random_var_name() for _ in range(num_vars)]
        new_vars = {}
        var_vals = []
        for i, var_name in enumerate(var_names):
            typ = random_type()
            var_vals.append(random_expr(typ, {**known_variables, **new_vars}, known_functions))
            new_vars[var_name] = typ
        bindings = [f"{var_name}=({var_val})" for var_name, var_val in zip(var_names, var_vals)]
        body = random_expr(required_type, {**known_variables, **new_vars}, known_functions)
        return f"(let {', '.join(bindings)} in {body})"
    elif expr == ExprTypes.Id:
        return random.choice([name for name, typ in known_variables.items() if typ == required_type ])
    elif expr == ExprTypes.Num:
        return str(random.randint(-10, 10))
    elif expr == ExprTypes.If:
        return f"(if {random_expr(Type.Bool, known_variables, known_functions)}: {random_expr(required_type, known_variables, known_functions)} else: {random_expr(required_type, known_variables, known_functions)})"
    elif expr == ExprTypes.Add1:
        return f"add1({random_expr(Type.Int, known_variables, known_functions)})"
    elif expr == ExprTypes.Sub1:
        return f"sub1({random_expr(Type.Int, known_variables, known_functions)})"
    elif expr == ExprTypes.Plus:
        return f"({random_expr(Type.Int, known_variables, known_functions)} + {random_expr(Type.Int, known_variables, known_functions)})"
    elif expr == ExprTypes.Mul:
        return f"({random_expr(Type.Int, known_variables, known_functions)} - {random_expr(Type.Int, known_variables, known_functions)})"
    elif expr == ExprTypes.Sub:
        return f"({random_expr(Type.Int, known_variables, known_functions)} * {random_expr(Type.Int, known_variables, known_functions)})"
    elif expr == ExprTypes.Bool:
        return random.choice(["true", "false"])
    elif expr == ExprTypes.IntCompare:
        left = random_expr(Type.Int, known_variables, known_functions)
        right = random_expr(Type.Int, known_variables, known_functions)
        op = random.choice([">=", ">", "<", "<="])
        return f"({left} {op} {right})"
    elif expr == ExprTypes.Eq:
        left = random_expr(random_type(), known_variables, known_functions)
        right = random_expr(random_type(), known_variables, known_functions)
        return f"({left} == {right})" 
    elif expr == ExprTypes.Equal:
        left = random_expr(random_type(), known_variables, known_functions)
        right = random_expr(random_type(), known_variables, known_functions)
        return f"equal({left}, {right})" 
    elif expr == ExprTypes.BoolCompare:
        left = random_expr(Type.Bool, known_variables, known_functions)
        right = random_expr(Type.Bool, known_variables, known_functions)
        op = random.choice(["&&", "||"])
        return f"({left} {op} {right})"
    elif expr == ExprTypes.Print:
        return f"(print({random_expr(required_type, known_variables, known_functions)}))"
    elif expr == ExprTypes.IsBool:
        return f"(isbool({random_expr(random_type(), known_variables, known_functions)}))"
    elif expr == ExprTypes.IsNum:
        return f"(isnum({random_expr(random_type(), known_variables, known_functions)}))"
    elif expr == ExprTypes.Application:
        func_choices = [f.func_name for f in known_functions if f.return_type == required_type]
        func_choice = random.choice(func_choices)
        func_argument_types = [f.arguments for f in known_functions if f.func_name == func_choice][0]
        return f"{func_choice}({', '.join([random_expr(t, known_variables, known_functions) for t in func_argument_types])})"
    elif expr == ExprTypes.Tuple:
        return f"({', '.join(random_expr(typ, known_variables, known_functions) for typ in required_type.typs)})"
    elif expr == ExprTypes.TupleGetItem:
        tuple_options = tuples_that_contain_typ(known_variables, required_type)
        tup_name = random.choice(tuple_options)
        tup = known_variables[tup_name]
        idx_options = []
        for i, item in enumerate(tup.typs):
            if item == required_type:
                idx_options.append(i)
        idx = random.choice(idx_options)
        return f"({tup_name}[{idx} of {len(tup.typs)}])"
    else:
        raise Exception(expr)

def random_type() -> Type:
    return random.choice([Type.Bool, Type.Int, Type.STuple([
        random.choice([Type.Bool, Type.Int]) for _ in range(3,5)
    ])])

def random_function(return_type: Type, func_datas: List[FunctionData]) -> Tuple[FunctionData, str]:
    # Returns a tuple of func_data, function_definition
    num_args = random.randint(0,5)
    func_name = random_var_name()
    func_args = [(random_var_name(), random_type()) for _ in range(num_args)]
    func_data = FunctionData(func_name, return_type, [t for _, t in func_args])
    return func_data, f"def {func_name}({', '.join([n for n, _ in func_args])}):\n\t{random_expr(return_type, dict(func_args), func_datas)}"

def random_program() -> str:
    num_functions = random.randint(3, 10)
    func_datas = []
    functions = ""
    for i in range(num_functions):
        func_type = random_type()
        func_data, func_definition = random_function(func_type, func_datas)
        func_datas.append(func_data)
        functions += func_definition
        functions += "\n"
    
    return functions + "\n\n" + random_expr(random_type(), {}, func_datas)

def build() -> None:
    check_output("make clean && make main && ocamlbuild -r -use-ocamlfind -cflag -annot -package oUnit,extlib,unix interpreter.native", shell=True)

def run_single_fuzz(i: int) -> str:
    ret = f"Run #{i}: "
    source_file = f'input/do_pass/fuzz-{i}.{lang}'
    with open(source_file, 'w') as f:
        expr = random_program() + "\n"
        f.write(expr)
    try:
        compiled_ret = check_output(f"(make output/do_pass/fuzz-{i}.run) 2>&1 > /dev/null && ./output/do_pass/fuzz-{i}.run", shell=True, stderr=STDOUT)
    except CalledProcessError as exc:
        assert b'Arithmetic Error: overflow' in exc.output, exc.output
        ret += "Passed (overflow error)"
        os.system(f"mv {source_file} input/do_err/fuzz-{i}.{lang}")
        with open(f"input/do_err/fuzz-{i}.out", 'w') as f:
            f.write('Arithmetic Error: overflow')
    else:
        interpreted_ret = check_output(f"./interpreter.native {source_file}", shell=True)
        assert compiled_ret == interpreted_ret, (i, compiled_ret, interpreted_ret)
        ret += f"Passed (same output: {len(compiled_ret.splitlines())} lines)"
        with open(f'input/do_pass/fuzz-{i}.out', 'wb') as f:
            f.write(compiled_ret)
    return ret 


if __name__ == '__main__':
    lang = "egg"
    build()
    p = multiprocessing.Pool(8)
    for output in p.imap_unordered(run_single_fuzz, range(1000)):
        print(output)
