open OUnit2
open Functions

let test_event_1 : Functions.event =
  {
    event_name = "1";
    payer_name = "x";
    participants = [ "y" ];
    bill_amount = 10.0;
  }

let test_userlist_1 : user list =
  [
    { name = "x"; debt = []; total_debt = -10.0 };
    { name = "y"; debt = [ ("x", 10.0) ]; total_debt = 10.0 };
  ]

let test_eventlist_1 : event list = [ test_event_1 ]

let tests =
  "brb test suite"
  >::: [
         ( "test listDic.empty" >:: fun _ ->
           assert_equal (optimizer test_eventlist_1) test_userlist_1 );
       ]

let _ = run_test_tt_main tests
