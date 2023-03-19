open OUnit2
open Enigma

(** [index_test name input expected_output] constructs an OUnit test named
    [name] that asserts the quality of [expected_output] with [index input]. *)
let index_test (name : string) (input : char) (expected_output : int) : test =
  name >:: fun _ ->
  (* the [printer] tells OUnit how to convert the output to a string *)
  assert_equal expected_output (index input) ~printer:string_of_int

(* You will find it helpful to write functions like [index_test] for each of the
   other functions you are testing. They will keep your lists of tests below
   very readable, and will also help you to avoid repeating code. You will also
   find it helpful to create [~printer] functions for the data types in use. *)

let index_tests =
  [ index_test "index of A is 0" 'A' 0 ; index_test "index of B is 1" 'B' 1;
index_test "index of Y is 25" 'Y' 24;]

let mapRtoL_test (name: string) (wiring: string) (top_letter : char) (input_pos: int) 
  (expected_output : int) : test = name >:: fun _ ->
  assert_equal expected_output (map_r_to_l wiring top_letter input_pos) 
  ~printer:string_of_int
  
let map_rl_tests = [ mapRtoL_test "test basic logic, mapping a letter to itself"
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 'A' 0 0; 
  mapRtoL_test "test if wiring is different from identical" "EKMFLGDQVZNTOWYHXUSPAIBRCJ" 'A' 0 4;
  mapRtoL_test "Different wiring" "BACDEFGHIJKLMNOPQRSTUVWXYZ" 'A' 1 0;
  mapRtoL_test "test orientation" "BACDEFGHIJKLMNOPQRSTUVWXYZ" 'B' 25 0;
  mapRtoL_test "test orientation 2" "BACDEFGHIJKLMNOPQRSTUVWXYZ" 'C' 24 25;
  mapRtoL_test "Same as test 2, but with different offset" "EKMFLGDQVZNTOWYHXUSPAIBRCJ" 'B' 0 9;
  mapRtoL_test "wiring BDFHJLCPRTXVZNYEIWGAKMUSQO with offset 'O' and input 14 should output 17" "BDFHJLCPRTXVZNYEIWGAKMUSQO" 'O' 14 17;
  mapRtoL_test "wiring ZYXWVUTSRQPONMLKJIHGFEDCBA and offset 'C' and input 8 should output 13" "ZYXWVUTSRQPONMLKJIHGFEDCBA" 'P' 8 13;
  mapRtoL_test "CDXWVUGSRQPONMLKJIHTFEYZBA and offset 'F' and input 22 should ouput 24" "CDXWVUGSRQPONMLKJIHTFEYZBA" 'F' 22 24; 
  ]

  let mapLtoR_test (name: string) (wiring: string) (top_letter : char) (input_pos: int) 
  (expected_output : int) : test = name >:: fun _ ->
  assert_equal expected_output (map_l_to_r wiring top_letter input_pos) ~printer:string_of_int

let map_lr_tests = [ mapLtoR_test "test basic logic, mapping a letter to itself" "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 'A' 0 0; 
  mapLtoR_test "test if wiring is different from identical" "EKMFLGDQVZNTOWYHXUSPAIBRCJ" 'A' 0 20;
  mapLtoR_test "Different wiring" "BACDEFGHIJKLMNOPQRSTUVWXYZ" 'A' 1 0;
  mapLtoR_test "test orientation" "BACDEFGHIJKLMNOPQRSTUVWXYZ" 'B' 25 0;
  mapLtoR_test "test orientation 2" "BACDEFGHIJKLMNOPQRSTUVWXYZ" 'C' 24 25;
  mapLtoR_test "Same as test 2, but with different offset" "EKMFLGDQVZNTOWYHXUSPAIBRCJ" 'B' 0 21;
  mapLtoR_test "wiring EKMFLGDQVZNTOWYHXUSPAIBRCJ with offset 'F' and input 10 should output 14" "EKMFLGDQVZNTOWYHXUSPAIBRCJ" 'F' 10 14;
  mapLtoR_test "wiring ZYXWVUTSRQPONMLKJIHGFEDCBA and offset 'C' and input 8 should output 13" "ZYXWVUTSRQPONMLKJIHGFEDCBA" 'C' 8 13 ;
  mapLtoR_test "CDXWVUGSRQPONMLKJIHTFEYZBA and offset 'F' and input 22 should ouput 19" "CDXWVUGSRQPONMLKJIHTFEYZBA" 'F' 22 19; ]


  let refl_test (name : string) (wiring: string) (input : int) (expected_output : int) : test =
    name >:: fun _ ->
    (* the [printer] tells OUnit how to convert the output to a string *)
    assert_equal expected_output (map_refl wiring input) ~printer:string_of_int

