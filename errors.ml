open Printf
open Exprs
open Pretty

exception ParseError of string (* parse-error message *)
exception UnboundId of string * sourcespan (* name, where used *)
exception UnboundTyId of string * sourcespan (* name, where used *)
exception UnboundFun of string * sourcespan (* name of fun, where used *)
exception ShadowId of string * sourcespan * sourcespan (* name, where used, where defined *)
exception DuplicateId of string * sourcespan * sourcespan (* name, where used, where defined *)
exception DuplicateFun of string * sourcespan * sourcespan (* name, where used, where defined *)
exception Overflow of int64 * sourcespan (* value, where used *)
exception NotYetImplemented of string (* Message to show *)
exception Unsupported of string * sourcespan
exception InternalCompilerError of string (* Major failure: message to show *)
exception OccursCheck of string * sourcespan typ * sourcespan
exception IndexOutOfBounds of int * int * sourcespan
exception LetRecNonFunction of sourcespan bind * sourcespan (* name binding, where defined *)
exception Arity of int * int * sourcespan (* intended arity, actual arity, where called *)
exception UndefinedException of string * sourcespan (* The undefined exception, where used *)

type reason =
  | InferExp of sourcespan expr
  | Message of string
  | Unify of string * sourcespan typ * sourcespan typ
  | Instantiate of string * sourcespan scheme
                                     
