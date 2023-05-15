open OUnit2
open Functions

(* Test Plan: The primary function of our "Billbook database" is to calculate
   the optimized solution for group members to pay their bills. As a result, the
   accuracy of our program is crucial. We plan to test the accuracy of our
   algorithm by comparing the each case's result produced by the algorithm and
   our result calculated by hand. To compare the results, we first wrote two
   functions: event_list_to_string and user_list_to_string. This allows us to
   use assert_equal on the results we have. Then, we start with the most simple
   cases (empty, one event, etc.) and then gradually increase the difficulty.
   Meanwhile, we insert specific tests in the middle to make sure corner cases
   are handled correctly. *)

let test_event_1 : Functions.event =
  { event_name = "1"
  ; payer_name = "Porridge"
  ; participants = [ "Ian"; "Rachel" ]
  ; bill_amount = 3.0
  }


let test_event_2 : Functions.event =
  { event_name = "2"
  ; payer_name = "James"
  ; participants = [ "Ian"; "Rachel" ]
  ; bill_amount = 3.0
  }


let test_event_3 : Functions.event =
  { event_name = "3"
  ; payer_name = "Ian"
  ; participants = [ "James" ]
  ; bill_amount = 20.0
  }


let test_event_4 : Functions.event =
  { event_name = "4"
  ; payer_name = "Rachel"
  ; participants = [ "Ian"; "Porridge"; "Xmen" ]
  ; bill_amount = 4.0
  }


let test_event_5 : Functions.event =
  { event_name = "5"
  ; payer_name = "Porridge"
  ; participants = [ "Rachel" ]
  ; bill_amount = 10.0
  }


let test_event_6 : Functions.event =
  { event_name = "6"
  ; payer_name = "Porridge"
  ; participants = [ "Rachel" ]
  ; bill_amount = 20.0
  }


let test_event_7 : Functions.event =
  { event_name = "7"
  ; payer_name = "Rachel"
  ; participants = [ "Porridge" ]
  ; bill_amount = 20.0
  }


let test_event_8 : Functions.event =
  { event_name = "8"
  ; payer_name = "Rachel"
  ; participants = []
  ; bill_amount = 10.0
  }


let test_event_9 : Functions.event =
  { event_name = "9"
  ; payer_name = "Rachel"
  ; participants = [ "Ian" ]
  ; bill_amount = 0.0
  }


let test_event_10 : Functions.event =
  { event_name = "10"
  ; payer_name = "Rachel"
  ; participants = []
  ; bill_amount = 0.0
  }


let test_event_11 : Functions.event =
  { event_name = "big1"
  ; payer_name = "A"
  ; participants = []
  ; bill_amount = 0.0
  }


let test_event_12 : Functions.event =
  { event_name = "big3"
  ; payer_name = "B"
  ; participants = []
  ; bill_amount = 0.0
  }


let test_event_13 : Functions.event =
  { event_name = "big3"
  ; payer_name = "C"
  ; participants = []
  ; bill_amount = 0.0
  }


let test_event_14 : Functions.event =
  { event_name = "big4"
  ; payer_name = "D"
  ; participants = []
  ; bill_amount = 0.0
  }


let test_event_15 : Functions.event =
  { event_name = "big5"
  ; payer_name = "B"
  ; participants = []
  ; bill_amount = 0.0
  }


let test_event_16 : Functions.event =
  { event_name = "big6"
  ; payer_name = "A"
  ; participants = []
  ; bill_amount = 0.0
  }


let test_event_17 : Functions.event =
  { event_name = "big7"
  ; payer_name = "A"
  ; participants = []
  ; bill_amount = 1.0
  }


let test_event_18 : Functions.event =
  { event_name = "big3"
  ; payer_name = "B"
  ; participants = []
  ; bill_amount = 2.0
  }


let test_event_19 : Functions.event =
  { event_name = "big3"
  ; payer_name = "C"
  ; participants = []
  ; bill_amount = 3.0
  }


let test_event_20 : Functions.event =
  { event_name = "big4"
  ; payer_name = "D"
  ; participants = []
  ; bill_amount = 4.0
  }


