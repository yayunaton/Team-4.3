(** this file represent the data stored in functions.ml*)

type event
(** an object with type info represents an input record an event represents a
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

(* val inputEvent: string *)
