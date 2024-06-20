# EXAMPLE USAGE OF SIGMATHLY FUNCTIONS IN ARM ASSEMBLY

@ Arithmetic Progression Class (AP.o)

.data
    @ Define the function arguments
    firstTerm:   .double 1.0
    commonDifference:   .double 2.0
    numTerms:   .int 10

.text
.global _start

_start:
    @ Call the 'Arithmetic' function
    ldr r0, =numTerms        @ Prepare the arguments
    ldr d0, =commonDifference
    ldr d1, =firstTerm
    bl Arithmetic            @ Call the 'Arithmetic' function

    @ Call the 'ArithmeticSum' function
    ldr r0, =numTerms        @ Prepare the arguments
    ldr d0, =commonDifference
    ldr d1, =firstTerm
    bl ArithmeticSum         @ Call the 'ArithmeticSum' function

    @ Call the 'NthTerm' function
    mov r0, #5               @ Prepare the arguments
    ldr d0, =commonDifference
    ldr d1, =firstTerm
    bl NthTerm                @ Call the 'NthTerm' function

    @ Call the 'TermNumber' function (version 1)
    ldr d0, =commonDifference @ Prepare the arguments
    ldr d1, =firstTerm
    ldr d2, =numTerms
    bl TermNumber            @ Call the 'TermNumber' function

    @ Call the 'TermNumber' function (version 2)
    mov r0, #5               @ Prepare the arguments
    ldr d0, =commonDifference
    ldr d1, =firstTerm
    bl TermNumber            @ Call the 'TermNumber' function

    @ Call the 'CommonDifference' function
    ldr d0, =commonDifference @ Prepare the arguments
    ldr d1, =firstTerm
    ldr r0, =numTerms
    bl CommonDifference      @ Call the 'CommonDifference' function

    @ Call the 'FirstTerm' function
    mov r0, #5               @ Prepare the arguments
    ldr d0, =commonDifference
    ldr d1, =firstTerm
    bl FirstTerm             @ Call the 'FirstTerm' function

    @ Call the 'LastTerm' function
    mov r0, #5               @ Prepare the arguments
    ldr d0, =commonDifference
    ldr d1, =firstTerm
    bl LastTerm              @ Call the 'LastTerm' function

    @ Exit the program
    mov r7, #1
    mov r0, #0
    swi 0x0

Arithmetic:
    @ Replace the code for the 'Arithmetic' function here
    bx lr

ArithmeticSum:
    @ Replace the code for the 'ArithmeticSum' function here
    bx lr

NthTerm:
    @ Replace the code for the 'NthTerm' function here
    bx lr

TermNumber:
    @ Replace the code for the 'TermNumber' function here
    bx lr

CommonDifference:
    @ Replace the code for the 'CommonDifference' function here
    bx lr

FirstTerm:
    @ Replace the code for the 'FirstTerm' function here
    bx lr

LastTerm:
    @ Replace the code for the 'LastTerm' function here
    bx lr


@ Calculus Class (CALCULUS.o)


.data
    @ Define the function arguments
    f:          .double 0.0
    x:          .double 1.0
    a:          .double 0.0
    b:          .double 2.0
    n:          .int 100
    index:      .int 0
    h:          .double 1e-6
    epsilon:    .double 1e-6

.text
.global _start

_start:
    @ Call the 'Derivative' function
    sub sp, sp, #8           @ Allocate space for the return value
    fld d0, [x]              @ Load 'x' onto the FPU stack
    push {r0}                @ Push the function pointer onto the stack
    bl Derivative            @ Call the 'Derivative' function
    add sp, sp, #12          @ Clean up the stack

    @ Call the 'Integral' function
    sub sp, sp, #8           @ Allocate space for the return value
    push {r1}                @ Push 'n' onto the stack
    fld d1, [b]              @ Load 'b' onto the FPU stack
    fld d0, [a]              @ Load 'a' onto the FPU stack
    push {r0}                @ Push the function pointer onto the stack
    bl Integral              @ Call the 'Integral' function
    add sp, sp, #20          @ Clean up the stack

    @ Call the 'Limit' function
    sub sp, sp, #8           @ Allocate space for the return value
    fld d0, [x]              @ Load 'x' onto the FPU stack
    push {r1}                @ Push the function pointer 'g' onto the stack
    push {r0}                @ Push the function pointer 'f' onto the stack
    bl Limit                 @ Call the 'Limit' function
    add sp, sp, #16          @ Clean up the stack

    @ Call the 'FindRoot' function
    sub sp, sp, #8           @ Allocate space for the return value
    push {r2, r3}            @ Push 'epsilon' onto the stack
    fld d1, [b]              @ Load 'b' onto the FPU stack
    fld d0, [a]              @ Load 'a' onto the FPU stack
    push {r0}                @ Push the function pointer onto the stack
    bl FindRoot              @ Call the 'FindRoot' function
    add sp, sp, #20          @ Clean up the stack

    @ Call the 'PartialDerivative' function
    sub sp, sp, #8           @ Allocate space for the return value
    fld d1, [h]              @ Load 'h' onto the FPU stack
    push {r1}                @ Push 'index' onto the stack
    push {r0}                @ Push the function pointer onto the stack
    bl PartialDerivative     @ Call the 'PartialDerivative' function
    add sp, sp, #12          @ Clean up the stack

    @ Call the 'Gradient' function
    sub sp, sp, #8           @ Allocate space for the return value
    fld d0, [h]              @ Load 'h' onto the FPU stack
    push {r0}                @ Push the function pointer onto the stack
    bl Gradient              @ Call the 'Gradient' function
    add sp, sp, #12          @ Clean up the stack

    @ Call the 'Hessian' function
    sub sp, sp, #8           @ Allocate space for the return value
    fld d0, [h]              @ Load 'h' onto the FPU stack
    push {r0}                @ Push the function pointer onto the stack
    bl Hessian               @ Call the 'Hessian' function
    add sp, sp, #12          @ Clean up the stack

    @ Call the 'FindCriticalPoints' function
    sub sp, sp, #8           @ Allocate space for the return value
    push {r2, r3}            @ Push 'epsilon' onto the stack
    fld d1, [b]              @ Load 'b' onto the FPU stack
    fld d0, [a]              @ Load 'a' onto the FPU stack
    push {r0}                @ Push the function pointer onto the stack
    bl FindCriticalPoints    @ Call the 'FindCriticalPoints' function
    add sp, sp, #20          @ Clean up the stack

    @ Call the 'RiemannSum' function
    sub sp, sp, #8           @ Allocate space for the return value
    push {r1}                @ Push 'type' onto the stack
    push {r2, r3}            @ Push 'n' onto the stack
    fld d1, [b]              @ Load 'b' onto the FPU stack
    fld d0, [a]              @ Load 'a' onto the FPU stack
    push {r0}                @ Push the function pointer onto the stack
    bl RiemannSum            @ Call the 'RiemannSum' function
    add sp, sp, #24          @ Clean up the stack

    @ Call the 'DefiniteIntegral' function
    sub sp, sp, #8           @ Allocate space for the return value
    push {r1}                @ Push 'n' onto the stack
    fld d1, [b]              @ Load 'b' onto the FPU stack
    fld d0, [a]              @ Load 'a' onto the FPU stack
    push {r0}                @ Push the function pointer onto the stack
    bl DefiniteIntegral      @ Call the 'DefiniteIntegral' function
    add sp, sp, #20          @ Clean up the stack

    @ Exit the program
    mov r7, #1
    mov r0, #0
    swi 0x0

Derivative:
    @ Replace the code for the 'Derivative' function here
    bx lr

Integral:
    @ Replace the code for the 'Integral' function here
    bx lr

