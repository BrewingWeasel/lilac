type warning_type =
  | RedundantPattern of
      Ast.pattern Location.located_span
      * Ast.pattern Location.located_span
  | NonexistentPattern of
      string * string Location.located_span list

val display :
  warning_type Location.located_span ->
  Display_error.file_line array ->
  string ->
  string * bool

val lint_file :
  Interpreter.context ->
  Display_error.file_line array ->
  string ->
  unit