let test_event_21 : Functions.event =
  { event_name = "big5"
  ; payer_name = "B"
  ; participants = []
  ; bill_amount = 2.0
  }


let test_event_22 : Functions.event =
  { event_name = "big6"
  ; payer_name = "A"
  ; participants = []
  ; bill_amount = 3.0
  }


let test_event_23 : Functions.event =
  { event_name = "A to B"
  ; payer_name = "B"
  ; participants = [ "A" ]
  ; bill_amount = 20.0
  }


let test_event_24 : Functions.event =
  { event_name = "B to C"
  ; payer_name = "C"
  ; participants = [ "B" ]
  ; bill_amount = 20.0
  }


let test_event_25 : Functions.event =
  { event_name = "C to A"
  ; payer_name = "A"
  ; participants = [ "C" ]
  ; bill_amount = 20.0
  }


let test_userlist_1 : user list =
  [ { name = "Rachel"; debt = [ ("James", 2.0) ]; total_debt = 2.0 }
  ; { name = "Ian"; debt = [ ("Porridge", 2.0) ]; total_debt = 2.0 }
  ; { name = "Porridge"; debt = []; total_debt = -2.0 }
  ; { name = "James"; debt = []; total_debt = -2.0 }
  ]


(*new participant, different debt amount for different people (test order)*)
let test_userlist_2 : user list =
  [ { name = "Ian"; debt = [ ("Rachel", 2.0) ]; total_debt = 2.0 }
  ; { name = "Xmen"; debt = [ ("Porridge", 1.0) ]; total_debt = 1.0 }
  ; { name = "Porridge"; debt = []; total_debt = -1.0 }
  ; { name = "Rachel"; debt = []; total_debt = -2.0 }
  ]


let test_userlist_3 : user list =
  [ { name = "James"; debt = [ ("Ian", 10.0) ]; total_debt = 10.0 }
  ; { name = "Ian"; debt = []; total_debt = -10.0 }
  ]


let test_userlist_4 : user list =
  [ { name = "James"; debt = [ ("Ian", 10.0) ]; total_debt = 10.0 }
  ; { name = "Rachel"; debt = [ ("Porridge", 5.0) ]; total_debt = 5.0 }
  ; { name = "Porridge"; debt = []; total_debt = -5.0 }
  ; { name = "Ian"; debt = []; total_debt = -10.0 }
  ]


let test_userlist_5 : user list =
  [ { name = "James"; debt = [ ("Porridge", 10.0) ]; total_debt = 10.0 }
  ; { name = "Rachel"; debt = [ ("Ian", 10.0) ]; total_debt = 10.0 }
  ; { name = "Ian"; debt = []; total_debt = -10.0 }
  ; { name = "Porridge"; debt = []; total_debt = -10.0 }
  ]


let test_userlist_6 : user list =
  [ { name = "Rachel"; debt = []; total_debt = 0.0 }
  ; { name = "Porridge"; debt = []; total_debt = 0.0 }
  ]


let test_userlist_7 : user list = []

let test_userlist_8 : user list =
  [ { name = "Rachel"; debt = []; total_debt = 0.0 } ]


let test_userlist_9 : user list =
  [ { name = "Ian"; debt = []; total_debt = 0.0 }
  ; { name = "Rachel"; debt = []; total_debt = 0.0 }
  ]


let test_userlist_10 : user list =
  [ { name = "Rachel"; debt = []; total_debt = 0.0 } ]


let test_userlist_11 : user list =
  [ { name = "A"; debt = []; total_debt = 0.0 }
  ; { name = "B"; debt = []; total_debt = 0.0 }
  ; { name = "C"; debt = []; total_debt = 0.0 }
  ; { name = "D"; debt = []; total_debt = 0.0 }
  ]


let test_userlist_12 : user list =
  [ { name = "A"; debt = []; total_debt = 0.0 }
  ; { name = "B"; debt = []; total_debt = 0.0 }
  ; { name = "C"; debt = []; total_debt = 0.0 }
  ; { name = "D"; debt = []; total_debt = 0.0 }
  ]


