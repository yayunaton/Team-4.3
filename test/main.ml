open OUnit2
open Functions

let test_event_1 : Functions.event =
  {
    event_name = "1";
    payer_name = "Porridge";
    participants = [ "Ian"; "Rachel" ];
    bill_amount = 3.0;
  }

let test_event_2 : Functions.event =
  {
    event_name = "1";
    payer_name = "James";
    participants = [ "Ian"; "Rachel" ];
    bill_amount = 3.0;
  }

let test_userlist_1 : user list =
  [
    { name = "Rachel"; debt = [ ("James", 2.0) ]; total_debt = 2.0 };
    { name = "Ian"; debt = [ ("Porridge", 2.0) ]; total_debt = 2.0 };
    { name = "Porridge"; debt = []; total_debt = -2.0 };
    { name = "James"; debt = []; total_debt = -2.0 };
  ]

let test_eventlist_1 : event list = [ test_event_1; test_event_2 ]

let tests =
  "brb test suite"
  >::: [
         ( "test listDic.empty" >:: fun _ ->
           assert_equal (optimizer test_eventlist_1) test_userlist_1 );
       ]

let _ = run_test_tt_main tests
