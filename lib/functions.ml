
type info = {a:string}
let rec summary (b:info list) = match  b with
| [] -> "none"
| [h] -> (match h with {a} -> a)
| h::t -> (match h with {a} -> a)^summary t

let read_lines file process =
  let in_ch = open_in file in
  let rec read_line () =
    let line = try input_line in_ch with End_of_file -> exit 0
    in (* process line in this block, then read the next line *)
       process line;
       read_line ();
in read_line ();;

read_lines "trial.txt" print_endline;;