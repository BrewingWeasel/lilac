val test_function :
  Interpreter.context ->
  string ->
  ('a * Ast.function_) list ->
  int * int * int ->
  int * int * int

val run_file_tests : Interpreter.context -> unit
