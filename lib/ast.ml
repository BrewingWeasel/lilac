type pattern =
  | PVar of string
  | PLiteral of string
  | PEither of pattern * pattern
  | POptional of pattern
  | PMultiple of pattern list
