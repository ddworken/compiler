open Compile
open Runner
open Printf
open Lexing
open Exprs
open Errors
open Phases

let show_trace = ref false
let infer_types = ref false
let check_types = ref false
let filename_set = ref false
let filename : string ref = ref ""
       
let () =
  let speclist = [
      ("-t", Arg.Set show_trace, "Display the trace of compilation");
      ("-infer", Arg.Set infer_types, "Perform type-inference on the program");
      ("-check", Arg.Set check_types, "Perform type-checking of the program");
      ("-d", Arg.Set show_debug_print, "Enable debug printing")
    ] in
  Arg.parse speclist (fun name ->
      if !filename_set then
        raise (Arg.Bad "Cannot compile more than one file name")
      else
        (filename_set := true;
         filename := name)
    ) "Compiler options:";
  let sep = "\n=================\n" in
  match compile_file_to_string (!infer_types) (!check_types) (!filename) (!filename) with
  | Error (errs, trace) ->
     (if !show_trace then
        eprintf "%s%s" (ExtString.String.join sep (print_trace trace)) sep
      else ());
     eprintf "Errors:\n";
     eprintf "%s\n" (ExtString.String.join "\n" (print_errors errs))
  | Ok (program, trace) ->
     if !show_trace then
       printf "%s\n" (ExtString.String.join sep (print_trace trace))
     else
       printf "%s\n" program;;