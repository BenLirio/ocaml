#use "topfind"
#require "base"
#require "stdio"
open Base
open Stdio

let transforms = [String.uppercase; String.lowercase] ;;
List.map ~f:(fun x -> printf "%s\n" x) (List.map ~f:(fun g -> g "Hello World") transforms)
