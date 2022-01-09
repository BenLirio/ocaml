#use "topfind"
#require "base"
#require "stdio"
open Base
open Stdio

let area_of_ring inner_radius outer_radius =
    let pi = Float.pi in
    let area_of_circle r = pi*. r *. r in
    area_of_circle outer_radius -. area_of_circle inner_radius
let () =
    printf "%F\n" (area_of_ring 2. 3.)
