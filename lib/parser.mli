val parse_expr :
  Lexer.token Location.located_span list ->
  ( Ast.expression Location.located_span * Lexer.token Location.located_span list,
    Parser_error.error )
  result

val parse_pattern_definition :
  Lexer.token Location.located_span list ->
  ( Ast.definition Location.located_span * Lexer.token Location.located_span list,
    Parser_error.error )
  result

val parse_definition :
  Lexer.token Location.located_span list ->
  ( Ast.definition Location.located_span * Lexer.token Location.located_span list,
    Parser_error.error )
  result

val parse_file :
  Lexer.token Location.located_span list ->
  (Ast.definition Location.located_span list, Parser_error.error) result