let test_userlist_13 : user list =
  [ { name = "A"; debt = []; total_debt = 0.0 }
  ; { name = "B"; debt = []; total_debt = 0.0 }
  ; { name = "C"; debt = []; total_debt = 0.0 }
  ]


let test_eventlist_1 : event list = [ test_event_1; test_event_2 ]

let test_eventlist_2 : event list = [ test_event_1; test_event_4 ]

let test_eventlist_3 : event list = [ test_event_3 ]

let test_eventlist_4 : event list = [ test_event_3; test_event_5 ]

let test_eventlist_5 : event list = [ test_event_3; test_event_6 ]

let test_eventlist_6 : event list = [ test_event_6; test_event_7 ]

let test_eventlist_7 : event list = []

let test_eventlist_8 : event list = [ test_event_8 ]

let test_eventlist_9 : event list = [ test_event_9 ]

let test_eventlist_10 : event list = [ test_event_10 ]

let test_eventlist_11 : event list =
  [ test_event_11
  ; test_event_12
  ; test_event_13
  ; test_event_14
  ; test_event_15
  ; test_event_16
  ]


let test_eventlist_12 : event list =
  [ test_event_17
  ; test_event_18
  ; test_event_19
  ; test_event_20
  ; test_event_21
  ; test_event_22
  ]


let test_eventlist_13 : event list =
  [ test_event_23; test_event_24; test_event_25 ]


(*A complicated debt relationship.*)
let testevent_g1_1 : event =
  { event_name = "g1-1"
  ; payer_name = "Porridge"
  ; participants = [ "James"; "Solomon"; "Kaitlyn"; "Amy"; "Joseph" ]
  ; bill_amount = 12.0
  }


let testevent_g1_2 : event =
  { event_name = "g1-2"
  ; payer_name = "Solomon"
  ; participants = [ "Amy"; "Joseph" ]
  ; bill_amount = 9.0
  }


let testevent_g1_3 : event =
  { event_name = "g1-3"
  ; payer_name = "Porridge"
  ; participants = [ "Amy"; "Kaitlyn" ]
  ; bill_amount = 15.0
  }


let testevent_g1_4 : event =
  { event_name = "g1-4"
  ; payer_name = "James"
  ; participants = [ "Amy"; "Kaitlyn"; "Porridge"; "Solomon" ]
  ; bill_amount = 10.0
  }


let testevent_g1_5 : event =
  { event_name = "g1-5"
  ; payer_name = "Bill"
  ; participants = [ "Porridge"; "Albert"; "Solomon" ]
  ; bill_amount = 20.0
  }


let testevent_g1_6 : event =
  { event_name = "g1-6"
  ; payer_name = "Albert"
  ; participants = [ "Bill" ]
  ; bill_amount = 5.0
  }


let testevent_g1_7 : event =
  { event_name = "g1-7"
  ; payer_name = "Albert"
  ; participants = []
  ; bill_amount = 1000.0
  }


let testevent_g1_8 : event =
  { event_name = "g1-8"
  ; payer_name = "Amy"
  ; participants = [ "James"; "Bill"; "Porridge"; "Joseph" ]
  ; bill_amount = 30.0
  }


let testevent_g1_9 : event =
  { event_name = "g1-9"
  ; payer_name = "Bill"
  ; participants = [ "Amy" ]
  ; bill_amount = 6.0
  }


let testevent_g1_10 : event =
  { event_name = "g1-10"
  ; payer_name = "Kaitlyn"
  ; participants = [ "Porridge"; "Solomon" ]
  ; bill_amount = 21.0
  }


let testevent_g1_11 : event =
  { event_name = "g1-11"
  ; payer_name = "Kaitlyn"
  ; participants = [ "Bill" ]
  ; bill_amount = 4.0
  }


let testevent_g1_12 : event =
  { event_name = "g1-9"
  ; payer_name = "Joseph"
  ; participants = [ "Amy"; "Bill"; "Solomon" ]
  ; bill_amount = 20.0
  }


