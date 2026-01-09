@MAIN
0;JMP

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
    @lr
    A=M
    0;JMP

(MAIN)
    @2
    D=A
    @i
    M=D

    // Save R0
    @R0
    D=M
    @n
    M=D

    // Default to is_prime = true
    @R3
    M=1

    // While i < n
    (PRIME_LOOP)
    @i
    D=M
    @n
    D=D-M
    @END_PRIME_LOOP
    D;JGE
        // n -> R0
        @n
        D=M
        @R0
        M=D

        // i -> R1
        @i
        D=M
        @R1
        M=D

        // Save return to procedure
        @jt1
        D=A
        @lr
        M=D

        // R0 <- is_divisible(n, i)
        @IS_DIVISIBLE
        0;JMP
        (jt1)

        //if is_divisible(n, i) return 0
        (IF_IS_DIV)
        @R0
        D=M
        @END_IF_IS_DIV
        D;JEQ
            @R3
            M=0
            @PRIME_RET
            0;JMP
        (END_IF_IS_DIV)

        //increment i
        @i
        M=M+1

        @PRIME_LOOP
        0;JMP
    (END_PRIME_LOOP)

    //Return value in R3
    (PRIME_RET)
    @R3
    D=M
    @R0
    M=D

    // Enter Halt state
    (HALT)
    @HALT
    0;JMP
    