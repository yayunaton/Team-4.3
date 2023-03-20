(** this file represent the data stored in functions.ml*)

type info
(** an object with type info represents an input record*)

val summary : info list -> string
(** [summary lst] would output a string of all info in lst, each info separated
    by a comma *)

val description : int -> string
(** [description id] would output the descrption of info whose event ID is [id],
    if the event is not found, return "False"*)

val delete : int -> string
(** [delete id] would output "Event deleted + [the event description]"*)
