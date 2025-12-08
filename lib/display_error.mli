type error_level = Warning | Error | Context

type highlight = {
  error_level : error_level;
  start_pos : int;
  end_pos : int;
  message : string;
}

type error = {
  level : error_level;
  start_pos : int;
  message : string;
  highlights : highlight list;
}

type file_line = {
  start_pos : int;
  end_pos : int;
  content : string;
}

val to_file_map : String.t -> file_line array

val render_error : error -> file_line array -> string -> string