let map_refl_tests = [ refl_test "identical wiring" "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 0 0 ;
  refl_test "wiring YRUHQSLDPXNGOKMIEBFZCWVJAT with input 24 (A) should match to 0" "YRUHQSLDPXNGOKMIEBFZCWVJAT" 24 0;
  refl_test "wiring YRUHQSLDPXNGOKMIEBFZCWVJAT with input 0 (Y) should match to 24" "YRUHQSLDPXNGOKMIEBFZCWVJAT" 0 24;
  refl_test "wiring FVPJIAOYEDRZXWGCTKUQSBNMHL with input 3 (J) should match to 9" "FVPJIAOYEDRZXWGCTKUQSBNMHL" 3 9;]

let plug_test  (name: string) (plugs : (char * char) list) (c : char) (expected_output: char) : test = 
  name >:: fun _ ->
  (* the [printer] tells OUnit how to convert the output to a string *)
  assert_equal expected_output (map_plug plugs c) 


let map_plug_tests = [ plug_test "empty plug" [] 'A' 'A';
  plug_test "plug with one tuple that has this char as the 1st element" [('A', 
    'B')] 'A' 'B';
  plug_test "plug with one tuple that has this char as the 2nd element" [('B', 
    'A')] 'A' 'B';
  plug_test "plug with multiple tuples that has this char" [('A', 'C'); ('B', 
    'D'); ('X', 'Z')] 'D' 'B';
  plug_test "plug with tuples that don't have this char" [('A', 'C'); ('B', 
    'D'); ('X', 'Z')] 'K' 'K';
  plug_test "plug with 13 tuples (largest size)" [('A', 'F'); ('B', 'V'); ('P', 
    'C'); ('D', 'J'); ('E', 'I'); ('G', 'O'); ('H', 'Y'); ('K', 'R'); ('L', 
    'Z'); ('M', 'X'); ('N', 'W'); ('Q', 'T'); ('S', 'U')] 'N' 'W']

let char_to_string (input:char): string = String.make 1 input

let cipher_test  (name: string) (config: config) (input : char) (expected_output: char) : test = 
  name >:: fun _ ->
  (* the [printer] tells OUnit how to convert the output to a string *)
  assert_equal expected_output (cipher_char config input) ~printer: char_to_string


