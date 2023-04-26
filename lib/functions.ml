type event = {
  event_name : string;
  payer_name : string;
  participants : string list;
  bill_amount : float; (*id : int;*)
}
(* type user = {a:string} *)

type user = {
  name : string;
  bill : event list;
  debt : (string * float) list;
  total_debt: float;
}

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
(*https://github.com/Chris00/ocaml-csv*)
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

type record = {name:string; mutable debt:float}

let find_or_create (debt_record : record list) (name: string) = 
  if List.exists (fun re -> if re.name = name then true else false) debt_record = false then 
    let new_record = {name=name; debt=0.}:: debt_record in new_record
  else debt_record

let rec foc_list (dr: record list) (nl: string list) = 
  match nl with 
  | [] -> dr
  | name :: h -> let new_record = foc_list dr h in find_or_create new_record name

let rec adjust_debt (debt_record: record list) (payer: string) (part: string list) (bill: float)=
  match debt_record with 
  | [] -> debt_record
  | re :: h -> 
    let _ = 
      if re.name=payer then re.debt <- re.debt -. bill
      else if List.mem re.name part 
          then re.debt <- (re.debt +. bill /. float_of_int (List.length part))
          else ()
    in adjust_debt h payer part bill

let rec create_record (e: event list) (debt_record: record list): record list = 
  match e with 
  | [] -> debt_record
  | {event_name=_; payer_name = payer; participants=ps; bill_amount=bill}::h -> 
    let newps = payer :: ps in 
    let foc_record = foc_list debt_record newps in
    let new_record2 = (adjust_debt foc_record payer ps bill) in 
      create_record h new_record2

let record_compare r1 r2 =
  if r1.debt = r2.debt then 0 else if r1.debt > r2.debt then 1 else -1

let record_lst_sort (r : record list) = List.sort record_compare r

(*Genearl Idea: Given a list of events, return a list of users
  such that the debt list of each user is optimized
  1. transform the list of events into users
  2. sort the users in terms of debt 
  3. reimburse the user that is owed the most with the user that owes the least,
  and then with the user that owes the second least, etc. 
   *)
let optimizer (e: event list) : user list= 
  let debt_record : record list = [] in 
  let record2 = create_record e debt_record in 




(*this function is supposed to transform a list of events into a list of users.
   It's just more complicated than I thought.*)
(* let events_to_users (e: event list) : user list = let users = [] in 
  List.map (fun (e: event) -> 
    match e with 
    {event_name;payer_name = payer;participants = ps;bill_amount = b} ->
    match (List.find_map (fun u1 -> if u1.name = payer then Some u1 else None) users)
    with 
    | Some u1 -> u1.bill) *)
