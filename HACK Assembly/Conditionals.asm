// Load R0 into D
@0
D=M

// Compare D to 5
@5
D=D-A

//if R0 > 5: store 10 in R1
(IF)
@ELSE
D;JLE
    @10
    D=A
    @1
    M=D
    @END_IF
    0;JMP

//Else: load 67 into R1
(ELSE)
    @67
    D=A
    @1
    M=D

(END_IF)

// Maybe there's more code...

(HALT)
@HALT
0;JMP



