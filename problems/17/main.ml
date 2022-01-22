exception OutOfRange of string

let rec show lst =
  match lst with
  | [] -> ()
  | a :: rest -> Printf.printf "%c " a; show rest

let split (n : int) (lst : 'a list) : ('a list * 'a list) =
  let rec aux n' acc lst =
    match lst with
    | [] -> if n' = 0 then (List.rev acc, []) else raise (OutOfRange "N should be smaller than list")
    | a :: rest -> if n' = 0 then (List.rev acc, lst) else
      aux (n' - 1) (a :: acc) rest
  in aux n [] lst

let () =
  match (split 5 ['a'; 'b'; 'c'; 'd'; 'e']) with
  | (a, b) -> show a; Printf.printf "| "; show b
