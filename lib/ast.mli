type pattern =
  | PVar of string
  | PReference of string
  | PLiteral of string
  | PEither of
      pattern Location.located_span
      * pattern Location.located_span
  | POptional of pattern Location.located_span
  | PAs of
      string Location.located_span
      * pattern Location.located_span
  | PMultiple of pattern Location.located_span list
  | PWithAttribute of
      pattern Location.located_span
      * string Location.located_span

val pattern_to_string : pattern -> string

type expression =
  | EVar of string
  | EString of string
  | EConcat of
      expression Location.located_span
      * expression Location.located_span
  | EFunctionCall of
      string * expression Location.located_span list

val expression_to_string : expression -> string

type function_ = {
  arguments :
    pattern Location.located_span list Location.located_span;
  expression : expression Location.located_span;
  assertions :
    (expression Location.located_span
    * expression Location.located_span)
    list;
}

type definition =
  | DPattern of
      string Location.located_span
      * pattern Location.located_span
  | DFunction of string Location.located_span * function_

val definition_to_string : definition -> string
