print_endline
  "Welcome to BillBook! To acquire information of a user, type in 'user \
   username'. To acquire information of an event, type in 'event event_id'. \
   For more information of functionalities type in 'help'. "

let first_input = String.split_on_char ' ' (String.trim (input_line stdin))

let action =
  if first_input = [ "quit" ] then exit 0
  else if List.hd first_input = "user" then
    print_endline "This functionality is to be implemented"
  else if List.hd first_input = "event" then
    print_endline "This functionality is to be implemented"
