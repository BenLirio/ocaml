let encode lst =
    let rec aux count acc = function
        | a :: (b :: _ as t) -> if a = b 
        then
            aux (count+1) acc t
        else
            let acc = (count+1, a)::acc in
            aux 0 acc t
        | [h] -> (count+1, h)::acc
        | [] -> []
    in List.rev (aux 0 [] lst)

let () =
    List.iter (fun (count, letter) -> Printf.printf "%s: %d\n" letter count) (encode ["a"; "a"; "a"; "b"; "b"; "c"])
