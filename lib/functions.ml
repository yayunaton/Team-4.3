type event =
  { event_name : string
  ; payer_name : string
  ; participants : string list
  ; bill_amount : float (*id : int;*)
  }

type user =
  { name : string
  ; debt : (string * float) list
  ; total_debt : float
  }

type record =
  { name : string
  ; mutable debt : float
  }

let rec debt_to_string_helper (d : (string * float) list) : string =
  match d with
  | [] ->
      ""
  | (str, fl) :: t ->
      "Owes "
      ^ str
      ^ " "
      ^ string_of_float fl
      ^ " dollars; "
      ^ debt_to_string_helper t


let debt_to_string d =
  match d with
  | [] ->
      "This person is out of debt!"
  | _ ->
      "[" ^ debt_to_string_helper d ^ "];"


let user_to_string (u : user) : string =
  let { name = n; debt = d; total_debt = td } = u in
  "{\n    name: "
  ^ n
  ^ ";\n    current debt: "
  ^ debt_to_string d
  ^ "\n    entire debt: "
  ^ string_of_float td
  ^ "\n\
    \    (a positive means this person is in debt; a negative means this \
     person is a lender.)\n\
     }"
  ^ "\n"


let rec userlist_to_string_helper (ul : user list) : string =
  match ul with
  | [] ->
      ""
  | u :: t ->
      user_to_string u ^ userlist_to_string_helper t


let userlist_to_string (ul : user list) =
  "\n" ^ userlist_to_string_helper ul ^ ""


let record_to_string re =
  let { name = n; debt = d } = re in
  "{ " ^ n ^ " " ^ string_of_float d ^ " }"


let rec recordlist_to_string rel =
  match rel with
  | [] ->
      ""
  | re :: t ->
      record_to_string re ^ recordlist_to_string t


let see_event event =
  print_endline "" ;
  match event with
  | { event_name; payer_name; participants; bill_amount } ->
      print_endline "Event recorded." ;
      print_endline ("Name: " ^ event_name) ;
      print_endline ("Payer: " ^ payer_name) ;
      print_string "Participants: " ;
      List.iter (fun x -> print_string (x ^ ", ")) participants ;
      print_endline "" ;
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
  if fun_name = ""
  then
    "summary: \n\
    \  Look over past events. \n\
    \ \n\
     record: \n\
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
  else if fun_name = "summary"
  then "look over past events"
  else if fun_name = "enter"
  then
    "Enter an event to record the event name, payer, paritcipents, and bill \
     amount."
  else if fun_name = "check"
  then "Check an event with its name or id."
  else if fun_name = "delete"
  then "Delete an event with its name or id."
  else if fun_name = "debt"
  then "Look over debt record of all participants."
  else if fun_name = "mydebt"
  then "check someone's debt record."
  else "you enter invalid input"


(*let read_lines file process = let in_ch = open_in file in let rec read_line ()
  = let line = try input_line in_ch with End_of_file -> exit 0 in (* process
  line in this block, then read the next line *) process line; read_line () in
  read_line ()*)

(*read_lines "trial.txt" print_endline*)

let parse_event (row : string list) : event =
  match row with
  | [ event_name; payer_name; participants_str; bill_amount_str ] ->
      let participants = String.split_on_char '_' participants_str in
      let bill_amount = float_of_string bill_amount_str in
      { event_name; payer_name; participants; bill_amount }
  | _ ->
      failwith "Unexpected row format"


let event_to_row (event : event) : string list =
  match event with
  | { event_name; payer_name; participants; bill_amount } ->
      [ event_name
      ; payer_name
      ; String.concat "_" participants
      ; string_of_float bill_amount
      ]


let read_csv_file (filename : string) : event list =
  let rows : string list list = Csv.load filename in
  List.map parse_event rows


let write_csv_file (filename : string) (events : event list) : unit =
  let oc = open_out filename in
  let csv = Csv.to_channel oc in
  let rows = List.map event_to_row events in
  Csv.output_all csv rows ;
  close_out oc


(*THE OPTIMIZER AREA BEGINS FROM HERE*)

let find_or_create (debt_record : record list) (name : string) =
  if List.exists (fun re -> if re.name = name then true else false) debt_record
     = false
  then
    let new_record = { name; debt = 0. } :: debt_record in
    new_record
  else debt_record


