type 'a located_span = {
  value : 'a;
  start_pos : int;
  end_pos : int;
}

val to_string_located_span :
  ('a -> string) -> 'a located_span -> string

