print_endline "";
print_endline "Welcome to BillBook!";
print_endline "To acquire information of a user, type in 'user username'.";
print_endline "To acquire information of an event, type in 'event event_id'.";
print_endline "For more information of functionalities, enter 'help'. "

open Functions

let events = read_csv_file "test.csv"

let rec action first_input evts =
  match first_input with
  | [ "quit" ] -> exit 0
  | "summary" :: _ ->
      print_endline "The following events have been recorded: ";
      List.iter see_event evts
  | "record" :: _ ->
      print_endline "Enter the name of the event: ";
      let a = String.trim (input_line stdin) in
      print_endline "Enter the name of the payer: ";
      let b = String.trim (input_line stdin) in
      print_endline "Enter the names of the participants, seperated by ',': ";
      let c = String.split_on_char ',' (String.trim (input_line stdin)) in
      print_endline "Enter the bill amount: ";
      let d = float_of_string (String.trim (input_line stdin)) in
      let evt = input_event a b c d in
      let evt_lst = [ evt ] in
      see_event evt;
      write_csv_file "test.csv" (List.append evts evt_lst)
  | "check" :: _ ->
      print_endline "Enter the name of the event: ";
      let event_name = String.trim (input_line stdin) in
      let matching_events =
        List.filter (fun evt -> evt.event_name = event_name) evts
      in
      List.iter see_event matching_events
  | "delete" :: _ ->
      print_endline "Enter the name of the event: ";
      let event_name = String.trim (input_line stdin) in
      let remaining_events =
        List.filter (fun evt -> evt.event_name <> event_name) evts
      in
      write_csv_file "test.csv" remaining_events;
      print_endline "The event has been deleted."
  | "debt" :: _ ->
      print_endline "Debts summaried as follows: ";
      let user_list = optimizer evts in
      print_endline (userlist_to_string user_list)
  | "mydebt" :: _ -> (
      print_endline "Enter the name of the user: ";
      let user_name = String.trim (input_line stdin) in
      let user_list = optimizer evts in
      let user = List.find_opt (fun user -> user.name = user_name) user_list in
      match user with
      | Some u -> print_endline (user_to_string u)
      | None -> print_endline ("No user named " ^ user_name ^ " found."))
  | [ "help" ] -> print_endline (help_function "")
  | "help" :: fun_name :: _ -> print_endline (help_function fun_name)
  | _ ->
      print_endline
        "Unknown command. To quit the program enter 'quit'. Enter 'help' for \
         more info.";
      let second_input =
        String.split_on_char ' ' (String.trim (input_line stdin))
      in
      action second_input evts

let () =
  let rec wait_for_command () =
    let input = String.split_on_char ' ' (String.trim (input_line stdin)) in
    action input events;
    wait_for_command ()
  in
  wait_for_command ()
