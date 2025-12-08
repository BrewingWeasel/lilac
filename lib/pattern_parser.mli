val parse_pattern :
  Lexer.token Location.located_span list ->
  ( Ast.pattern Location.located_span * Lexer.token Location.located_span list,
    Parser_error.error )
  result
