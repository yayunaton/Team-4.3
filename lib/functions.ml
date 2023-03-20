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

let help_function fun_name =
  if fun_name = "" then
    "summary: would print a\n\
    \   string of all records, each record separated by a comma \n\
    \ event_to_string: takes in an event an outputs a string that contains all \
     the\n\
     information in this event \n\
    \ input_event takes four parameters: name of the event (string); name of the\n\
     payer (string); event participants' names (string list); bill amount\n\
     (float), and outputs the event that is created. \n\
    \ print_all_event outputs all the events that the user input before. \n\
    \ \n\
     name_search_event takes the name (OR ID?? TBD) of the event and returns \
     that\n\
    \    event if it exists. If it doesn't exist, it will return an empty event \n\
    \ \n\
    \      delete_event takes the name (OR ID?? TBD) of the event and delete the\n\
    \    corresponding event if it exists. It returns the event if it is \
     deleted or\n\
    \    an empty event if it does not exist. \n\
    \ debt_summary returns the current debt record of all participants in the\n\
    \      format of [who owes who how much money]. \n\
    \ name_search_debt takes in a person's name and outputs the debt record of\n\
    \    that person (if the person exists) or an empty string. "
  else if fun_name = "summary" then
    "[summary] would print a string of all info in lst, each info separated\n\
    \        by a comma"
  else if fun_name = "event_to_string" then
    "event_to_string takes in an event an outputs a string that contains all the\n\
    \          information in this event."
  else if fun_name = "input_event" then
    "input_event takes four parameters: name of the event (string); name of the\n\
    \            payer (string); event participants' names (string list); bill \
     amount\n\
    \            (float), and outputs the event that is created."
  else if fun_name = "print_all_event" then
    "print_all_event outputs all the events that the user input before. "
  else if fun_name = "name_search_event" then
    "name_search_event takes the name (OR ID?? TBD) of the event and returns \
     that\n\
    \            event if it exists. If it doesn't exist, it will return an \
     empty event\n\
    \            (format TBD)."
  else if fun_name = "delete_event" then
    "delete_event takes the name (OR ID?? TBD) of the event and delete the\n\
    \              corresponding event if it exists. It returns the event if \
     it is deleted or\n\
    \              an empty event if it does not exist."
  else if fun_name = "debt_summary" then
    "debt_summary returns the current debt record of all participants in the\n\
    \                format of [who owes who how much money]"
  else if fun_name = "name_search_debt" then
    "name_search_debt takes in a person's name and outputs the debt record of\n\
    \            that person (if the person exists) or an empty string."
  else "you enter invalid input"

(*let read_lines file process = let in_ch = open_in file in let rec read_line ()
  = let line = try input_line in_ch with End_of_file -> exit 0 in (* process
  line in this block, then read the next line *) process line; read_line () in
  read_line ()*)

(*read_lines "trial.txt" print_endline*)
