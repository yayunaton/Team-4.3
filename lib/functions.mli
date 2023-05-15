type event =
  { event_name : string
  ; payer_name : string
  ; participants : string list
  ; bill_amount : float
  }

type record =
  { name : string
  ; mutable debt : float
  }

type user =
  { name : string
  ; debt : (string * float) list
  ; total_debt : float
  }

val see_event : event -> unit
(**see_event prints an event.*)

val parse_event : string list -> event

val event_to_row : event -> string list

val input_event : string -> string -> string list -> float -> event
(**input_event takes in all parameters for an event and creates an event
   accordingly. Input: event name (string); payer name (string); participants
   (string list); bill amount (float).*)

val help_function : string -> string
(**help_function handles user input that queries functionalities.*)

val read_csv_file : string -> event list

val write_csv_file : string -> event list -> unit

val optimizer : event list -> user list
(**OPTIMIZER IS THE CORE OF OUR PROJECT. It takes in a list of events, and
   outputs a user list, such that the user list reflects the debt relationship
   summarized from all events in the event list while the number of transactions
   between users is reduced to the optimal least.*)

val debt_to_string : (string * float) list -> string
(**debt_to_string converts a list of debts ((string * float) list, string as the
   money lender, float as the debt of the debter owes to the money lender) to a
   string.*)

val user_to_string : user -> string
(**user_to_string converts a user type to a string.*)

val userlist_to_string : user list -> string
(**userlist_to_string converts a list of users to a string.*)

val recordlist_to_string : record list -> string
(**recordlist_to_string converts a list of record to a string.*)

val create_record : event list -> record list -> record list
(**create_record takes in a list of events and a list of records (both can be
   empty), and outputs a record list summarized from the given event list and
   record list. That is, based on the given record list, it adds more records or
   change the debt of existing records according to the event list.*)

val record_lst_sort : record list -> record list
(**record_lst_sort sorts a record list from the user that owes the most to the
   user that lends out the most.*)
