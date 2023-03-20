(** this file represent the data stored in functions.ml*)

type event
(** an object with type event represents an input record an event represents a
    single event. It includes:

    - name of the event (string)
    - the name of the bill payer (string)
    - the event participants' names (string list)
    - the bill amount (float)
    - event id (int) *)

(** an object with type user represents a user and its personal info*)
(*type user *)

val summary : event list -> string
(** [summary lst] would print a string of all info in lst, each info separated
    by a comma *)

(** help_function takes a function name and return the spec of that function if
    it exists. *)
(* val help_function : string -> string *)

(** event_to_string takes in an event an outputs a string that contains all the
    information in this event. *)
(* val event_to_string: event -> string *)

(** input_event takes four parameters: name of the event (string); name of the
    payer (string); event participants' names (string list); bill amount
    (float), and outputs the event that is created. *)
(* val input_event: string -> string -> string list -> float -> event *)

(** print_all_event outputs all the events that the user input before. *)
(* val print_all_event: _ -> event list *)

(** name_search_event takes the name (OR ID?? TBD) of the event and returns that
    event if it exists. If it doesn't exist, it will return an empty event
    (format TBD).*)
(* val name_search_event: string -> event *)

(** delete_event takes the name (OR ID?? TBD) of the event and delete the
    corresponding event if it exists. It returns the event if it is deleted or
    an empty event if it does not exist. *)
(* val delete_event: string -> event; *)

(** debt_summary returns the current debt record of all participants in the
    format of "who owes who how much money".*)
(* val debt_summary: _ -> string *)

(** name_search_debt takes in a person's name and outputs the debt record of
    that person (if the person exists) or an empty string. *)
(* val name_search_debt: string -> string *)
