#use "topfind"
#require "stdlib"
open Stdlib

let file = "/home/ben/datasets/corpora/movies_text.txt"

let numbers_chan = open_in "text.txt"

let numbers_stream = Stream.of_channel numbers_chan

let print_stream s =
    let rec aux = function
        | [] -> Stream.empty s
        | a :: rest -> Stream.junk s; Printf.printf "%c%s\n" a (String.concat "" (List.map (String.make 1) rest)); aux (Stream.npeek 3 s)
    in aux (Stream.npeek 3 s)

let () =
    print_stream numbers_stream
