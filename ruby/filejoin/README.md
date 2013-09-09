# FileJoin

* The program accepts as arguments a list of one or more file paths (e.g. ./solution.rb file1.csv file2.csv ...).
* The program also accepts input on stdin (e.g. cat file1.csv | ./solution.rb).
* The program accepts as input (from files or stdin) an arbitrary number of lines. Each line contains an integer user ID and an integer user age, delimited by a comma.
* The program outputs a list of tuples, where each tuple contains a distinct age and the count of users with that age, delimited by a comma.
* The program is capable of processing large files and runs as fast as possible.

###Tools
File I/O
StdIn
File Generator
Benchmark
Hash

##Approach
1. [X] create test files
1. [X] load files at initialize
1. [X] load files from stdin @ initialize
1. [X] process files into a hash: key => age, value => count
1. [ ] output the hash in a string friendly format
1. [ ] build benchmark and test
1. [ ] repeat with jruby
1. [ ] test with benchmark
