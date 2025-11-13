open Matched.Lexer

let display_lexed_tokens tokens =
  match tokens with
  | Ok tokens -> List.iter (fun v -> print_endline @@ token_to_string v) tokens
  | Error _ -> Printf.printf "Lexing error\n"

let%expect_test "simple lexing" =
  display_lexed_tokens @@ lex "hi there & other | 23 thing \n\n\n test32 _yes_";
  [%expect
    {|
    Ident(hi)
    Ident(there)
    &
    Ident(other)
    |
    Number(23)
    Ident(thing)
    Ident(test32)
    Ident(_yes_)
    |}]

let%expect_test "lexing string" =
  display_lexed_tokens
  @@ lex {| "thing with a random \\ in the middle and then some \"quotes\"" |};
  [%expect
    {| String(thing with a random \ in the middle and then some "quotes") |}]

let%expect_test "lexing empty string" =
  display_lexed_tokens @@ lex {| "" |};
  [%expect {| String() |}]