let testevent_g1_13 : event =
  { event_name = "g1-13"
  ; payer_name = "Joseph"
  ; participants = [ "Amy" ]
  ; bill_amount = 2.0
  }


let testevent_g1_14 : event =
  { event_name = "g1-14"
  ; payer_name = "Albert"
  ; participants = [ "Solomon"; "James"; "Amy" ]
  ; bill_amount = 8.0
  }


let testevent_g1_15 : event =
  { event_name = "g1-15"
  ; payer_name = "Bill"
  ; participants = [ "Solomon" ]
  ; bill_amount = 100.0
  }


let test_eventlist_g1 =
  [ testevent_g1_1
  ; testevent_g1_2
  ; testevent_g1_3
  ; testevent_g1_4
  ; testevent_g1_5
  ; testevent_g1_6
  ; testevent_g1_7
  ; testevent_g1_8
  ; testevent_g1_9
  ; testevent_g1_10
  ; testevent_g1_11
  ; testevent_g1_12
  ; testevent_g1_13
  ; testevent_g1_14
  ; testevent_g1_15
  ]


let test_userlist_g1 : user list =
  [ { name = "Solomon"
    ; debt =
        [ ("Bill", 52.5); ("Kaitlyn", 7.0); ("Joseph", 5.0); ("Albert", 2.5) ]
    ; total_debt = 67.0
    }
  ; { name = "James"
    ; debt = [ ("Albert", 1.0); ("Amy", 1.0) ]
    ; total_debt = 2.0
    }
  ; { name = "Porridge"; debt = []; total_debt = 0.0 }
  ; { name = "Amy"; debt = []; total_debt = -1.0 }
  ; { name = "Albert"; debt = []; total_debt = -3.5 }
  ; { name = "Joseph"; debt = []; total_debt = -5.0 }
  ; { name = "Kaitlyn"; debt = []; total_debt = -7.0 }
  ; { name = "Bill"; debt = []; total_debt = -52.5 }
  ]


let event_comp (evt1 : Functions.event) (evt2 : Functions.event) =
  match evt1 with
  | { event_name; payer_name; participants; bill_amount } ->
      let a = event_name in
      let b = payer_name in
      let c = participants in
      let d = bill_amount in
      ( match evt2 with
      | { event_name; payer_name; participants; bill_amount } ->
          a = event_name
          && b = payer_name
          && c = participants
          && d = bill_amount )


let parse_test str evt =
  "test parse" >:: fun _ -> assert (event_comp (parse_event str) evt)


let to_row_test str evt =
  "test to_row" >:: fun _ -> assert_equal (event_to_row (parse_event evt)) str


let parse_tests : test list =
  [ parse_test
      [ "Event_1"; "Alice"; "Bob_Charlie"; "50." ]
      { event_name = "Event_1"
      ; payer_name = "Alice"
      ; participants = [ "Bob"; "Charlie" ]
      ; bill_amount = 50.0
      }
  ; parse_test
      [ "Event_2"; "Bob"; "Dave"; "50." ]
      { event_name = "Event_2"
      ; payer_name = "Bob"
      ; participants = [ "Dave" ]
      ; bill_amount = 50.0
      }
  ; parse_test
      [ "Event_3"; "Charlie"; "Eve"; "50." ]
      { event_name = "Event_3"
      ; payer_name = "Charlie"
      ; participants = [ "Eve" ]
      ; bill_amount = 50.0
      }
  ; parse_test
      [ "Event_4"; "James"; "George_Rachel_Yayun"; "50." ]
      { event_name = "Event_4"
      ; payer_name = "James"
      ; participants = [ "George"; "Rachel"; "Yayun" ]
      ; bill_amount = 50.0
      }
  ; parse_test
      [ "Event_1"; "Alice"; ""; "50." ]
      { event_name = "Event_1"
      ; payer_name = "Alice"
      ; participants = []
      ; bill_amount = 50.0
      }
  ]


