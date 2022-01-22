
let rec show (lst : char list) : unit = match lst with
| [] -> ()
| a :: rest -> Printf.printf "%c " a; show rest

let replicate (lst : char list) (n : int) : char list = 
  let rec aux n' acc lst =
    match lst with
    | [] -> acc
    | a :: tl -> if n' = 0 then aux n acc tl else
      aux (n' - 1) (a :: acc) lst
  in List.rev (aux n [] lst)

let () =
  show (replicate ['a'; 'b'; 'c'] 3)
