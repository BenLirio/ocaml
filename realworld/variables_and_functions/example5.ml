#use "topfind"
#require "stdio"
open Stdio
let rec find_first_repeat nums =
    match nums with
    | [] | [_] ->
            (* only zero or more elements, so no repeats *)
            None
    | x :: y :: tl ->
            if x = y then Some x else find_first_repeat (y::tl)
let () =
    match (find_first_repeat [1;2;3;3;4;5;6]) with
    | None -> ()
    | Some x -> printf "%d" x
