Greetings from Team 4.3!

Our project is a debt recorder that includes a backend system,
 a complicated algorithm, and a simple frontend in terminal.

This debt recorder lets you input events that involve payment 
that needs to split between multiple event-participants while 
the actual payer is only one person. It then optimizes the number 
of transactions needed to clear the debt among all participants in 
all input events, and outputs a string specifying who needs to 
transfer how much to who and who's total debt is what. Feel free to 
execute the main.ml file in bin/ to try out our project! 

We have also left some very complicated (real-world) debt relationships 
to test our program. If you check out the test_LARGE1 and test_g3 cases 
in test/main.ml, those are two large cases based on the two clubs I'm in 
(CME and Cornell Jingyuan Drama). These are real transactions! After 
optimization, it becomes very simple. 

This project is over 1600 including the test cases. However, 
it may seem that the LOC division between test file and main function 
file is disproportionate. Here's our explanation to this:
1. Our project idea, which is fully illustrated in the document we've written 
  before MS1 and showcased to our PM and PG, was already permitted as a 
  very valid project to do (actually we like it and (possibly) our PG and PM 
  also liked it). We have accomplished ALL the functionalities said in that 
  document using codes in function.ml and main.ml. It's still not that many 
  lines of code, but it did take us enough effort to do it (I think each of us 
  spent at least 15 hours into doing it) - because our project is heavily dependent 
  on one algorithm, which is hard to implement but easy to look at. This algorithm 
  is called Optimizer in our Function.ml . It is a greedy algorithm that optimizes 
  debt relationship; we spent most of our effort implementing and debugging this one. 
2. Given all the new types and functions that only convert new type to new type, 
  just writing one test case gives us many lines of code. Moreover, our optimizer 
  demands MANY test cases to fully test out its function - many bugs were found, 
  actually, through the "Large and Complicated" test cases we wrote that we ourselves 
  didn't know what we were testing - they were just large and complicated, so that 
  many well-hidden bugs could be triggered out. 
Given all these, we think our project is heavily algo-based and test-dependent 