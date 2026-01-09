// Compute R0 & R1
@R0
D=M
@R1
D=D&M

//if (R0 & R1) > 0
(IF)
@ELSE
D;JLE
    //R2 = R0 + R1
    @R0
    D=M
    @R1
    D=D+M
    @R2
    M=D

    @END_IF
    0;JMP

(ELSE)
    //R2 = R0 - R1
    @R0
    D=M
    @R1
    D=D-M
    @R2
    M=D

(END_IF)

// Enter Halt State
(HALT)
@HALT
0;JMP