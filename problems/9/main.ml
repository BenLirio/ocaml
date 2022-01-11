(* Pack consecutive duplicates of list elements into sublists *)


let pack list =
    let rec aux current acc = function
        | [] -> []
        | [x] -> (x :: current) :: acc
        | a :: (b :: _ as t) ->
                if a = b then aux (a :: current) acc t
                else aux [] ((a :: current) :: acc) t in
    List.rev (aux [] [] list)

let () =
    List.iter (List.iter (Printf.printf "%s ")) (pack ["a"; "a"; "a"; "b"; "b"; "b"; "c"; "c"; "d"])
