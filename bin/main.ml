print_endline "";
print_endline "Welcome to BillBook!";
print_endline "To acquire information of a user, type in 'user username'.";
print_endline "To acquire information of an event, type in 'event event_id'.";
print_endline "For more information of functionalities type in 'help'. "

open Functions

let first_input = String.split_on_char ' ' (String.trim (input_line stdin))

(*let take_event = let a = String.trim (input_line stdin) in let b = String.trim
  (input_line stdin) in let c = String.split_on_char ' ' (String.trim
  (input_line stdin)) in let d = int_of_string (input_line stdin) in input_event
  a b c d*)

let action first_input =
  if first_input = [ "quit" ] then exit 0
  else if List.hd first_input = "user" then
    print_endline "This functionality is to be implemented"
  else if List.hd first_input = "event" then
    print_endline "This functionality is to be implemented"
(*else if List.hd first_input = "new event" then take_event else if List.hd
  first_input = "help" then if List.length first_input = 1 then help_function ""
  else help_function (List.nth first_input 1)*)

let () = action first_input
