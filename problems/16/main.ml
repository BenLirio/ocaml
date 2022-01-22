(* Drop every nth element from a list. *)

let rec show lst =
  match lst with
  | [] -> ()
  | a :: rest -> Printf.printf "%c, " a; show rest

let drop n lst =
  let rec aux n' lst =
    match lst with
    | [] -> []
    | a :: rest -> if n' = n then aux 1 rest else
      a :: aux (n' + 1) rest
  in aux 1 lst

let () =
  show (drop 2 ['0'; '1'; '2'; '3'; '4'; '5'; '6'])