exception NoType of string * sourcespan (* function name, where defined *)
exception VarNoType of string * sourcespan (* var name, where defined *)
exception BodyNoType of sourcespan (* where defined *)
exception ExprNoType of sourcespan expr * sourcespan (* where defined *)
exception ShouldBeFunction of string * sourcespan * sourcespan scheme (* name, where defined, actual typ *)
exception TypeMismatch of sourcespan * sourcespan typ * sourcespan typ * reason list (* where, expected, actual *)
exception DeclArity of string * int * int * sourcespan (* name, num args, num types, where defined *)
exception BadTypeApp of string * sourcespan * int * int (* fn name, where called, expected #tyargs, actual *)
exception BadTypeAppTyDecl of string * sourcespan * int * int (* fn name, where called, expected #tyargs, actual *)
exception UndefinedTypeVar of string * sourcespan (* type, where defined *)
exception IncorrectTupleLength of int * int * sourcespan (* expected length, correct length, where defined *)
exception ExpectedTupleTyp of sourcespan typ * sourcespan expr * sourcespan (* The type that was found that was expected to be a tuple type and the expr that had that type*)


(* Stringifies a list of compilation errors *)
let print_errors (exns : exn list) : string list =
  List.map (fun e ->
      match e with
      | Arity(expected, actual, loc) ->
         sprintf "The function called at <%s> expected an arity of %d, but received %d arguments"
                 (string_of_sourcespan loc) expected actual
      | ParseError msg -> msg
      | NotYetImplemented msg ->
         "Not yet implemented: " ^ msg
         | Unsupported(msg, loc) ->
         sprintf "Unsupported: %s at <%s>" msg (string_of_sourcespan loc)
      | InternalCompilerError msg ->
         "Internal Compiler Error: " ^ msg
      | OccursCheck(tyvar, t, loc) ->
       sprintf "Infinite types: '%s occurs in %s at <%s>" tyvar (string_of_typ t) (string_of_sourcespan loc)
      | UnboundId(x, loc) ->
         sprintf "The identifier %s, used at <%s>, is not in scope" x (string_of_sourcespan loc)
      | UnboundTyId(x, loc) ->
         sprintf "The type name %s, used at <%s>, is not in scope" x (string_of_sourcespan loc)
      | UnboundFun(x, loc) ->
         sprintf "The function name %s, used at <%s>, is not in scope" x (string_of_sourcespan loc)
      | ShadowId(x, loc, existing) ->
         sprintf "The identifier %s, defined at <%s>, shadows one defined at <%s>"
                 x (string_of_sourcespan loc) (string_of_sourcespan existing)
      | DuplicateId(x, loc, existing) ->
         sprintf "The identifier %s, redefined at <%s>, duplicates one at <%s>"
                 x (string_of_sourcespan loc) (string_of_sourcespan existing)
      | DuplicateFun(x, loc, existing) ->
         sprintf "The function name %s, redefined at <%s>, duplicates one at <%s>"
                 x (string_of_sourcespan loc) (string_of_sourcespan existing)
      | Overflow(num, loc) ->
         sprintf "The number literal %Ld, used at <%s>, is not supported in this language"
                 num (string_of_sourcespan loc)
      | VarNoType(name, loc) ->
         sprintf "The variable %s at <%s> has no type defined" name (string_of_sourcespan loc)
      | NoType(name, loc) ->
         sprintf "The function %s at <%s> has no type defined" name (string_of_sourcespan loc)
      | BodyNoType(loc) ->
         sprintf "The program body at <%s> has no type defined" (string_of_sourcespan loc)
      | ExprNoType(e, loc) -> 
         sprintf "The expr '%s' at <%s> has no type defined" (string_of_expr e) (string_of_sourcespan loc)
      | BadTypeApp(name, loc, expected, actual) ->
         sprintf "The function %s, called at %s, expected %d type arguments but only %d types provided"
                 name (string_of_sourcespan loc) expected actual
      | BadTypeAppTyDecl(name, loc, expected, actual) ->
         sprintf "The tydecl %s, instantiated at %s, expected %d type arguments but only %d types provided"
                 name (string_of_sourcespan loc) expected actual
      | DeclArity(name, num_args, num_types, loc) ->
         sprintf "The function %s, defined at %s, has %d arguments but only %d types provided"
                 name (string_of_sourcespan loc) num_args num_types
      | UndefinedTypeVar(name, loc) -> 
         sprintf "The type var '%s used at %s is not a defined type var" name (string_of_sourcespan loc)
      | ShouldBeFunction(name, loc, wanted) ->
         sprintf "The function %s, at %s, should have function type %s" name (string_of_sourcespan loc) (string_of_scheme wanted)
      | LetRecNonFunction(bind, loc) ->
         sprintf "Binding error at %s: Let-rec expected a name binding to a lambda; got %s"
           (string_of_sourcespan loc) (string_of_bind bind)
      | TypeMismatch(loc, expected, actual, []) ->
          sprintf "Type error at %s: expected %s but got %s"
            (string_of_sourcespan loc) (string_of_typ expected) (string_of_typ actual)
      | IncorrectTupleLength(expected, actual, loc) -> 
         sprintf "Type error at %s: tuple is of length %d, but was accessed as if it was of length %d" (string_of_sourcespan loc) actual expected 
      | ExpectedTupleTyp(t, e, l) -> sprintf "Type error at %s: Expected to find a tuple type for expr %s but instead found type %s" (string_of_sourcespan l) (string_of_expr e) (string_of_typ t)
      | TypeMismatch(loc, expected, actual, reasons) ->
         let print_reason r =
           match r with
           | InferExp e -> sprintf "\ttrying to infer type for %s at %s"
                             (string_of_expr e) (string_of_sourcespan (get_tag_E e))
           | Message s -> "\t" ^ s
           | Unify(s, t1, t2) -> sprintf "\ttrying to unify %s and %s (because %s)"
                                   (string_of_typ t1) (string_of_typ t2) s
           | Instantiate(name, scheme) -> sprintf "\ttrying to instantiate %s at %s" name (string_of_scheme scheme) in
          sprintf "Type error at %s: expected %s but got %s, because\n%s"
            (string_of_sourcespan loc) (string_of_typ expected) (string_of_typ actual)
            (ExtString.String.join "\n" (List.map print_reason reasons))
      | IndexOutOfBounds (idx, len, loc) -> sprintf "Tuple indexing at %s is out of bounds (idx=%d, len=%d)" (string_of_sourcespan loc) idx len 
      | UndefinedException (n, loc) -> sprintf "Undefined exception %s used at %s" n (string_of_sourcespan loc)
      | _ ->
         sprintf "%s" (Printexc.to_string e)
    ) exns
;;

