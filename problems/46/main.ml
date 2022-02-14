type var = string

type bool_expr =
  | Var of var
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr

let rec bool_expr_to_string : bool_expr -> string =
  fun e -> match e with
  | Var v -> v
  | Not e1 -> "!"^bool_expr_to_string e1
  | And(e1, e2) -> "("^(bool_expr_to_string e1)^"&&"^(bool_expr_to_string e2)^")"
  | Or(e1, e2) -> "("^(bool_expr_to_string e1)^"||"^(bool_expr_to_string e2)^")"

let e1 = And(Or(Var "a", Var "b"), And(Var "a", Var "b"))

type ttable = (bool*bool*bool) list
let ttable_to_string : ttable -> string =
  fun tt -> 
  String.concat "\n"
  (List.map 
  (fun (x,y,z) -> Printf.sprintf "%b,%b,%b" x y z)
  tt)

let table2 : var -> var -> bool_expr -> ttable =
  fun v1 v2 e -> match

let () =
  Printf.printf "%s\n" (ttable_to_string (table2 "a" "b" e1))