let to_row_tests : test list =
  [ to_row_test
      [ "Event_1"; "Alice"; "Bob_Charlie"; "50." ]
      [ "Event_1"; "Alice"; "Bob_Charlie"; "50." ]
  ; to_row_test
      [ "Event_2"; "Bob"; "Dave"; "30." ]
      [ "Event_2"; "Bob"; "Dave"; "30." ]
  ; to_row_test
      [ "Event_1"; "Alice"; ""; "50." ]
      [ "Event_1"; "Alice"; ""; "50." ]
  ; to_row_test
      [ "Event_1"; ""; "Bob_Charlie"; "50." ]
      [ "Event_1"; ""; "Bob_Charlie"; "50." ]
  ; to_row_test
      [ ""; "Alice"; "Bob_Charlie"; "50." ]
      [ ""; "Alice"; "Bob_Charlie"; "50." ]
  ]


let test_dbt_str dbt str =
  "test debt_to_string" >:: fun _ -> assert_equal (debt_to_string dbt) str


let test_usrlst lst str =
  "test userlist_to_string"
  >:: fun _ -> assert_equal (userlist_to_string lst) str


let test_record r s =
  "test recordlist_to_string"
  >:: fun _ -> assert_equal (recordlist_to_string r) s


let str_tests =
  [ test_dbt_str [] "This person is out of debt!"
  ; test_dbt_str [ ("A", 50.0) ] "[Owes A 50. dollars; ];"
  ; test_dbt_str
      [ ("A", 50.0); ("B", 50.0) ]
      "[Owes A 50. dollars; Owes B 50. dollars; ];"
  ; test_dbt_str [ ("", 50.0) ] "[Owes  50. dollars; ];"
  ; test_dbt_str [ ("A", 0.0) ] "[Owes A 0. dollars; ];"
  ; test_usrlst [] "\n"
  ; test_usrlst
      [ { name = "A"; debt = []; total_debt = 0.0 } ]
      ( "\n"
      ^ "{\n    name: "
      ^ "A"
      ^ ";\n    current debt: "
      ^ debt_to_string []
      ^ "\n    entire debt: "
      ^ string_of_float 0.0
      ^ "\n\
        \    (a positive means this person is in debt; a negative means this \
         person is a lender.)\n\
         }"
      ^ "\n" )
  ; test_usrlst
      [ { name = "A"; debt = [ ("B", 20.0) ]; total_debt = 20.0 } ]
      ( "\n"
      ^ "{\n    name: "
      ^ "A"
      ^ ";\n    current debt: "
      ^ debt_to_string [ ("B", 20.0) ]
      ^ "\n    entire debt: "
      ^ string_of_float 20.0
      ^ "\n\
        \    (a positive means this person is in debt; a negative means this \
         person is a lender.)\n\
         }"
      ^ "\n" )
  ; test_usrlst
      [ { name = ""; debt = [ ("B", 20.0); ("C", 20.0) ]; total_debt = 40.0 } ]
      ( "\n"
      ^ "{\n    name: "
      ^ ""
      ^ ";\n    current debt: "
      ^ debt_to_string [ ("B", 20.0); ("C", 20.0) ]
      ^ "\n    entire debt: "
      ^ string_of_float 40.0
      ^ "\n\
        \    (a positive means this person is in debt; a negative means this \
         person is a lender.)\n\
         }"
      ^ "\n" )
  ; test_usrlst
      [ { name = "A"; debt = []; total_debt = -40.0 } ]
      ( "\n"
      ^ "{\n    name: "
      ^ "A"
      ^ ";\n    current debt: "
      ^ debt_to_string []
      ^ "\n    entire debt: "
      ^ string_of_float (-40.0)
      ^ "\n\
        \    (a positive means this person is in debt; a negative means this \
         person is a lender.)\n\
         }"
      ^ "\n" )
  ; test_record [] ""
  ; test_record [ { name = "A"; debt = 0.0 } ] "{ A 0. }"
  ; test_record
      [ { name = "A"; debt = 0.0 }; { name = "B"; debt = 0.0 } ]
      "{ A 0. }{ B 0. }"
  ; test_record
      [ { name = "A"; debt = 30.0 }; { name = "B"; debt = 20.0 } ]
      "{ A 30. }{ B 20. }"
  ; test_record
      [ { name = "A"; debt = -30.0 }; { name = "B"; debt = -20.0 } ]
      "{ A -30. }{ B -20. }"
  ]


