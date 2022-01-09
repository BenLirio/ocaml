#use "topfind"
#require "base"
#require "stdio"
open Base
open Stdio
type token =
    | PAREN
    | OP
    | VAR

type 'a node =
    | Leaf
    | Node of 'a node * 'a * 'a node

let string_to_list s = List.init (String.length s) (String.get s)
let list_to_string l = String.init (List.length l) (fun x -> (List.nth_exn l (((List.length l) - 1) - x)))
let s = "(| (& 1 2) 3)"
let tokenize s =
    let rec aux tokens  = function
        | [] -> tokens
        | h :: t ->
                let tokens' = match h with
                    | ' ' -> tokens
                    | a -> (match a with
                        | '(' | ')' -> PAREN
                        | '|' | '&' -> OP
                        | _ -> VAR
                    ) :: tokens
                in aux tokens' t
    in aux [] (string_to_list s)
let () =
    printf "%s\n" (String.join (List.map (tokenize s) (fun x -> match x with PAREN -> "PAREN" | OP -> "OP" | VAR -> "VAR") " "))
