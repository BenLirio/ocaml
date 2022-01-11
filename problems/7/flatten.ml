let flatten list_ =
    let aux acc = function
let () =
    List.iter (Printf.printf "%s ") (flatten [["a"; "a"]; ["b"; "b"; "b"; "b"]; ["c"]])
