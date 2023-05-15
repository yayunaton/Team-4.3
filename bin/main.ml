(* This line of code is used to print a blank line *)
print_endline "" ;
(* Welcome message for the user *)
print_endline "Welcome to BillBook!" ;
(* Another blank line for aesthetic purposes *)
print_endline "" ;
(* Instructions for the user *)
print_endline "To input an event, type in 'record'. " ;
print_endline "To acquire information of a user, type in 'mydebt'." ;
print_endline "To acquire information of an event, type in 'check'." ;
(* More instructions for the user *)
print_endline
  "For more functionalities or further info for these functions, enter 'help'. " ;
print_endline "To quit, type 'quit'."

(* Importing functions *)
open Functions

(* Reading the events from a CSV file *)
let events = read_csv_file "test.csv"

(* Initializing a boolean ref to keep track of updates *)
let updated = ref false

(* Initializing a list of users *)
let usrlst : user list ref = ref []

(* Function to handle the action based on user input *)
let rec action first_input evts updt lst =
  match first_input with
  | [ "quit" ] ->
      (* When the input is "quit", exit the program *)
      exit 0
  | "summary" :: _ ->
      (* When the input is "summary", print the recorded events *)
      print_endline "The following events have been recorded: " ;
      List.iter see_event evts
  | "record" :: _ ->
      (* When the input is "record", record a new event *)
      print_endline "Enter the name of the event: " ;
      let a = String.trim (input_line stdin) in
      print_endline "Enter the name of the payer: " ;
      let b = String.trim (input_line stdin) in
      print_endline "Enter the names of the participants, seperated by ',': " ;
      let c = String.split_on_char ',' (String.trim (input_line stdin)) in
      print_endline "Enter the bill amount: " ;
      let d = float_of_string (String.trim (input_line stdin)) in
      let evt = input_event a b c d in
      let evt_lst = [ evt ] in
      see_event evt ;
      updt := false ;
      write_csv_file "test.csv" (List.append evts evt_lst)
  | "check" :: _ ->
      (* When the input is "check", check an event *)
      print_endline "Enter the name of the event: " ;
      let event_name = String.trim (input_line stdin) in
      let matching_events =
        List.filter (fun evt -> evt.event_name = event_name) evts
      in
      if List.length matching_events > 0
      then List.iter see_event matching_events
      else print_endline "Event name not found."
  | "delete" :: _ ->
      (* When the input is "delete", delete an event *)
      print_endline "Enter the name of the event: " ;
      let event_name = String.trim (input_line stdin) in
      let remaining_events =
        List.filter (fun evt -> evt.event_name <> event_name) evts
      in
      write_csv_file "test.csv" remaining_events ;
      updt := false ;
      print_endline "The event has been deleted."
  | "debt" :: _ ->
      (* When the input is "debt", summarize the debts *)
      if !updt = false
      then (
        print_endline "Debts summarized as follows: " ;
        updt := true ;
        let user_list = optimizer evts in
        lst := user_list ;
        print_endline (userlist_to_string user_list) )
      else print_endline (userlist_to_string !lst)
  | "mydebt" :: _ ->
      (* When the input is "mydebt", show the debt of a specific user *)
      print_endline "Enter the name of the user: " ;
      let user_name = String.trim (input_line stdin) in
      let user_list =
        if !updt = false
        then (
          updt := true ;
          lst := optimizer evts ;
          !lst )
        else !lst
      in
      let user = List.find_opt (fun user -> user.name = user_name) user_list in
      ( match user with
      | Some u ->
          print_endline (user_to_string u)
      | None ->
          print_endline ("No user named " ^ user_name ^ " found.") )
  | [ "help" ] ->
      (* When the input is "help", provide help to the user *)
      print_endline (help_function "")
  | "help" :: fun_name :: _ ->
      (* When the input is "help" followed by a function name, provide help
         about that function *)
      print_endline (help_function fun_name)
  | _ ->
      (* For any other input, print an error message *)
      print_endline
        "Unknown command. To quit the program enter 'quit'. Enter 'help' for \
         more info." ;
      let second_input =
        String.split_on_char ' ' (String.trim (input_line stdin))
      in
      action second_input evts updt lst


let () =
  (* Wait for the user to enter a command, and then process it *)
  let rec wait_for_command () =
    let input = String.split_on_char ' ' (String.trim (input_line stdin)) in
    action input events updated usrlst ;
    wait_for_command ()
  in
  wait_for_command ()