Limit:
    @ Replace the code for the 'Limit' function here
    bx lr

FindRoot:
    @ Replace the code for the 'FindRoot' function here
    bx lr

PartialDerivative:
    @ Replace the code for the 'PartialDerivative' function here
    bx lr

Gradient:
    @ Replace the code for the 'Gradient' function here
    bx lr

Hessian:
    @ Replace the code for the 'Hessian' function here
    bx lr

FindCriticalPoints:
    @ Replace the code for the 'FindCriticalPoints' function here
    bx lr

RiemannSum:
    @ Replace the code for the 'RiemannSum' function here
    bx lr

DefiniteIntegral:
    @ Replace the code for the 'DefiniteIntegral' function here
    bx lr


@ Calculus Class Equations Section (EQUATIONS.o)


.data
    @ Function pointers
    func_ptr:       .quad 0
    func_ptr_vector: .quad 0

    @ Function arguments
    arg_x:      .double 0
    arg_a:      .double 0
    arg_b:      .double 0
    arg_n:      .int 0
    arg_index:  .int 0
    arg_h:      .double 0
    arg_epsilon: .double 0

    @ Other variables
    result: .double 0

.text
.global _start

_start:
    @ Call the 'Derivative' function
    fld d0, [arg_x]              @ Load 'x' onto the FPU stack
    ldr r0, =_ZNSt8functionIFdEEd
    str r0, [func_ptr]           @ Set the function pointer
    sub sp, sp, #8               @ Allocate space for the return value
    ldr r0, [func_ptr]           @ Load the function pointer into R0
    str r0, [sp, #4]             @ Push the function pointer onto the stack
    bl _ZNKSt8functionIFddEEd    @ Call the function
    add sp, sp, #12              @ Clean up the stack
    fstp d0, [result]            @ Store the result

    @ Call the 'Integral' function
    fld d1, [arg_b]              @ Load 'b' onto the FPU stack
    fld d0, [arg_a]              @ Load 'a' onto the FPU stack
    ldr r0, =_ZNSt8functionIFddEEd
    str r0, [func_ptr]           @ Set the function pointer
    sub sp, sp, #8               @ Allocate space for the return value
    ldr r0, =arg_n               @ Load the address of 'n' into R0
    ldr r0, [r0]                 @ Load 'n' into R0
    str r0, [sp, #4]             @ Push 'n' onto the stack
    ldr r0, [func_ptr]           @ Load the function pointer into R0
    str r0, [sp]                 @ Push the function pointer onto the stack
    bl _ZNSt8functionIFddEEd     @ Call the function
    add sp, sp, #12              @ Clean up the stack
    fstp d0, [result]            @ Store the result

    @ Call the 'Limit' function
    fld d0, [arg_x]              @ Load 'x' onto the FPU stack
    ldr r0, =_ZNSt8functionIFddEEd
    str r0, [func_ptr]           @ Set the function pointer
    sub sp, sp, #8               @ Allocate space for the return value
    ldr r0, =func_ptr            @ Load the address of the numerator function pointer into R0
    ldr r1, =func_ptr            @ Load the address of the denominator function pointer into R1
    ldr r0, [r0]                 @ Load the numerator function pointer into R0
    str r0, [sp, #4]             @ Push the numerator function pointer onto the stack
    ldr r1, [r1]                 @ Load the denominator function pointer into R1
    str r1, [sp]                 @ Push the denominator function pointer onto the stack
    ldr r0, [func_ptr]           @ Load the function pointer into R0
    str r0, [sp, #8]             @ Push the function pointer onto the stack
    bl _ZNKSt8functionIFddEEd    @ Call the function
    add sp, sp, #12              @ Clean up the stack
    fstp d0, [result]            @ Store the result

    @ Call the 'FindRoot' function
    fld d1, [arg_epsilon]        @ Load 'epsilon' onto the FPU stack
    fld d0, [arg_b]              @ Load 'b' onto the FPU stack
    fld d1, [arg_a]              @ Load 'a' onto the FPU stack
    ldr r0, =_ZNSt8functionIFdEEd
    str r0, [func_ptr]           @ Set the function pointer
    sub sp, sp, #16              @ Allocate space for the return value
    ldr r0, =func_ptr            @ Load the address of the function pointer into R0
    ldr r0, [r0]                 @ Load the function pointer into R0
    str r0, [sp, #4]             @ Push the function pointer onto the stack
    bl _ZNSt8functionIFdEEd      @ Call the function
    add sp, sp, #16              @ Clean up the stack
    fstp d0, [result]            @ Store the result

    @ Call the 'PartialDerivative' function
    ldr r0, =_ZNSt8functionIFddEEd
    str r0, [func_ptr_vector]    @ Set the function pointer
    fld d1, [arg_h]              @ Load 'h' onto the FPU stack
    ldr r0, =arg_index           @ Load the address of 'index' into R0
    ldr r0, [r0]                 @ Load 'index' into R0
    str r0, [sp, #4]             @ Push 'index' onto the stack
    ldr r0, =func_ptr_vector     @ Load the address of the function pointer into R0
    ldr r0, [r0]                 @ Load the function pointer into R0
    str r0, [sp]                 @ Push the function pointer onto the stack
    bl _ZNSt6vectorIdSaIdEEC1ERKS2_  @ Construct the vector
    add sp, sp, #16              @ Clean up the stack
    push {r0, r1, r2, r3, r4, r5, r6, r7}   @ Save all general-purpose registers
    mov r7, r0                   @ Store the vector in R7 for later use
    pop {r0, r1, r2, r3, r4, r5, r6, r7}    @ Restore all general-purpose registers
    str r0, [sp, #4]             @ Push the vector address onto the stack
    ldr r0, =_ZNKSt6vectorIdSaIdEEixEj  @ Load the address of the 'PartialDerivative' function
    blx r0                       @ Call the 'PartialDerivative' function
    add sp, sp, #4               @ Clean up the stack
    fstp d0, [result]            @ Store the result

    @ Call the 'Gradient' function
    ldr r0, =_ZNSt8functionIFddEEd
    str r0, [func_ptr_vector]    @ Set the function pointer
    fld d0, [arg_h]              @ Load 'h' onto the FPU stack
    ldr r0, =func_ptr_vector     @ Load the address of the function pointer into R0
    ldr r0, [r0]                 @ Load the function pointer into R0
    str r0, [sp]                 @ Push the function pointer onto the stack
    bl _ZNSt6vectorIdSaIdEEC1ERKS2_  @ Construct the vector
    add sp, sp, #8               @ Clean up the stack
    push {r0, r1, r2, r3, r4, r5, r6, r7}   @ Save all general-purpose registers
    mov r7, r0                   @ Store the vector in R7 for later use
    pop {r0, r1, r2, r3, r4, r5, r6, r7}    @ Restore all general-purpose registers
    str r0, [sp, #4]             @ Push the vector address onto the stack
    ldr r0, =_ZNKSt6vectorIdSaIdEEixEj  @ Load the address of the 'Gradient' function
    blx r0                       @ Call the 'Gradient' function
    add sp, sp, #4               @ Clean up the stack
    fstp d0, [result]            @ Store the result

    @ Call the 'Hessian' function
    ldr r0, =_ZNSt8functionIFddEEd
    str r0, [func_ptr_vector]    @ Set the function pointer
    fld d0, [arg_h]              @ Load 'h' onto the FPU stack
    ldr r0, =func_ptr_vector     @ Load the address of the function pointer into R0
    ldr r0, [r0]                 @ Load the function pointer into R0
    str r0, [sp]                 @ Push the function pointer onto the stack
    bl _ZNSt6vectorIdSaIdEEC1ERKS2_  @ Construct the vector
    add sp, sp, #8               @ Clean up the stack
    push {r0, r1, r2, r3, r4, r5, r6, r7}   @ Save all general-purpose registers
    mov r7, r0                   @ Store the vector in R7 for later use
    pop {r0, r1, r2, r3, r4, r5, r6, r7}    @ Restore all general-purpose registers
    str r0, [sp, #4]             @ Push the vector address onto the stack
    ldr r0, =_ZNKSt6vectorIdSaIdEEixEj  @ Load the address of the 'Hessian' function
    blx r0                       @ Call the 'Hessian' function
    add sp, sp, #4               @ Clean up the stack
    fstp d0, [result]            @ Store the result

    @ Call the 'FindCriticalPoints' function
    fld d1, [arg_epsilon]        @ Load 'epsilon' onto the FPU stack
    fld d0, [arg_b]              @ Load 'b' onto the FPU stack
    fld d1, [arg_a]              @ Load 'a' onto the FPU stack
    ldr r0, =_ZNSt8functionIFdEEd
    str r0, [func_ptr]           @ Set the function pointer
    sub sp, sp, #16              @ Allocate space for the return value
    ldr r0, =func_ptr            @ Load the address of the function pointer into R0
    ldr r0, [r0]                 @ Load the function pointer into R0
    str r0, [sp, #4]             @ Push the function pointer onto the stack
    bl _ZNSt8functionIFdEEd      @ Call the function
    add sp, sp, #16              @ Clean up the stack
    fstp d0, [result]            @ Store the result

    @ Call the 'RiemannSum' function
    ldr r0, =arg_n               @ Load the address of 'n' into R0
    ldr r0, [r0]                 @ Load 'n' into R0
    str r0, [sp]                 @ Push 'n' onto the stack
    fld d1, [arg_b]              @ Load 'b' onto the FPU stack
    fld d0, [arg_a]              @ Load 'a' onto the FPU stack
    ldr r0, =_ZNSt8functionIFdEEd
    str r0, [func_ptr]           @ Set the function pointer
    sub sp, sp, #16              @ Allocate space for the return value
    ldr r0, =func_ptr            @ Load the address of the function pointer into R0
    ldr r0, [r0]                 @ Load the function pointer into R0
    str r0, [sp, #4]             @ Push the function pointer onto the stack
    bl _ZNSt8functionIFdEEd      @ Call the function
    add sp, sp, #16              @ Clean up the stack
    fstp d0, [result]            @ Store the result

    @ Call the 'DefiniteIntegral' function
    fld d1, [arg_b]              @ Load 'b' onto the FPU stack
    fld d0, [arg_a]              @ Load 'a' onto the FPU stack
    ldr r0, =_ZNSt8functionIFdEEd
    str r0, [func_ptr]           @ Set the function pointer
    sub sp, sp, #12              @ Allocate space for the return value
    ldr r0, =func_ptr            @ Load the address of the function pointer into R0
    ldr r0, [r0]                 @ Load the function pointer into R0
    str r0, [sp, #4]             @ Push the function pointer onto the stack
    bl _ZNSt8functionIFdEEd      @ Call the function
    add sp, sp, #12              @ Clean up the stack
    fstp d0, [result]            @ Store the result

    @ Exit the program
    mov r7, #1                   @ Exit system call number
    mov r0, #0                   @ Exit status
    svc #0                        @ Perform system call

.bss
    resb 8                       @ Reserve space for the result


@ Matrix Class (MATRIX.o)


.data
    @ Declare the function prototypes
    .extern Sigmath_Matrix_Add  @ Add(const Matrix& a, const Matrix& b)
    .extern printf              @ or any other functions you may need

    .text
    .global _start

_start:
    @ Create matrices a and b
    @ ...

    @ Call the Add function
    push {r0, r1}              @ Save the registers that will be used
    ldr r1, b                  @ Load the address of the second matrix b into R1
    ldr r0, a                  @ Load the address of the first matrix a into R0
    bl Sigmath_Matrix_Add      @ Call the Add function
    pop {r0, r1}               @ Restore the registers
    mov r3, r0                 @ Store the result in R3 (assuming the result is an integer)

    @ Display the result
    push {r3}                  @ Push the result onto the stack
    ldr r0, =format            @ Load the address of the format string into R0
    bl printf                  @ Call the printf function
    add sp, sp, #4             @ Clean up the stack after the function call

    @ Exit the program
    mov r7, #1                 @ Exit system call number
    mov r0, #0                 @ Exit status
    svc #0                      @ Perform system call

.data
format: .asciz "%d"            @ Format string for printf

.bss
    @ Define variables or reserve space as needed
    @ ...



@ Basic Class (BASIC.o)


.data
    @ Declare the function prototypes
    .extern Sigmath_Basic_Add   @ double Add(const std::initializer_list<double>& numbers)
    .extern printf              @ or any other functions you may need

    .text
    .global _start

_start:
    @ Call the Add function
    ldr r0, =numbers            @ Load the address of the initializer list into R0
    bl Sigmath_Basic_Add        @ Call the Add function
    mov sp, sp, #-8             @ Reserve space for the floating-point result
    str d0, [sp]                @ Store the floating-point result onto the reserved space

    @ Display the result
    ldr r0, =format             @ Load the address of the format string into R0
    ldr r1, [sp]                @ Load the floating-point result into R1
    bl printf                   @ Call the printf function
    add sp, sp, #8              @ Clean up the stack after the function call

    @ Exit the program
    mov r7, #1                  @ Exit system call number
    mov r0, #0                  @ Exit status
    svc #0                      @ Perform system call

.data
format: .asciz "%lf\n"          @ Format string for printf

.data
numbers: .double 1.0, 2.0, 3.0, 4.0, 5.0, 6.0   @ Example initializer list

.bss
    @ Define variables or reserve space as needed
    @ ...



@ Complex Class (complex.o)


.data
    @ Declare the function prototypes
    .extern Sigmath_Compl_Abs       @ double Abs(const Complex& a)
    .extern printf                  @ or any other functions you may need

    .text
    .global _start

_start:
    @ Create a complex number
    mov r0, #3.5                   @ Set the real part of the complex number in R0
    mov r1, #4.2                   @ Set the imaginary part of the complex number in R1
    sub sp, sp, #16                @ Allocate space on the stack for the Complex structure
    str r0, [sp]                   @ Store the real part on the stack
    str r1, [sp, #8]               @ Store the imaginary part on the stack

    @ Call the Abs function
    mov r0, sp                     @ Pass the address of the Complex structure in R0
    bl Sigmath_Compl_Abs           @ Call the Abs function
    add sp, sp, #16                @ Clean up the stack after the function call

    @ Store the result in a floating-point register (e.g., D0)
    vldr d0, [sp]

    @ Display the result
    ldr r0, =format                @ Load the address of the format string into R0
    vmov r1, d0                    @ Move the value from D0 to R1
    bl printf                      @ Call the printf function

    @ Exit the program
    mov r7, #1                     @ Exit system call number
    mov r0, #0                     @ Exit status
    svc #0                         @ Perform system call

.data
format: .asciz "%lf\n"             @ Format string for printf

.bss
    @ Define variables or reserve space as needed
    @ ...


@ Computing Class (COMPUTING.o)


.data
    @ Declare the function prototypes
    .extern Sigmath_Computing_Floor     @ int Floor(double x)
    .extern Sigmath_Computing_Ceil      @ int Ceil(double x)
    .extern Sigmath_Computing_Round     @ int Round(double x)
    .extern printf                      @ or any other functions you may need

    .text
    .global _start

_start:
    @ Call the Floor function
    vmov d0, #4.8                       @ Set the input value in D0
    bl Sigmath_Computing_Floor          @ Call the Floor function
    mov r0, r0                          @ Result is already in R0

    @ Display the result
    push {r0}                           @ Push the result onto the stack
    ldr r0, =format                     @ Load the address of the format string into R0
    bl printf                           @ Call the printf function
    add sp, sp, #4                      @ Clean up the stack after the function call

    @ Call the Ceil function
    vmov d0, #-2.3                      @ Set the input value in D0
    bl Sigmath_Computing_Ceil           @ Call the Ceil function
    mov r0, r0                          @ Result is already in R0

    @ Display the result
    push {r0}                           @ Push the result onto the stack
    ldr r0, =format                     @ Load the address of the format string into R0
    bl printf                           @ Call the printf function
    add sp, sp, #4                      @ Clean up the stack after the function call

    @ Call the Round function
    vmov d0, #3.7                       @ Set the input value in D0
    bl Sigmath_Computing_Round          @ Call the Round function
    mov r0, r0                          @ Result is already in R0

    @ Display the result
    push {r0}                           @ Push the result onto the stack
    ldr r0, =format                     @ Load the address of the format string into R0
    bl printf                           @ Call the printf function
    add sp, sp, #4                      @ Clean up the stack after the function call

    @ Exit the program
    mov r7, #1                          @ Exit system call number
    mov r0, #0                          @ Exit status
    svc #0                              @ Perform system call

.data
format: .asciz "%d\n"                   @ Format string for printf

.bss
    @ Define variables or reserve space as needed
    @ ...


@ Nums Class (NUMSG.o)


.data
    @ Declare the function prototypes
    .extern Sigmath_Nums_Gcd   @ int Gcd(int a, int b)
    .extern Sigmath_Nums_Lcm   @ int Lcm(int a, int b)
    .extern Sigmath_Nums_Mod   @ int Mod(int a, int b)
    .extern printf             @ or any other functions you may need

    .text
    .global _start

_start:
    @ Call the Gcd function
    mov r0, #10                @ Set the first input value (a) in R0
    mov r1, #15                @ Set the second input value (b) in R1
    bl Sigmath_Nums_Gcd        @ Call the Gcd function
    mov r2, r0                 @ Result is in R0, move it to R2

    @ Display the result
    push {r2}                  @ Push the result onto the stack
    ldr r0, =format            @ Load the address of the format string into R0
    bl printf                  @ Call the printf function
    add sp, sp, #4             @ Clean up the stack after the function call

    @ Call the Lcm function
    mov r0, #10                @ Set the first input value (a) in R0
    mov r1, #15                @ Set the second input value (b) in R1
    bl Sigmath_Nums_Lcm        @ Call the Lcm function
    mov r2, r0                 @ Result is in R0, move it to R2

    @ Display the result
    push {r2}                  @ Push the result onto the stack
    ldr r0, =format            @ Load the address of the format string into R0
    bl printf                  @ Call the printf function
    add sp, sp, #4             @ Clean up the stack after the function call

    @ Call the Mod function
    mov r0, #17                @ Set the first input value (a) in R0
    mov r1, #5                 @ Set the second input value (b) in R1
    bl Sigmath_Nums_Mod        @ Call the Mod function
    mov r2, r0                 @ Result is in R0, move it to R2

    @ Display the result
    push {r2}                  @ Push the result onto the stack
    ldr r0, =format            @ Load the address of the format string into R0
    bl printf                  @ Call the printf function
    add sp, sp, #4             @ Clean up the stack after the function call

    @ Exit the program
    mov r7, #1                 @ Use the sys_exit system call
    mov r0, #0                 @ Return value: 0
    svc #0                     @ Perform the system call

.data
format: .asciz "%d\n"          @ Format string for printf

.bss
    @ Define variables or reserve space as needed
    @ ...



@ Sets Class (sets.o)


.data
    @ Declare the function prototypes
    .extern Sigmath_Sets_Union               @ std::vector<T> Union(const std::vector<T>& set1, const std::vector<T>& set2)
    .extern Sigmath_Sets_Intersection        @ std::vector<T> Intersection(const std::vector<T>& set1, const std::vector<T>& set2)
    .extern Sigmath_Sets_Difference          @ std::vector<T> Difference(const std::vector<T>& set1, const std::vector<T>& set2)
    .extern Sigmath_Sets_SymmetricDifference @ std::vector<T> SymmetricDifference(const std::vector<T>& set1, const std::vector<T>& set2)
    .extern Sigmath_Sets_IsSubset            @ bool IsSubset(const std::vector<T>& subset, const std::vector<T>& set)
    .extern Sigmath_Sets_IsSuperset          @ bool IsSuperset(const std::vector<T>& superset, const std::vector<T>& set)
    .extern printf                           @ or any other functions you may need

    .text
    .global _start

_start:
    @ Set up the first vector
    ldr r1, =set1                @ Address of the first vector in R1
    ldr r2, =set1_length         @ Length of the first vector in R2
    ldr r3, =set1_end            @ Address of the end of the first vector in R3
    sub r3, r1, r3               @ Calculate the size of the first vector
    push {r3}                    @ Push the size of the first vector onto the stack
    push {r1}                    @ Push the address of the first vector onto the stack

    @ Set up the second vector
    ldr r1, =set2                @ Address of the second vector in R1
    ldr r2, =set2_length         @ Length of the second vector in R2
    ldr r3, =set2_end            @ Address of the end of the second vector in R3
    sub r3, r1, r3               @ Calculate the size of the second vector
    push {r3}                    @ Push the size of the second vector onto the stack
    push {r1}                    @ Push the address of the second vector onto the stack

    @ Call the Union function
    bl Sigmath_Sets_Union
    add sp, sp, #8               @ Clean up the stack after the function call

    @ Store the returned vector size in a register (e.g., r0)
    mov r0, r0                   @ Result size is returned in R0

    @ Display the result
    push {r0}                    @ Push the result size onto the stack
    ldr r0, =format              @ Load the address of the format string into R0
    bl printf                    @ Call the printf function
    add sp, sp, #4               @ Clean up the stack after the function call

    @ Call the Intersection function
    bl Sigmath_Sets_Intersection
    add sp, sp, #8               @ Clean up the stack after the function call

    @ Call the Difference function
    bl Sigmath_Sets_Difference
    add sp, sp, #8               @ Clean up the stack after the function call

    @ Call the SymmetricDifference function
    bl Sigmath_Sets_SymmetricDifference
    add sp, sp, #8               @ Clean up the stack after the function call

    @ Call the IsSubset function
    bl Sigmath_Sets_IsSubset
    add sp, sp, #8               @ Clean up the stack after the function call

    @ Call the IsSuperset function
    bl Sigmath_Sets_IsSuperset
    add sp, sp, #8               @ Clean up the stack after the function call

    @ Exit the program
    mov r7, #1                   @ Use the sys_exit system call
    mov r0, #0                   @ Return value: 0
    svc #0                       @ Perform the system call

.data
format: .asciz "Result size: %d\n"  @ Format string for printf

.bss
    set1: .space 8              @ Reserve space for the first vector
    set1_end:                     @ End address of the first vector
    set2: .space 8              @ Reserve space for the second vector
    set2_end:                     @ End address of the second vector

.data
    set1_length: .word 4        @ Length of the first vector
    set2_length: .word 4        @ Length of the second vector



@ Civil Class (CIVIL.o)


.data
    @ Declare the function prototypes
    .extern Sigmath_Civil_CalculateBeamDeflection  @ double CalculateBeamDeflection(double length, double load, double elasticity, double momentOfInertia)
    .extern Sigmath_Civil_CalculateStress          @ double CalculateStress(double force, double area)
    .extern Sigmath_Civil_CalculateStrain          @ double CalculateStrain(double initialLength, double finalLength, double initialDiameter)
    .extern Sigmath_Civil_CalculateYoungsModulus   @ double CalculateYoungsModulus(double stress, double strain)
    .extern printf                                 @ or any other functions you may need

    .text
    .global _start

_start:
    @ Set up the parameters
    ldr d0, =length          @ d0 = length
    vldr d0, [d0]            @ Load the value of length into d0

    ldr d1, =load            @ d1 = load
    vldr d1, [d1]            @ Load the value of load into d1

    ldr d2, =elasticity      @ d2 = elasticity
    vldr d2, [d2]            @ Load the value of elasticity into d2

    ldr d3, =momentOfInertia @ d3 = momentOfInertia
    vldr d3, [d3]            @ Load the value of momentOfInertia into d3

    @ Call the CalculateBeamDeflection function
    bl Sigmath_Civil_CalculateBeamDeflection
    add sp, sp, #16          @ Clean up the stack after the function call

    @ Store the returned value in a register (e.g., d4)
    vmov d4, d0              @ Result is returned in d0

    @ Display the result
    ldr r0, =format          @ Load the address of the format string into r0
    vldr d0, =0.0            @ Load 0.0 into d0 (for %f format)
    vcvt.f64.f32 d0, d4      @ Convert the result from double to float
    bl printf                @ Call printf to print the result
    add sp, sp, #4           @ Clean up the stack after the function call

    @ Set up the parameters
    ldr d0, =force           @ d0 = force
    vldr d0, [d0]            @ Load the value of force into d0

    ldr d1, =area            @ d1 = area
    vldr d1, [d1]            @ Load the value of area into d1

    @ Call the CalculateStress function
    bl Sigmath_Civil_CalculateStress
    add sp, sp, #16          @ Clean up the stack after the function call

    @ Set up the parameters
    ldr d0, =initialLength   @ d0 = initialLength
    vldr d0, [d0]            @ Load the value of initialLength into d0

    ldr d1, =finalLength     @ d1 = finalLength
    vldr d1, [d1]            @ Load the value of finalLength into d1

    ldr d2, =initialDiameter @ d2 = initialDiameter
    vldr d2, [d2]            @ Load the value of initialDiameter into d2

    @ Call the CalculateStrain function
    bl Sigmath_Civil_CalculateStrain
    add sp, sp, #24          @ Clean up the stack after the function call

    @ Store the returned value in a register (e.g., d5)
    vmov d5, d0              @ Result is returned in d0

    @ Set up the parameters
    vmov d0, d4              @ d0 = beam deflection
    vmov d1, d5              @ d1 = strain

    @ Call the CalculateYoungsModulus function
    bl Sigmath_Civil_CalculateYoungsModulus
    add sp, sp, #16          @ Clean up the stack after the function call

    @ Exit the program
    mov r7, #1               @ Use the sys_exit system call
    mov r0, #0               @ Return value: 0
    svc #0                   @ Perform the system call

.data
format: .asciz "Result: %f\n"  @ Format string for printf

.bss
    length: .double 0.0       @ Reserve space for length (64-bit)
    load: .double 0.0         @ Reserve space for load (64-bit)
    elasticity: .double 0.0   @ Reserve space for elasticity (64-bit)
    momentOfInertia: .double 0.0 @ Reserve space for momentOfInertia (64-bit)
    force: .double 0.0        @ Reserve space for force (64-bit)
    area: .double 0.0         @ Reserve space for area (64-bit)
    initialLength: .double 0.0 @ Reserve space for initialLength (64-bit)
    finalLength: .double 0.0   @ Reserve space for finalLength (64-bit)
    initialDiameter: .double 0.0 @ Reserve space for initialDiameter (64-bit)



@ Electrical Class (ELECTRICAL.o)


.data
    @ Declare the function prototypes
    .extern Sigmath_Electrical_CalculateResistance                
    .extern Sigmath_Electrical_CalculateBasicPower               
    .extern Sigmath_Electrical_CalculateCapacitance              
    .extern Sigmath_Electrical_CalculateInductance               
    .extern Sigmath_Electrical_CalculateImpedance                
    .extern Sigmath_Electrical_CalculateReactance                
    .extern Sigmath_Electrical_CalculateResonantFrequency        
    .extern Sigmath_Electrical_CalculateBasicPowererFactor       
    .extern Sigmath_Electrical_CalculateRMS                      
    .extern Sigmath_Electrical_CalculateTotalResistanceInSeries  
    .extern Sigmath_Electrical_CalculateTotalResistanceInParallel
    .extern Sigmath_Electrical_CalculateTotalCapacitanceInSeries 
    .extern Sigmath_Electrical_CalculateTotalCapacitanceInParallel
    .extern Sigmath_Electrical_CalculateTotalInductanceInSeries  
    .extern Sigmath_Electrical_CalculateTotalInductanceInParallel
    .extern printf                                               

.text
.global _start

_start:
    @ Set up the parameters
    ldr d0, =voltage           @ d0 = voltage
    vldr d0, [d0]              @ Load the value of voltage into d0

    ldr d1, =current           @ d1 = current
    vldr d1, [d1]              @ Load the value of current into d1

    @ Call the CalculateResistance function
    bl Sigmath_Electrical_CalculateResistance
    add sp, sp, #16            @ Clean up the stack after the function call

    @ Store the returned value in a register (e.g., d4)
    vmov d4, d0                @ Result is returned in d0

    @ Display the result
    ldr r0, =format            @ Load the address of the format string into r0
    vldr d0, =0.0              @ Load 0.0 into d0 (for %f format)
    vcvt.f64.f32 d0, d4        @ Convert the result from double to float
    bl printf                  @ Call printf to print the result
    add sp, sp, #4             @ Clean up the stack after the function call

    @ Continue with calling other functions and displaying the results

    @ Exit the program
    mov r7, #1                 @ Use the sys_exit system call
    mov r0, #0                 @ Return value: 0
    svc #0                     @ Perform the system call

.data
format: .asciz "Result: %f\n"  @ Format string for printf

.bss
    voltage: .double 0.0       @ Reserve space for voltage (64-bit)
    current: .double 0.0       @ Reserve space for current (64-bit)



@ Kinematics Class (KINEMATICS.o)


.data
    @ Declare the function prototypes
    .extern Sigmath_Kinematics_CalculateDisplacement         
    .extern Sigmath_Kinematics_CalculateFinalVelocity        
    .extern Sigmath_Kinematics_CalculateTime                 
    .extern Sigmath_Kinematics_CalculateProjectileRange      
    .extern printf                                           

.text
.global _start

_start:
    @ Set up the parameters
    ldr d0, =initialVelocity    @ d0 = initialVelocity
    vldr d0, [d0]               @ Load the value of initialVelocity into d0

    ldr d1, =finalVelocity      @ d1 = finalVelocity
    vldr d1, [d1]               @ Load the value of finalVelocity into d1

    ldr d2, =acceleration       @ d2 = acceleration
    vldr d2, [d2]               @ Load the value of acceleration into d2

    ldr d3, =time               @ d3 = time
    vldr d3, [d3]               @ Load the value of time into d3

    @ Call the CalculateDisplacement function
    bl Sigmath_Kinematics_CalculateDisplacement
    add sp, sp, #32             @ Clean up the stack after the function call

    @ Store the returned value in a register (e.g., d4)
    vmov d4, d0                 @ Result is returned in d0

    @ Display the result
    ldr r0, =format             @ Load the address of the format string into r0
    vldr d0, =0.0               @ Load 0.0 into d0 (for %f format)
    vcvt.f64.f32 d0, d4         @ Convert the result from double to float
    bl printf                   @ Call printf to print the result
    add sp, sp, #4              @ Clean up the stack after the function call

    @ Continue with calling other functions and displaying the results

    @ Exit the program
    mov r7, #1                  @ Use the sys_exit system call
    mov r0, #0                  @ Return 0 status
    svc #0                      @ Perform the system call

.data
format: .asciz "Result: %f\n"  @ Format string for printf

.bss
    initialVelocity: .double 0.0        @ Reserve space for initialVelocity (64-bit)
    finalVelocity: .double 0.0          @ Reserve space for finalVelocity (64-bit)
    acceleration: .double 0.0           @ Reserve space for acceleration (64-bit)
    time: .double 0.0                   @ Reserve space for time (64-bit)


@ Mechanical Class (MECHANICAL.o)


.data
    @ Declare the function prototypes
    .extern Sigmath_Mechanical_CalculateTorque        
    .extern Sigmath_Mechanical_CalculatePower         
    .extern Sigmath_Mechanical_CalculateVelocity      
    .extern Sigmath_Mechanical_CalculateAcceleration  
    .extern Sigmath_Mechanical_CalculateForce         
    .extern printf                                   

.text
.global _start

_start:
    @ Set up the parameters
    ldr d0, =force            @ d0 = force
    vldr d0, [d0]             @ Load the value of force into d0

    ldr d1, =radius           @ d1 = radius
    vldr d1, [d1]             @ Load the value of radius into d1

    @ Call the CalculateTorque function
    bl Sigmath_Mechanical_CalculateTorque
    add sp, sp, #16           @ Clean up the stack after the function call

    @ Store the returned value in a register (e.g., d2)
    vmov d2, d0               @ Result is returned in d0

    @ Display the result
    ldr r0, =format           @ Load the address of the format string into r0
    vldr d0, =0.0             @ Load 0.0 into d0 (for %f format)
    vcvt.f64.f32 d0, d2       @ Convert the result from double to float
    bl printf                 @ Call printf to print the result
    add sp, sp, #4            @ Clean up the stack after the function call

    @ Continue with calling other functions and displaying the results

    @ Exit the program
    mov r7, #1                @ Use the sys_exit system call
    mov r0, #0                @ Return 0 status
    svc #0                    @ Perform the system call

.data
format: .asciz "Result: %f\n"  @ Format string for printf

.bss
    force: .double 0.0         @ Reserve space for force (64-bit)
    radius: .double 0.0        @ Reserve space for radius (64-bit)


@ Equify Class (EQUIFY.o)


.data
    expression: .asciz "3 + 4 * 2 - ( 1 + 2 ) ^ 2"

.text
.extern evaluateExpression
.global main

main:
    @ Set up the stack frame
    push {fp, lr}
    mov fp, sp

    @ Save any necessary registers
    @ (No additional registers to save)

    @ Pass the argument to the function
    ldr r0, =expression
    bl evaluateExpression

    @ Retrieve the return value
    @ The return value is in the VFP register d0
    vmov.f64 d0, d0

    @ Clean up the stack
    add sp, sp, #4

    @ Restore any saved registers
    @ (No additional registers to restore)

    @ Clean up the stack frame
    pop {fp, pc}

    @ Exit the program
    mov r7, #1      @ Use the sys_exit system call
    mov r0, #0      @ Return 0 status
    svc #0          @ Perform the system call


@ Geometry Class (GEOMETRY.o)


.data
    radius: .float 2.5
    width: .float 4.0
    height: .float 5.0
    base: .float 3.0
    triangle_height: .float 2.5
    side1: .float 4.0
    side2: .float 3.0
    side3: .float 5.0
    x1: .float 1.0
    y1: .float 2.0
    x2: .float 3.0
    y2: .float 4.0
    x3: .float 1.0
    y3: .float 2.0
    z1: .float 3.0
    z2: .float 4.0
    z3: .float 5.0
    slope1: .float 1.0
    slope2: .float 2.0
    result1: .double 0.0
    result2: .double 0.0
    result3: .double 0.0
    result4: .double 0.0
    result5: .double 0.0
    result6: .double 0.0
    result7: .double 0.0
    result8: .double 0.0
    result9: .double 0.0
    result10: .double 0.0
    result11: .double 0.0

.text
.extern CircleArea
.extern CirclePerimeter
.extern RectangleArea
.extern RectanglePerimeter
.extern TriangleArea
.extern TrianglePerimeter
.extern DistanceBetweenPoints2D
.extern DistanceBetweenPoints3D
.extern AngleBetweenLines
.extern AngleBetweenVectors2D
.extern AngleBetweenVectors3D
.global main

main:
    @ Set up the stack frame
    push {fp, lr}
    mov fp, sp

    @ Save any necessary registers
    @ (No additional registers to save)

    @ Call CircleArea
    ldr s0, =radius
    bl CircleArea
    str d0, [result1]

    @ Call CirclePerimeter
    ldr s0, =radius
    bl CirclePerimeter
    str d0, [result2]

    @ Call RectangleArea
    ldr s0, =width
    ldr s1, =height
    bl RectangleArea
    str d0, [result3]

    @ Call RectanglePerimeter
    ldr s0, =width
    ldr s1, =height
    bl RectanglePerimeter
    str d0, [result4]

    @ Call TriangleArea
    ldr s0, =base
    ldr s1, =triangle_height
    bl TriangleArea
    str d0, [result5]

    @ Call TrianglePerimeter
    ldr s0, =side1
    ldr s1, =side2
    ldr s2, =side3
    bl TrianglePerimeter
    str d0, [result6]

    @ Call DistanceBetweenPoints2D
    ldr s0, =x1
    ldr s1, =y1
    ldr s2, =x2
    ldr s3, =y2
    bl DistanceBetweenPoints2D
    str d0, [result7]

    @ Call DistanceBetweenPoints3D
    ldr s0, =x1
    ldr s1, =y1
    ldr s2, =z1
    ldr s3, =x2
    ldr s4, =y2
    ldr s5, =z2
    bl DistanceBetweenPoints3D
    str d0, [result8]

    @ Call AngleBetweenLines
    ldr s0, =slope1
    ldr s1, =slope2
    bl AngleBetweenLines
    str d0, [result9]

    @ Call AngleBetweenVectors2D
    ldr s0, =x1
    ldr s1, =y1
    ldr s2, =x2
    ldr s3, =y2
    bl AngleBetweenVectors2D
    str d0, [result10]

    @ Call AngleBetweenVectors3D
    ldr s0, =x1
    ldr s1, =y1
    ldr s2, =z1
    ldr s3, =x2
    ldr s4, =y2
    ldr s5, =z2
    bl AngleBetweenVectors3D
    str d0, [result11]

    @ Restore any saved registers
    @ (No additional registers to restore)

    @ Clean up the stack frame
    pop {fp, pc}


@ Logarithm Class (LOGARITHM.o)


.data
    x: .float 2.0
    n: .float 3.0
    result1: .double 0.0
    result2: .double 0.0
    result3: .double 0.0
    error_message: .asciz "Invalid argument: x must be positive"

.text
.extern Log
.extern Log10
.extern Logn
.global main

main:
    @ Set up the stack frame
    push {fp, lr}
    mov fp, sp

    @ Save any necessary registers
    @ (No additional registers to save)

    @ Check if x is positive
    ldr s0, =x
    vldr d0, [s0]
    fldd d1, [result1]
    vcmpd d0, d1
    vmrs APSR_nzcv, fpscr
    bmi error_occurred

    @ Call Log
    vldr d0, [x]
    bl Log
    vstr d0, [result1]

    @ Call Log10
    vldr d0, [x]
    bl Log10
    vstr d0, [result2]

    @ Call Logn
    vldr d0, [n]
    vldr d1, [x]
    bl Logn
    vstr d0, [result3]

    @ Restore any saved registers
    @ (No additional registers to restore)

    @ Clean up the stack frame
    pop {fp, pc}

error_occurred:
    @ Print error message
    ldr r0, =error_message
    bl printf

    @ Exit the program with an error code
    mov r0, #1
    mov r7, #1
    swi 0


@ Polynomial Class (POLYNOMIAL.o)


.data
coefficients:   .double 2.0, -3.0, 1.0   ; Example coefficients for the polynomial
x:              .float 1.5               ; Example value of x
result1:        .double 0.0              ; Placeholder for Evaluate result
result2:        .double 0.0              ; Placeholder for Divide result
result3:        .double 0.0              ; Placeholder for Derivative result

.text
.extern std::vector<double>::size
.extern std::vector<double>::operator[]
.extern std::reverse
.extern Sigmath::Polynomial::Evaluate
.extern Sigmath::Polynomial::Divide
.extern Sigmath::Derivative
.global main

main:
    @ Set up the stack frame
    push {fp, lr}
    mov fp, sp

    @ Save any necessary registers
    @ (No additional registers to save)

    @ Call Evaluate
    ldr r0, =coefficients
    ldr r1, [r0, #std::vector<double>::size]
    ldr r2, =x
    vldr d0, [r2]
    push {r1}
    subs r1, r1, #1
    mov r3, r1
    lsl r1, r1, #3
    sub r0, r0, r1
    add r0, r0, #std::vector<double>::operator[]
    bl Sigmath::Polynomial::Evaluate
    vstr d0, [result1]

    @ Call Divide
    ldr r0, =coefficients
    ldr r1, [r0, #std::vector<double>::size]
    subs r1, r1, #1
    push {r1}
    push {r3}
    sub r0, r0, r3
    add r0, r0, #std::vector<double>::operator[]
    bl Sigmath::Polynomial::Divide
    vstr d0, [result2]

    @ Call Derivative
    ldr r0, =coefficients
    ldr r1, [r0, #std::vector<double>::size]
    subs r1, r1, #1
    push {r1}
    sub r0, r0, r1
    add r0, r0, #std::vector<double>::operator[]
    bl Sigmath::Derivative
    vstr d0, [result3]

    @ Restore any saved registers
    @ (No additional registers to restore)

    @ Clean up the stack frame
    pop {fp, pc}


@ Random Class (RANDOM.o)


.data
minDouble:      .double 0.0      ; Minimum value for RandUniform
maxDouble:      .double 1.0      ; Maximum value for RandUniform
mean:           .double 0.0      ; Mean value for RandNormal
stdDev:         .double 1.0      ; Standard deviation for RandNormal
lambda:         .double 1.0      ; Lambda value for RandPoisson
result1:        .double 0.0      ; Placeholder for RandUniform result
result2:        .double 0.0      ; Placeholder for RandNormal result
result3:        .float 0         ; Placeholder for RandPoisson result

.text
.extern Sigmath::Rand::NextDouble
.extern Sigmath::Random::RandUniform
.extern Sigmath::Random::RandNormal
.extern Sigmath::Random::RandPoisson
.global main

main:
    @ Set up the stack frame
    push {fp, lr}
    mov fp, sp

    @ Save any necessary registers
    @ (No additional registers to save)

    @ Call NextDouble
    bl Sigmath::Rand::NextDouble
    vstr d0, [result1]

    @ Call RandUniform
    ldr r0, =minDouble
    vldr d0, [r0]
    ldr r0, =maxDouble
    vldr d1, [r0]
    bl Sigmath::Random::RandUniform
    vstr d0, [result2]

    @ Call RandNormal
    ldr r0, =mean
    vldr d0, [r0]
    ldr r0, =stdDev
    vldr d1, [r0]
    bl Sigmath::Random::RandNormal
    vstr d0, [result2]

    @ Call RandPoisson
    ldr r0, =lambda
    vldr d0, [r0]
    bl Sigmath::Random::RandPoisson
    vstr d0, [result3]

    @ Restore any saved registers
    @ (No additional registers to restore)

    @ Clean up the stack frame
    pop {fp, pc}


@ Time Class (TIME.o)


.data
timeStr:    .space 20      @ Placeholder for the time string
timeLen:    .equ 20        @ Length of the time string

.text
.extern Sigmath::Time::Now
.extern Sigmath::Time::ToString
.global main

main:
    @ Set up the stack frame
    push {fp, lr}
    mov fp, sp

    @ Save any necessary registers
    @ (No additional registers to save)

    @ Call Now
    bl Sigmath::Time::Now
    mov r4, r0      @ Store the result in r4

    @ Call ToString
    ldr r0, =timeStr
    ldr r1, =timeLen
    mov r2, r4      @ Move the result from Now to r2
    bl Sigmath::Time::ToString

    @ Print the time string
    ldr r0, =timeStr
    ldr r1, =timeLen
    mov r2, #1      @ File descriptor for stdout
    mov r7, #4      @ System call number for write
    swi 0           @ Call the kernel

    @ Restore any saved registers
    @ (No additional registers to restore)

    @ Clean up the stack frame
    pop {fp, pc}


@ Statgorithm Class (ALGORITHMS.o)


.data
    values:     .double 1.5, 2.3, 0.8, 1.2, 3.1   @ Example array of values
    valuesLen:  .equ    ($ - values) / 8   @ Length of the array

.text
    .extern Sigmath::Statgorithm::Skewness
    .extern Sigmath::Statgorithm::Kurtosis
    .extern Sigmath::Statgorithm::Covariance
    .extern Sigmath::Statgorithm::Percentile
    .extern Sigmath::Statgorithm::RemoveOutliers
    .global main

main:
    @ Set up the stack frame
    push    {fp, lr}
    mov     fp, sp

    @ Save any necessary registers
    @ (No additional registers to save)

    @ Call Skewness
    ldr     r0, =values   @ Load the address of the values array into r0
    ldr     r1, =valuesLen   @ Load the length of the values array into r1
    bl      Sigmath::Statgorithm::Skewness

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d1, d0   @ Move the result from the FPU register d0 to d1

    @ Call Kurtosis
    ldr     r0, =values   @ Load the address of the values array into r0
    ldr     r1, =valuesLen   @ Load the length of the values array into r1
    bl      Sigmath::Statgorithm::Kurtosis

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d2, d0   @ Move the result from the FPU register d0 to d2

    @ Call Covariance
    ldr     r0, =values   @ Load the address of the xValues array into r0
    ldr     r1, =values   @ Load the address of the yValues array into r1
    ldr     r2, =valuesLen   @ Load the length of the arrays into r2
    bl      Sigmath::Statgorithm::Covariance

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d3, d0   @ Move the result from the FPU register d0 to d3

    @ Call Percentile
    ldr     r0, =values   @ Load the address of the values array into r0
    mov     r1, #75      @ Load the percentile value (75) into r1
    bl      Sigmath::Statgorithm::Percentile

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d4, d0   @ Move the result from the FPU register d0 to d4

    @ Call RemoveOutliers
    ldr     r0, =values   @ Load the address of the values array into r0
    ldr     r1, =valuesLen   @ Load the length of the values array into r1
    bl      Sigmath::Statgorithm::RemoveOutliers

    @ The result is a new vector of values, which can be stored and processed as needed
    @ (Assuming it's returned in the same array)

    @ Restore any saved registers
    @ (No additional registers to restore)

    @ Clean up the stack frame
    pop     {fp, pc}


@ Statistics Class (STATS.o)


.data
    values:     .double 1.5, 2.3, 0.8, 1.2, 3.1   @ Example array of values
    valuesLen:  .equ    ($ - values) / 8   @ Length of the array

.text
    .extern Sigmath::Statistics::Mean
    .extern Sigmath::Statistics::Median
    .extern Sigmath::Statistics::Mode
    .extern Sigmath::Statistics::Variance
    .extern Sigmath::Statistics::StandardDeviation
    .extern Sigmath::Statistics::Correlation
    .global main

main:
    @ Set up the stack frame
    push    {fp, lr}
    mov     fp, sp

    @ Save any necessary registers
    @ (No additional registers to save)

    @ Call Mean
    ldr     r0, =values   @ Load the address of the values array into r0
    ldr     r1, =valuesLen   @ Load the length of the values array into r1
    bl      Sigmath::Statistics::Mean

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d1, d0   @ Move the result from the FPU register d0 to d1

    @ Call Median
    ldr     r0, =values   @ Load the address of the values array into r0
    ldr     r1, =valuesLen   @ Load the length of the values array into r1
    bl      Sigmath::Statistics::Median

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d2, d0   @ Move the result from the FPU register d0 to d2

    @ Call Mode
    ldr     r0, =values   @ Load the address of the values array into r0
    ldr     r1, =valuesLen   @ Load the length of the values array into r1
    bl      Sigmath::Statistics::Mode

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d3, d0   @ Move the result from the FPU register d0 to d3

    @ Call Variance
    ldr     r0, =values   @ Load the address of the values array into r0
    ldr     r1, =valuesLen   @ Load the length of the values array into r1
    bl      Sigmath::Statistics::Variance

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d4, d0   @ Move the result from the FPU register d0 to d4

    @ Call StandardDeviation
    ldr     r0, =values   @ Load the address of the values array into r0
    ldr     r1, =valuesLen   @ Load the length of the values array into r1
    bl      Sigmath::Statistics::StandardDeviation

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d5, d0   @ Move the result from the FPU register d0 to d5

    @ Call Correlation
    ldr     r0, =values   @ Load the address of the valuesX array into r0
    ldr     r1, =values   @ Load the address of the valuesY array into r1
    ldr     r2, =valuesLen   @ Load the length of the arrays into r2
    bl      Sigmath::Statistics::Correlation

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d6, d0   @ Move the result from the FPU register d0 to d6

    @ Clean up the stack
    add     sp, sp, #16   @ Clean up the stack (remove arguments)

    @ Clean up the stack frame
    pop     {fp, pc}      @ Restore the frame pointer and return



@ Trig Class (CONST.o)


.data
    x:     .double 1.5   @ Example value of x

.text
    .extern Sigmath::Trig::Sin
    .extern Sigmath::Trig::Cos
    .extern Sigmath::Trig::Tan
    .extern Sigmath::Trig::Asin
    .extern Sigmath::Trig::Acos
    .extern Sigmath::Trig::Atan
    .global main

main:
    @ Set up the stack frame
    push    {fp, lr}
    mov     fp, sp

    @ Save any necessary registers
    @ (No additional registers to save)

    @ Call Sin
    ldr     r0, =x   @ Load the address of x into r0
    vldr    d0, [r0]   @ Load the value of x from memory into d0
    bl      Sigmath::Trig::Sin

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d1, d0   @ Move the result from the FPU register d0 to d1

    @ Call Cos
    ldr     r0, =x   @ Load the address of x into r0
    vldr    d0, [r0]   @ Load the value of x from memory into d0
    bl      Sigmath::Trig::Cos

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d2, d0   @ Move the result from the FPU register d0 to d2

    @ Call Tan
    ldr     r0, =x   @ Load the address of x into r0
    vldr    d0, [r0]   @ Load the value of x from memory into d0
    bl      Sigmath::Trig::Tan

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d3, d0   @ Move the result from the FPU register d0 to d3

    @ Call Asin
    ldr     r0, =x   @ Load the address of x into r0
    vldr    d0, [r0]   @ Load the value of x from memory into d0
    bl      Sigmath::Trig::Asin

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d4, d0   @ Move the result from the FPU register d0 to d4

    @ Call Acos
    ldr     r0, =x   @ Load the address of x into r0
    vldr    d0, [r0]   @ Load the value of x from memory into d0
    bl      Sigmath::Trig::Acos

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d5, d0   @ Move the result from the FPU register d0 to d5

    @ Call Atan
    ldr     r0, =x   @ Load the address of x into r0
    vldr    d0, [r0]   @ Load the value of x from memory into d0
    bl      Sigmath::Trig::Atan

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov    d6, d0   @ Move the result from the FPU register d0 to d6

    @ Clean up the stack
    add     sp, sp, #8   @ Clean up the stack (remove the argument)

    @ Clean up the stack frame
    pop     {fp, pc}      @ Restore the frame pointer and return


@ Hyperbolic Class 


.data
    x:     .double 1.5   @ Example value of x

.text
    .extern Sigmath::Hyperbolic::Sinh
    .extern Sigmath::Hyperbolic::Cosh
    .extern Sigmath::Hyperbolic::Tanh
    .extern Sigmath::Hyperbolic::Sech
    .extern Sigmath::Hyperbolic::Csch
    .extern Sigmath::Hyperbolic::Coth
    .extern Sigmath::Hyperbolic::Asinh
    .extern Sigmath::Hyperbolic::Acosh
    .extern Sigmath::Hyperbolic::Atanh
    .extern Sigmath::Hyperbolic::Asech
    .extern Sigmath::Hyperbolic::Acsch
    .extern Sigmath::Hyperbolic::Acoth
    .global main

main:
    @ Set up the stack frame
    push {fp, lr}
    mov fp, sp

    @ Save any necessary registers
    @ (No additional registers to save)

    @ Call Sinh
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Sinh

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d1, d0   @ Move the result from the FPU register d0 to d1

    @ Call Cosh
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Cosh

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d2, d0   @ Move the result from the FPU register d0 to d2

    @ Call Tanh
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Tanh

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d3, d0   @ Move the result from the FPU register d0 to d3

    @ Call Sech
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Sech

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d4, d0   @ Move the result from the FPU register d0 to d4

    @ Call Csch
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Csch

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d5, d0   @ Move the result from the FPU register d0 to d5

    @ Call Coth
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Coth

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d6, d0   @ Move the result from the FPU register d0 to d6

    @ Call Asinh
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Asinh

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d7, d0   @ Move the result from the FPU register d0 to d7

    @ Call Acosh
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Acosh

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d8, d0   @ Move the result from the FPU register d0 to d8

    @ Call Atanh
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Atanh

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d9, d0   @ Move the result from the FPU register d0 to d9

    @ Call Asech
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Asech

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d10, d0   @ Move the result from the FPU register d0 to d10

    @ Call Acsch
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Acsch

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d11, d0   @ Move the result from the FPU register d0 to d11

    @ Call Acoth
    ldr r0, =x   @ Load the address of x into r0
    vldr d0, [r0]   @ Load the value of x from memory into d0
    bl Sigmath::Hyperbolic::Acoth

    @ The result is in the FPU register(s) depending on the calling convention
    @ Retrieve the result from the FPU register(s) into a general-purpose register
    vmov d12, d0   @ Move the result from the FPU register d0 to d12

    @ Clean up the stack
    add sp, sp, #8   @ Clean up the stack (remove the argument)

    @ Restore any saved registers
    @ (No additional registers to restore)

    @ Clean up the stack frame
    pop {fp, pc}      @ Restore the frame pointer and return

