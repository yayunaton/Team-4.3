(** this file represent the data stored in functions.ml*)


type info 
(** an object with type info represents an input record*)

val summary : info list -> string
(** [summary lst] would print a string of all info in lst, each info separated
    by a comma *)

