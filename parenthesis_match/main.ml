#use "topfind"
#require "base"
open Base

let rec validate s = match s with
| [] -> true
| '(' :: rest -> validate rest
| _ :: rest -> validate rest

let () =
  Caml.Printf.printf "%b" (validate (String.to_list "()(()(()()()))()"))
