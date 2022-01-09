#use "topfind"
#require "stdio"
#require "base"
open Base
open Stdio
let () =
    printf "%d\n" ((fun x -> x + 1) 7)