let rec foc_list (dr : record list) (nl : string list) =
  match nl with
  | [] ->
      dr
  | name :: h ->
      let new_record = foc_list dr h in
      find_or_create new_record name


let rec adjust_debt
    (debt_record : record list)
    (payer : string)
    (part : string list)
    (bill : float) =
  match debt_record with
  | [] ->
      debt_record
  | re :: h ->
      let _ =
        if re.name = payer
        then
          re.debt <-
            re.debt
            -. (bill *. (1. -. (1. /. (float_of_int (List.length part) +. 1.))))
          (*bill/c*)
        else if List.mem re.name part
        then
          re.debt <- re.debt +. (bill /. (float_of_int (List.length part) +. 1.))
        else () (*IMPOSSIBLE?*)
      in
      adjust_debt h payer part bill


let rec create_record (e : event list) (debt_record : record list) : record list
    =
  match e with
  | [] ->
      debt_record
  | { event_name = _
    ; payer_name = payer
    ; participants = ps
    ; bill_amount = bill
    }
    :: h ->
      let newps = payer :: ps in
      let foc_record = foc_list debt_record newps in
      (* print_endline "foc_record: "; print_endline (recordlist_to_string
         foc_record); *)
      let _ = adjust_debt foc_record payer ps bill in
      create_record h foc_record


let record_compare r1 r2 =
  if r1.debt = r2.debt then 0 else if r1.debt > r2.debt then 1 else -1


let record_lst_sort (r : record list) = List.sort record_compare r

let rec check_in_debt (reco : record) (original : record list) : float =
  match original with
  | [] ->
      0. (*impossible*)
  | { name; debt } :: t ->
      if reco.name = name then debt else check_in_debt reco t


let rec find_first (recolist : record list) : int =
  match recolist with
  | [] ->
      0
  | { name = _; debt } :: t ->
      if debt < 0. then 0 else 1 + find_first t


let process_one_debter
    (reco : record) (recolist : record list) (original : record list) : user =
  let this_debt = check_in_debt reco original in
  if this_debt <= 0.
  then { name = reco.name; debt = []; total_debt = this_debt }
  else
    let debt2 = ref [] in
    let current_debt = ref reco.debt in
    let _ =
      while !current_debt <> 0. do
        let first_index = find_first recolist in
        (* print_endline (string_of_int first_index) ; print_endline
           (recordlist_to_string recolist) ; *)
        if first_index = List.length recolist
        then current_debt := 0.
        else
          let first_record = List.nth recolist first_index in
          if first_record.debt +. reco.debt <= 0.
          then (
            let new_debt = (first_record.name, !current_debt) in
            debt2 := new_debt :: !debt2 ;
            first_record.debt <- first_record.debt +. !current_debt ;
            current_debt := 0. )
          else
            let new_debt = (first_record.name, -1. *. first_record.debt) in
            debt2 := new_debt :: !debt2 ;
            current_debt := first_record.debt +. !current_debt ;
            first_record.debt <- 0.
      done
    in
    let result = { name = reco.name; debt = !debt2; total_debt = this_debt } in
    (* print_endline (user_to_string result); *)
    result


let rec process_rec_list (recolist : record list) (original : record list) :
    user list =
  match recolist with
  | [] ->
      []
  | reco :: hd ->
      (* print_endline ("thisprint" ^ record_to_string reco) ; *)
      process_one_debter reco recolist original :: process_rec_list hd original


(*Genearl Idea: Given a list of events, return a list of users such that the
  debt list of each user is optimized. 1. transform the list of events into
  users 2. sort the users in terms of debt 3. reimburse the user that is owed
  the most with the user that owes the least, and then with the user that owes
  the second least, etc. *)
let optimizer (e : event list) : user list =
  let debt_record : record list = [] in
  (*STEP 1*)
  let record2 = create_record e debt_record in
  (*STEP 2*)
  let sorted_record = record_lst_sort record2 in
  (*STEP 3. use list.rev because the sorting sequence is from least to most*)
  let result = process_rec_list (List.rev sorted_record) sorted_record in
  (* print_endline (userlist_to_string result) ; *)
  result
