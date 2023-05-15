open OUnit2
open Functions

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

       ; ( "test listDic.empty"
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


let test1 =
  [ ( "test large case"
    >:: fun _ ->
    assert_equal
      (userlist_to_string (optimizer test_eventlist_g1))
      (userlist_to_string test_userlist_g1) )
  ]


let test2 =
  ""
  >::: List.append
         test1
         [ ( "test listDic.empty"
           >:: fun _ ->
           assert_equal
             (optimizer test_eventlist_10)
             test_userlist_10
             ~printer:userlist_to_string )
         ; ( "test listDic.empty"
           >:: fun _ ->
           assert_equal
             (optimizer test_eventlist_9)
             test_userlist_9
             ~printer:userlist_to_string )
         ; ( "test listDic.empty"
           >:: fun _ ->
           assert_equal
             (optimizer test_eventlist_8)
             test_userlist_8
             ~printer:userlist_to_string )
         ; ( "test listDic.empty"
           >:: fun _ ->
           assert_equal
             (optimizer test_eventlist_7)
             test_userlist_7
             ~printer:userlist_to_string )
         ; ( "test listDic.empty"
           >:: fun _ ->
           assert_equal
             (optimizer test_eventlist_6)
             test_userlist_6
             ~printer:userlist_to_string )
         ; ( "test listDic.empty"
           >:: fun _ ->
           assert_equal
             (optimizer test_eventlist_5)
             test_userlist_5
             ~printer:userlist_to_string )
         ; ( "test listDic.empty"
           >:: fun _ ->
           assert_equal
             (optimizer test_eventlist_4)
             test_userlist_4
             ~printer:userlist_to_string )
         ; ( "test listDic.empty"
           >:: fun _ ->
           assert_equal
             (optimizer test_eventlist_3)
             test_userlist_3
             ~printer:userlist_to_string )
         ; ( "test listDic.empty"
           >:: fun _ ->
           assert_equal
             (optimizer test_eventlist_2)
             test_userlist_2
             ~printer:userlist_to_string )
         ; ( "test listDic.empty"
           >:: fun _ ->
           assert_equal (optimizer test_eventlist_1) test_userlist_1 )
         ]


let _ = run_test_tt_main test2
