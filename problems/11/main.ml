type 'a rle =
    | One of 'a
    | Many of int * 'a


let encode vals =
    let rec aux count acc = function
        | [] -> []
        | [a] -> if count = 0 then (One (a))::acc else (Many (count+1, a))::acc
        | a :: (b :: _ as rest) -> if a = b
        then
            aux (count + 1) acc rest
        else
            if count = 0
            then
                aux 0 ((One (a))::acc) rest
            else
                aux 0 ((Many (count+1,a))::acc) rest

    in List.rev (aux 0 [] vals)
let () =
    List.iter (fun x -> match x with
        | One (a) -> Printf.printf "%s: 1\n" a
        | Many (count, a) -> Printf.printf "%s: %d\n" a count)
    (encode ["a"; "a"; "a"; "b"; "c"; "c"; "d"])
