Project structure
-----------------
-----------------

Project(NGTrobot)
-------------------------------------------------------------------------------------------
||
|--output       :: stores logs and report
|--Resource     :: contains keyword implementations in most generic form
|--TestSuit     :: contains testases and can be segregated based on the testcase types
|--Variable     :: contains variables like url,creds and xpaths
|--runtest.py   :: Run starts here
--------------------------------------------------------------------------------------------

How to Run tests:
1. Running test from test file.
   ex : python runtest.py FunctionalTest.robot
2. Running test from tags.txt
   ex : python runtest.py tags.txt FunctionalTest.robot
   [selected testcases can be run using tag,tags.txt provide option to enable multiple tests by tag name]