let test1 =
  [ ( "test large case"
    >:: fun _ ->
    assert_equal
      (userlist_to_string (optimizer test_eventlist_g1))
      (userlist_to_string test_userlist_g1) )
  ]


let test2 =
  [ ( "test repeat case"
    >:: fun _ ->
    assert_equal
      (userlist_to_string (optimizer test_eventlist_11))
      (userlist_to_string test_userlist_11) )
  ]


let test3 =
  [ ( "test 3"
    >:: fun _ ->
    assert_equal
      (optimizer test_eventlist_10)
      test_userlist_10
      ~printer:userlist_to_string )
  ]


let test4 =
  [ ( "test repeat case"
    >:: fun _ ->
    assert_equal
      (userlist_to_string (optimizer test_eventlist_12))
      (userlist_to_string test_userlist_12) )
  ]


let test5 =
  [ ( "test auto case"
    >:: fun _ ->
    assert_equal
      (userlist_to_string (optimizer test_eventlist_13))
      (userlist_to_string test_userlist_13) )
  ]


let test6 =
  [ ( "test 6"
    >:: fun _ ->
    assert_equal
      (optimizer test_eventlist_9)
      test_userlist_9
      ~printer:userlist_to_string )
  ]


let test7 =
  [ ( "test 7"
    >:: fun _ ->
    assert_equal
      (optimizer test_eventlist_8)
      test_userlist_8
      ~printer:userlist_to_string )
  ]


let test8 =
  [ ( "test 8"
    >:: fun _ ->
    assert_equal
      (optimizer test_eventlist_7)
      test_userlist_7
      ~printer:userlist_to_string )
  ]


let test9 =
  [ ( "test 9"
    >:: fun _ ->
    assert_equal
      (optimizer test_eventlist_6)
      test_userlist_6
      ~printer:userlist_to_string )
  ]


let test10 =
  [ ( "test listDic.empty"
    >:: fun _ ->
    assert_equal
      (optimizer test_eventlist_5)
      test_userlist_5
      ~printer:userlist_to_string )
  ]


let test11 =
  [ ( "test 11"
    >:: fun _ ->
    assert_equal
      (optimizer test_eventlist_4)
      test_userlist_4
      ~printer:userlist_to_string )
  ]


let test12 =
  [ ( "test 12"
    >:: fun _ ->
    assert_equal
      (optimizer test_eventlist_3)
      test_userlist_3
      ~printer:userlist_to_string )
  ]


let test13 =
  [ ( "test 13"
    >:: fun _ ->
    assert_equal
      (optimizer test_eventlist_2)
      test_userlist_2
      ~printer:userlist_to_string )
  ]


let test14 =
  [ ( "test 14"
    >:: fun _ -> assert_equal (optimizer test_eventlist_1) test_userlist_1 )
  ]


let test_createrecord_event1 =
  { event_name = "empty"
  ; payer_name = "Rachel"
  ; participants = []
  ; bill_amount = 4.0
  }


let test_createrecord_eventls1 = [ test_createrecord_event1 ]

let test_createrecord_1 =
  [ ( "test only one record"
    >:: fun _ ->
    assert_equal
      (create_record test_createrecord_eventls1 [])
      [ { name = "Rachel"; debt = 0.0 } ]
      ~printer:recordlist_to_string )
  ]


let test_createrecord_event2 =
  { event_name = "2"
  ; payer_name = "Rachel"
  ; participants = [ "Ian" ]
  ; bill_amount = 4.0
  }


let test_createrecord_eventls2 = [ test_createrecord_event2 ]

let test_createrecord_2 =
  [ ( "test two records with one event"
    >:: fun _ ->
    assert_equal
      (create_record test_createrecord_eventls2 [])
      [ { name = "Rachel"; debt = -2.0 }; { name = "Ian"; debt = 2.0 } ]
      ~printer:recordlist_to_string )
  ]


