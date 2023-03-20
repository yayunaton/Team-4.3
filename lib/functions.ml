type event = {
  eventName : string;
      (* payerName: string; participants: string list; billAmount: float; id:
         int; *)
}
(* type user = {a:string} *)

(**type user = {
  name : string;
  bill : event list;
  debt : (string * float) list;
}*)

let rec summary (b : event list) =
  match b with
  | [] -> "none"
  | [ h ] -> (
      match h with
      | { eventName } -> eventName)
  | h :: t ->
      (match h with
      | { eventName } -> eventName)
      ^ summary t

(**let help_function fun_name = if fun_name = "" then "summary: would print a
   string of all records, each record separated by a comma \n " else *)

let read_lines file process =
  let in_ch = open_in file in
  let rec read_line () =
    let line = try input_line in_ch with End_of_file -> exit 0 in
    (* process line in this block, then read the next line *)
    process line;
    read_line ()
  in
  read_line ()
;;

read_lines "trial.txt" print_endline
