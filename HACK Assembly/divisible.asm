/*
*
* function  is_divisible(int a, int b)
* purpose:  check if a is divisible by b
* params:   
*   R0: int a -- divident
*   R1: int b -- divisor
* return:
*   R0: 1 if divisible, otherwise 0 
* 
*/

(IS_DIVISIBLE)

    // Default return False
    @R2
    M=0

    // Load original R0 value
    @R0
    D=M

    // While D >= 0: D = D - R1
    (LOOP)
    @END_LOOP
    D;JLT
        //if D=0 return 1
        (IF_ZER)
        @END_IF
        D;JNE
            @R2
            M=1
            @RETURN
            0;JMP
        (END_IF)

        // Load next value
        @R1
        D=D-M
        @LOOP
        0;JMP
    (END_LOOP)

    // Return R2
    (RETURN)
    @R2
    D=M
    @R0
    M=D

    (HALT)
    @HALT
    0;JMP

    