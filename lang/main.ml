(* Operators: &, |, <, >, + *)

let (+) (a : bool) (b : bool) = if a = b then false else true

let f = [(&&); (||); (<); (>); (+)]

let tt0 = [false; false; true; true]
let tt1 = [false; true; false; true]


let zip l1 l2 =
    let rec aux acc = function
        | (h1 :: t1), (h2 :: t2) -> aux ((h1,h2)::acc) (t1, t2)
        | ([]), ([]) -> acc
        | _ -> assert false
    in List.rev (aux [] (l1, l2))

let () =
    List.iter (Printf.printf "%b ") (List.map (fun (a, b) -> ((+) a b)) (zip tt0 tt1))
