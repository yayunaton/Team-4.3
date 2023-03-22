type event = {
  event_name : string;
  payer_name : string;
  participants : string list;
  bill_amount : float; (*id : int;*)
}
(* type user = {a:string} *)

(**type user = {
  name : string;
  bill : event list;
  debt : (string * float) list;
}*)

let see_event event =
  print_endline "";
  match event with
  | { event_name; payer_name; participants; bill_amount } ->
      print_endline "Event recorded.";
      print_endline ("Name: " ^ event_name);
      print_endline ("Payer: " ^ payer_name);
      print_string "Participants: ";
      List.iter (fun x -> print_string (x ^ ", ")) participants;
      print_endline "";
      print_endline ("Bill amount: " ^ string_of_float bill_amount)
(*print_endline ("Event id: " ^ string_of_int id)*)

let input_event a b c d =
  { event_name = a; payer_name = b; participants = c; bill_amount = d }

(*let rec summary (b : event list) = match b with | [] -> "none" | [ h ] -> (
  match h with | { event_name; payer_name; participants; bill_amount (*;id*) }
  -> event_name) | h :: t -> (match h with | { event_name; payer_name;
  participants; bill_amount } -> event_name) ^ summary t *)

let help_function fun_name =
  if fun_name = "" then
    "summary: \n\
    \  Look over past events. \n\
    \ \n\
     enter: \n\
    \  Enter an event to record the event name, payer, paritcipents, and bill \
     amount. \n\
    \ \n\
     check: \n\
    \  Check an event with its name or id. \n\
    \ \n\
     delete: \n\
    \  Delete an event with its name or id. \n\
    \ \n\
     debt: \n\
    \  Look over debt record of all participants. \n\
    \ \n\
     mydebt: \n\
    \  check someone's debt record."
  else if fun_name = "summary" then "look over past events"
  else if fun_name = "enter" then
    "Enter an event to record the event name, payer, paritcipents, and bill \
     amount."
  else if fun_name = "check" then "Check an event with its name or id."
  else if fun_name = "delete" then "Delete an event with its name or id."
  else if fun_name = "debt" then "Look over debt record of all participants."
  else if fun_name = "mydebt" then "check someone's debt record."
  else "you enter invalid input"

(*let read_lines file process = let in_ch = open_in file in let rec read_line ()
  = let line = try input_line in_ch with End_of_file -> exit 0 in (* process
  line in this block, then read the next line *) process line; read_line () in
  read_line ()*)

(*read_lines "trial.txt" print_endline*)
