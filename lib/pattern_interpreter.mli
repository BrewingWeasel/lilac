type run_end_func =
  (int * char) Seq.t -> Scope.scope -> ((int * char) Seq.t * Scope.scope) option

type context = {
  char_updater : (char -> char) Option.t;
  inherited_variable_matcher : ((char -> bool) * run_end_func) Option.t;
  trying_to_match : string;
}

val run_match :
  Ast.pattern list ->
  String.t ->
  ('a * Ast.pattern Location.located_span) Scope.VariableMap.t ->
  Scope.scope option
