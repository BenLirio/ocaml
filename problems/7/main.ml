#use "topfind";;
#thread;;
#require "base";;
open Base;;

type pos = VERB | NOUN | POS_UNKNOWN ;;

let sentence = "Joe Jill ran"
in
let get_token s = match String.rev (String.of_char_list s) with
    | "Joe" -> NOUN
    | "Jill" -> NOUN
    | "ran" -> VERB
    | _ -> POS_UNKNOWN
in
let tokenize sentence = 
    let rec aux tokens (cur : char list) = function
        | [] -> (get_token cur) :: tokens
        | h :: t -> 
            let cur' = match h with
                | ' ' -> []
                | _ -> h :: cur
            in
            let tokens' = match h with
                | ' ' -> (get_token cur) :: tokens
                | _ -> tokens
            in
            aux tokens' cur' t
    in aux [] [] (String.to_list sentence)
in
let rec show_tokens = function
    | [] -> ()
    | h :: t -> match h with
        | NOUN -> show_tokens t; Caml.Printf.printf "NOUN\n"
        | VERB -> show_tokens t; Caml.Printf.printf "VERB\n"
        | POS_UNKNOWN -> show_tokens t; Caml.Printf.printf "UNKNOWN\n"
in show_tokens (tokenize sentence)
