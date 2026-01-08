// Add RAM[0] + RAM[1]
// Store the result in RAM[2]

// To run, place the values to add into
// the first two slots in RAM.

@0
D=M
@1
D=D+M
@2
M=D

// End the program
(HALT)
@HALT
0;JMP