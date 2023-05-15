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

val input_event : string -> string -> string list -> float -> event

val help_function : string -> string

val read_csv_file : string -> event list

val write_csv_file : string -> event list -> unit

val optimizer : event list -> user list

val debt_to_string : (string * float) list -> string

val user_to_string : user -> string

val userlist_to_string : user list -> string

val recordlist_to_string : record list -> string

val create_record : event list -> record list -> record list
