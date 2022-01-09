#use "topfind"
#require "stdio"
#require "base"
open Stdio
open Base

let upcase_first_entry line =
    match String.split ~on:',' line with
    | [] -> assert false
    | first :: rest -> String.concat ~sep:"," (String.uppercase first :: rest)
let () =
    printf "%s" (upcase_first_entry "one,two,three")