let test_createrecord_event3 =
  { event_name = "2"
  ; payer_name = "James"
  ; participants = [ "Ian"; "George" ]
  ; bill_amount = 6.0
  }


let test_createrecord_eventls3 = [ test_createrecord_event3 ]

let test_createrecord_3 =
  [ ( "test multiple records with one event"
    >:: fun _ ->
    assert_equal
      (create_record test_createrecord_eventls3 [])
      [ { name = "James"; debt = -4.0 }
      ; { name = "Ian"; debt = 2.0 }
      ; { name = "George"; debt = 2.0 }
      ]
      ~printer:recordlist_to_string )
  ]


let test_createrecord_event4 =
  { event_name = "2"
  ; payer_name = "George"
  ; participants = [ "Solomon" ]
  ; bill_amount = 6.0
  }


let test_createrecord_eventls4 = [ test_createrecord_event4 ]

let test_createrecord_event4MORE =
  { event_name = "2"
  ; payer_name = "Ralph"
  ; participants = [ "Kara" ]
  ; bill_amount = 6.0
  }


let test_createrecord_4 =
  [ ( "test if the original debt record is not empty, hence we need to add \
       more while keep the original"
    >:: fun _ ->
    assert_equal
      (create_record
         test_createrecord_eventls4
         (create_record [ test_createrecord_event4MORE ] []) )
      [ { name = "George"; debt = -3.0 }
      ; { name = "Solomon"; debt = 3.0 }
      ; { name = "Ralph"; debt = -3.0 }
      ; { name = "Kara"; debt = 3.0 }
      ]
      ~printer:recordlist_to_string )
  ]


let test_createrecord_event5 =
  { event_name = "2"
  ; payer_name = "George"
  ; participants = [ "Ralph" ]
  ; bill_amount = 6.0
  }


let test_createrecord_eventls5 = [ test_createrecord_event5 ]

let test_createrecord_event5MORE =
  { event_name = "2"
  ; payer_name = "George"
  ; participants = [ "Kara" ]
  ; bill_amount = 6.0
  }


let test_createrecord_5 =
  [ ( "test if the original debt record is not empty, hence we need to add \
       more AND MAKE ADJUSTMENT while keep the original"
    >:: fun _ ->
    assert_equal
      (create_record
         test_createrecord_eventls5
         (create_record [ test_createrecord_event5MORE ] []) )
      [ { name = "Ralph"; debt = 3.0 }
      ; { name = "George"; debt = -6.0 }
      ; { name = "Kara"; debt = 3.0 }
      ]
      ~printer:recordlist_to_string )
  ]


let test_createrecord_event6_1 =
  { event_name = "2"
  ; payer_name = "George"
  ; participants = [ "Conner" ]
  ; bill_amount = 6.0
  }


let test_createrecord_event6_2 =
  { event_name = "2"
  ; payer_name = "Kara"
  ; participants = [ "Conner" ]
  ; bill_amount = 6.0
  }


let test_createrecord_eventls6 =
  [ test_createrecord_event6_1; test_createrecord_event6_2 ]


let test_createrecord_event6MORE_1 =
  { event_name = "2"
  ; payer_name = "Markus"
  ; participants = [ "Kara" ]
  ; bill_amount = 6.0
  }


let test_createrecord_event6MORE_2 =
  { event_name = "2"
  ; payer_name = "Markus"
  ; participants = [ "Conner" ]
  ; bill_amount = 6.0
  }


let test_createrecord_6 =
  [ ( "test multiple events with all complications"
    >:: fun _ ->
    assert_equal
      (create_record
         test_createrecord_eventls6
         (create_record
            [ test_createrecord_event6MORE_1; test_createrecord_event6MORE_2 ]
            [] ) )
      [ { name = "George"; debt = -3.0 }
      ; { name = "Conner"; debt = 9.0 }
      ; { name = "Markus"; debt = -6.0 }
      ; { name = "Kara"; debt = 0.0 }
      ]
      ~printer:recordlist_to_string )
  ]


