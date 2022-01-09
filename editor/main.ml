#use "topfind"
#require "stdio"
open Stdio

type 'a node =
    | Node of 'a * 'a node * 'a node * 'a node
    | Leaf of 'a node
    | Root

let print s =
    Out_channel.output_string Out_channel.stdout s;
    Out_channel.flush Out_channel.stdout

let rec show_node = function
    | Node (v, _, _, p) -> print v; show_node p
    | Root -> print "Root\n"
    | Leaf (p) -> print "Leaf\n"; show_node p

let rec loop state =
    match state with
        | Root -> loop (Leaf(Root))
        | Leaf (p) -> print "New leaf\n"; loop (Node ("0", Leaf(state), Leaf(state), p))
        | Node (v, l, r, p) -> let line = In_channel.input_line In_channel.stdin in match line with
            | None -> print "Done.\n"
            | Some x -> match x with
                | "r" -> loop r
                | "l" -> loop l
                | "show" -> show_node state; loop state
                | _ -> loop state

let () =
    loop Root
