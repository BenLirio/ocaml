#use "topfind"
#require "stdio"
#require "base"
open Stdio
open Base
List.map ~f:(fun x -> x + 1) [1;2;3]
