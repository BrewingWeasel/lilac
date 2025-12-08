type expected_token = {
  token : Lexer.token;
  because : string Location.located_span option;
}

type error =
  | UnexpectedToken of Lexer.token Location.located_span
  | UnexpectedEndOfInput
  | ExpectedToken of
      expected_token list * Lexer.token Location.located_span option

val error_to_string : error -> string
val display : error -> Display_error.file_line array -> string -> string