let cipher_char_tests = [ 

    cipher_test "basic config, identical" 
    {refl="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; rotors = []; plugboard = []} 'A' 'A';

    cipher_test "1rotor with no offset, no refl, no plug" 
      {refl="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; rotors=[{rotor = 
      {wiring="EKMFLGDQVZNTOWYHXUSPAIBRCJ"; turnover='A'}; top_letter = 'A'}];
      plugboard = []} 'A' 'A';

    cipher_test "1rotor with 'B' offset, no refl, no plug" 
      {refl="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; rotors=[{rotor = 
      {wiring="EKMFLGDQVZNTOWYHXUSPAIBRCJ"; turnover='A'}; top_letter = 'B'}];
      plugboard = []} 'A' 'A';

    cipher_test "1rotor with no offset, has refl, no plug" 
      {refl="YRUHQSLDPXNGOKMIEBFZCWVJAT"; rotors=[{rotor = 
      {wiring="EKMFLGDQVZNTOWYHXUSPAIBRCJ"; turnover='A'}; top_letter = 'A'}];
      plugboard = []} 'L' 'J';

    cipher_test "1rotor with 'B' offset, has refl, no plug"
      {refl="YRUHQSLDPXNGOKMIEBFZCWVJAT"; rotors=[{rotor = 
      {wiring="EKMFLGDQVZNTOWYHXUSPAIBRCJ"; turnover='A'}; top_letter = 'B'}];
      plugboard = []} 'K' 'E';

    cipher_test ">1 identical rotor with no offset, no refl, no plug"
      {refl="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; rotors=[{rotor = 
      {wiring="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; turnover='A'}; top_letter = 'A'};
      {rotor = {wiring="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; turnover='A'}; top_letter  
      = 'A'}];plugboard = []} 'S' 'S';

    cipher_test ">1 not identical rotor with some offset, no refl, no plug"
      {refl="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; rotors=[{rotor = 
      {wiring="EKMFLGDQVZNTOWYHXUSPAIBRCJ"; turnover='A'}; top_letter = 'J'};
      {rotor = {wiring="FVPJIAOYEDRZXWGCTKUQSBNMHL"; turnover='A'}; top_letter 
      = 'J'}];plugboard = []} 'X' 'X';

    cipher_test ">1 (not identical) rotor with some offset, has refl, no plug"
      {refl="YRUHQSLDPXNGOKMIEBFZCWVJAT"; rotors=[{rotor = 
      {wiring="EKMFLGDQVZNTOWYHXUSPAIBRCJ"; turnover='A'}; top_letter = 'B'};
      {rotor = {wiring="FVPJIAOYEDRZXWGCTKUQSBNMHL"; turnover='A'}; top_letter = 
      'K'}];plugboard = []} 'A' 'S';

    cipher_test "basic config, identical, with plug" 
    {refl="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; rotors = []; plugboard = ['A', 'C']} 'A' 'A';

    cipher_test ">1 identical rotor with no offset, no refl, with plug and 1 plug transformation"
      {refl="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; rotors=[{rotor = 
      {wiring="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; turnover='A'}; top_letter = 'A'};
      {rotor = {wiring="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; turnover='A'}; top_letter = 
      'A'}];plugboard = [('S', 'T')]} 'S' 'S';

    cipher_test ">1 (not identical) rotor with some offset, has refl, with plug and 1 plug transformation"
      {refl="YRUHQSLDPXNGOKMIEBFZCWVJAT"; rotors=[{rotor = 
      {wiring="EKMFLGDQVZNTOWYHXUSPAIBRCJ"; turnover='A'}; top_letter = 'B'};
      {rotor = {wiring="FVPJIAOYEDRZXWGCTKUQSBNMHL"; turnover='A'}; top_letter 
      = 'K'}];plugboard = [('A', 'X')]} 'A' 'P';

    cipher_test ">1 (not identical) rotor with some offset, has refl, with >1 plugs and 2 plug transformations"
      {refl="YRUHQSLDPXNGOKMIEBFZCWVJAT"; rotors=[{rotor = 
      {wiring="EKMFLGDQVZNTOWYHXUSPAIBRCJ"; turnover='A'}; top_letter = 'B'};
      {rotor = {wiring="FVPJIAOYEDRZXWGCTKUQSBNMHL"; turnover='A'}; top_letter 
      = 'K'}];plugboard = [('A', 'X'); ('D', 'K'); ('B', 'N')]} 'K' 'N';

    cipher_test ">1 (not identical) rotor with some offset, has refl, with >1 plugs and 0 plug transformations"
      {refl="YRUHQSLDPXNGOKMIEBFZCWVJAT"; rotors=[{rotor = 
      {wiring="EKMFLGDQVZNTOWYHXUSPAIBRCJ"; turnover='A'}; top_letter = 'B'};
      {rotor = {wiring="FVPJIAOYEDRZXWGCTKUQSBNMHL"; turnover='A'}; top_letter 
      = 'K'}];plugboard = [('A', 'X'); ('D', 'K'); ('B', 'N')]} 'O' 'L';

 ]
let step_tests = [ (* TODO: add your tests here *) ]
let cipher_tests = [ (* TODO: add your tests here *) ]

let tests =
  "test suite for A1"
  >::: List.flatten
         [
           index_tests;
           map_rl_tests;
           map_lr_tests;
           map_refl_tests;
           map_plug_tests;
           cipher_char_tests;
           step_tests;
           cipher_tests;
         ]

let _ = run_test_tt_main tests
