type token =
  | TAmpersand
  | TPipe
  | TLParen
  | TRParen
  | TQuestionMark
  | TEquals
  | TComma
  | TSemicolon
  | TPlus
  | TColon
  | TDollars
  | TDoubleEquals
  | TDef
  | TPattern
  | TWhere
  | TEnd
  | TAs
  | TNumber of int
  | TIdent of string
  | TString of string

val token_to_string : token -> string

type error = UnexpectedCharacter of char | ExpectedCharacter of char

val error_to_string : error -> string

val display_error :
  error * int -> Display_error.file_line array -> string -> string

val lex : String.t -> (token Location.located_span list, error * int) result