let test_rcsort_rc1 = { name = "Steph"; debt = 0.0 }

let test_rcsort_rcls1 = [ test_rcsort_rc1 ]

let test_rcsort1 =
  [ ( "test one case"
    >:: fun _ ->
    assert_equal
      (record_lst_sort test_rcsort_rcls1)
      [ { name = "Steph"; debt = 0.0 } ] )
  ]


let test_rcsort_rcls2 = []

let test_rcsort2 =
  [ ( "test empty"
    >:: fun _ -> assert_equal (record_lst_sort test_rcsort_rcls2) [] )
  ]


let test_rcsort_rc3_1 = { name = "Angela"; debt = -1.0 }

let test_rcsort_rc3_2 = { name = "JJ"; debt = 1.0 }

let test_rcsort_rcls3 = [ test_rcsort_rc3_1; test_rcsort_rc3_2 ]

let test_rcsort3 =
  [ ( "test more cases, in order"
    >:: fun _ ->
    assert_equal
      (record_lst_sort test_rcsort_rcls3)
      [ { name = "Angela"; debt = -1.0 }; { name = "JJ"; debt = 1.0 } ] )
  ]


let test_rcsort_rc4_1 = { name = "Steph"; debt = -100.0 }

let test_rcsort_rc4_2 = { name = "JJ"; debt = 100.0 }

let test_rcsort_rc4_3 = { name = "Esther"; debt = 50.0 }

let test_rcsort_rcls4 =
  [ test_rcsort_rc4_2; test_rcsort_rc4_1; test_rcsort_rc4_3 ]


let test_rcsort4 =
  [ ( "test more cases, NOT in order"
    >:: fun _ ->
    assert_equal
      (record_lst_sort test_rcsort_rcls4)
      [ { name = "Steph"; debt = -100.0 }
      ; { name = "Esther"; debt = 50.0 }
      ; { name = "JJ"; debt = 100.0 }
      ] )
  ]


let test_input1 =
  [ ( "test input event, all empty"
    >:: fun _ ->
    assert_equal
      (input_event "" "" [] 0.0)
      { event_name = ""; payer_name = ""; participants = []; bill_amount = 0.0 }
    )
  ]


let test_input2 =
  [ ( "test input event, all NOT empty"
    >:: fun _ ->
    assert_equal
      (input_event "1" "2" [ "3" ] 1.0)
      { event_name = "1"
      ; payer_name = "2"
      ; participants = [ "3" ]
      ; bill_amount = 1.0
      } )
  ]


let test_input3 =
  [ ( "test input event, weird strings"
    >:: fun _ ->
    assert_equal
      (input_event "!&*(#&)#)$(*)🥳😫💩🤡ℬℏ⦿☞❡" "qwiepihav⁌௹Ã℠" [ "🖥️💟☮️" ] 1.0 )
      { event_name = "!&*(#&)#)$(*)🥳😫💩🤡ℬℏ⦿☞❡"
      ; payer_name = "qwiepihav⁌௹Ã℠"
      ; participants = [ "🖥️💟☮️" ]
      ; bill_amount = 1.0
      } )
  ]


let test =
  ""
  >::: test1
       @ test2
       @ test3
       @ test4
       @ test5
       @ test6
       @ test7
       @ test8
       @ test9
       @ test10
       @ test11
       @ test12
       @ test13
       @ test14
       @ test_createrecord_1
       @ test_createrecord_2
       @ test_createrecord_3
       @ test_createrecord_4
       @ test_createrecord_5
       @ test_createrecord_6
       @ to_row_tests (*THERE ARE 5 TEST CASES HERE*)
       @ parse_tests (*THERE ARE 5 TEST CASES HERE*)
       @ test_rcsort1
       @ test_rcsort2
       @ test_rcsort3
       @ test_rcsort4
<<<<<<< HEAD
       @ str_tests
=======
       @ test_input1
       @ test_input2
       @ test_input3
>>>>>>> 3c5d4e756edb41362d6cc185f617c2d4cd378035


let _ = run_test_tt_main test
