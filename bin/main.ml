print_endline "";
print_endline "Welcome to BillBook!";
print_endline "To acquire information of a user, type in 'user username'.";
print_endline "To acquire information of an event, type in 'event event_id'.";
print_endline "For more information of functionalities, enter 'help'. "

open Functions

(*let data = csv_to_record_list (Csv.load "test.csv")*)
let first_input = String.split_on_char ' ' (String.trim (input_line stdin))

let rec action first_input =
  (* Quit *)
  if first_input = [ "quit" ] then exit 0 (* Look over past events. *)
  else if List.hd first_input = "summary" then
    print_endline "This functionality is to be implemented"
    (* Input new event *)
  else if List.hd first_input = "record" then (
    print_endline "Enter the name of the event: ";
    let a = String.trim (input_line stdin) in
    print_endline "Enter the name of the payer: ";
    let b = String.trim (input_line stdin) in
    print_endline "Enter the names of the participants, seperated by ',': ";
    let c = String.split_on_char ',' (String.trim (input_line stdin)) in
    print_endline "Enter the bill amount: ";
    let d = float_of_string (String.trim (input_line stdin)) in
    see_event (input_event a b c d)
    (* Help *)

    (* Finding event info *))
  else if List.hd first_input = "check" then
    print_endline "This functionality is to be implemented"
  else if List.hd first_input = "delete" then
    print_endline "This functionality is to be implemented"
  else if List.hd first_input = "debt" then
    print_endline "This functionality is to be implemented"
  else if List.hd first_input = "mydebt" then
    print_endline "This functionality is to be implemented"
  else if List.hd first_input = "help" then
    if List.length first_input = 1 then print_endline (help_function "")
    else print_endline (help_function (List.nth first_input 1))
  else
    print_endline
      "Unknown command. To quit the program enter 'quit'. Enter 'help' for \
       more info.";
  (* Repeat *)
  let second_input =
    String.split_on_char ' ' (String.trim (input_line stdin))
  in
  action second_input

let () = action first_input
