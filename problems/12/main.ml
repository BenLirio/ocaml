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

let rec fill_list n item = 
    let rec aux acc = function
        | 0 -> acc
        | a -> aux (item::acc) (a-1)
    in aux [] n

let flatten lst =
    let aux acc = function
        | [] -> acc
        | a :: rest ->

let decode lst =
    let rec aux acc = function
        | [] -> acc
        | (count, value) :: rest -> aux ((fill_list count value)::acc) rest
    in aux [] lst

let () =
    (decode (encode ["a"; "a"; "a"; "b"; "b"; "c"]))
