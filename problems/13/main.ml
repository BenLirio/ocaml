(* Run length encoding of a list *)
type 'a rle =
  | One of 'a
  | Many of int * 'a

let rec show (a : 'a rle list) : unit = match a with
| [] -> ()
| One(v) :: tl -> Printf.printf "(%c)\n" v; show tl
| Many((n, v)) :: tl -> Printf.printf "(%d, %c)\n" n v; show tl


let encode a =
  let rec aux count acc = function
    | [] -> acc
    | [h] -> Many(count + 1, h) :: acc
    | a :: (b :: _ as rest) -> if a = b then aux (count + 1) acc rest else
      aux 0 (Many(count + 1, a) :: acc) rest
  in List.rev (aux 0 [] a)

let () =
  show (encode ['a'; 'a'; 'a'; 'b'; 'b'; 'c'; 'c'; 'c'; 'c'])
