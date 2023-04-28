type event = {
  event_name : string;
  payer_name : string;
  participants : string list;
  bill_amount : float;
}

type record = {
  name : string;
  mutable debt : float;
}

val see_event : event -> unit
val input_event : string -> string -> string list -> float -> event
val help_function : string -> string
val csv_to_record_list : Csv.t -> record list
val record_list_to_csv : record list -> Csv.t
val write_csv : string -> Csv.t -> unit
