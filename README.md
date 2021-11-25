# Insurance Referee Assignment Problem
## Steps to run the code (referee.lp):
#### Step1: install the Clingo on either macOS or Windows via ​https://github.com/zhunyoung/clingoTutorial (This instruction is demonstrating under MacOS)
#### Step2: Put the source code (referee.lp) at the same directory with input instances.
#### Step3: Open the Terminal and go to the directory has source code and instances.
#### Step4: On the Terminal run the following command line by line to get the result for each input instance individually.
## Commands: 
#### clingo referee.lp instance1.asp 0
#### clingo referee.lp instance2.asp 0
#### clingo referee.lp instance3.asp 0
#### clingo referee.lp instance4.asp 0
#### clingo referee.lp instance5.asp 0
##### Note: After running each command line above, the Clingo will generate 5 results individually depend oneach input instance
## The Output of all instance tested with the code:
#### Instance Number Command Line Output of Clingo
#### clingo referee.lp instance1.asp 0^

```
clingo version 5.4.
Reading from referee.lp ...
referee.lp:12:27-30: info: global variable in tuple of aggregate
element:
Rid
referee.lp:40:43-46: info: global variable in tuple of aggregate
element:
Rid
referee.lp:55:52-55: info: global variable in tuple of aggregate
element:
Rid
Solving...
Answer: 1
assign(4,5)
Optimization: 185
OPTIMUM FOUND
Models : 1
Optimum : yes
Optimization : 185
Calls : 1
Time : 0.006s (Solving: 0.00s 1st Model: 0.00s Unsat:
0.00s)
CPU Time : 0.006s
```
## clingo referee.lp instance2.asp 0^

```
clingo version 5.4.
Reading from referee.lp ...
referee.lp:12:27-30: info: global variable in tuple of aggregate
element:
Rid
referee.lp:40:43-46: info: global variable in tuple of aggregate
```

```
element:
Rid
referee.lp:55:52-55: info: global variable in tuple of aggregate
element:
Rid
Solving...
Answer: 1
assign(5,7)
Optimization: 4260
OPTIMUM FOUND
Models : 1
Optimum : yes
Optimization : 4260
Calls : 1
Time : 0.008s (Solving: 0.00s 1st Model: 0.00s Unsat:
0.00s)
CPU Time : 0.007s
```
## clingo referee.lp instance3.asp 0^

```
clingo version 5.4.
Reading from referee.lp ...
referee.lp:12:27-30: info: global variable in tuple of aggregate
element:
Rid
referee.lp:40:43-46: info: global variable in tuple of aggregate
element:
Rid
referee.lp:55:52-55: info: global variable in tuple of aggregate
element:
Rid
Solving...
Answer: 1
assign(6,11)
Optimization: 2486
OPTIMUM FOUND
Models : 1
Optimum : yes
Optimization : 2486
Calls : 1
Time : 0.007s (Solving: 0.00s 1st Model: 0.00s Unsat:
0.00s)
CPU Time : 0.007s
```
## clingo referee.lp instance4.asp 0^

```
clingo version 5.4.
Reading from referee.lp ...
referee.lp:12:27-30: info: global variable in tuple of aggregate
element:
Rid
referee.lp:40:43-46: info: global variable in tuple of aggregate
element:
Rid
referee.lp:55:52-55: info: global variable in tuple of aggregate
element:
Rid
Solving...
Answer: 1
assign(7,13)
Optimization: 5794
Answer: 2
assign(7,14)
Optimization: 5494
OPTIMUM FOUND
```

```
Models : 2
Optimum : yes
Optimization : 5494
Calls : 1
Time : 0.008s (Solving: 0.00s 1st Model: 0.00s Unsat:
0.00s)
CPU Time : 0.007s
```
## clingo referee.lp instance5.asp 0^

```
clingo version 5.4.
Reading from referee.lp ...
referee.lp:12:27-30: info: global variable in tuple of aggregate
element:
Rid
referee.lp:40:43-46: info: global variable in tuple of aggregate
element:
Rid
referee.lp:55:52-55: info: global variable in tuple of aggregate
element:
Rid
Solving...
Answer: 1
assign(8,18)
Optimization: 715
Answer: 2
assign(8,17)
Optimization: 714
OPTIMUM FOUND
Models : 2
Optimum : yes
Optimization : 714
Calls : 1
Time : 0.007s (Solving: 0.00s 1st Model: 0.00s Unsat:
0.00s)
CPU Time : 0.006s
```

