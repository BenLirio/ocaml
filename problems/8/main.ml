(* Eliminate consecutive duplicates of list elements. (medium) *)
#use "topfind"
#require "base"
#require "stdio"
open Stdio
open Base

let rec compress = function
    | a :: (b :: _ as t) -> if ((=) 0 (String.compare a b)) then compress t else a :: compress t
    | smaller -> smaller

let () =
    List.iter (compress ["a"; "b"; "c"]) ~f:(printf "%s ")
