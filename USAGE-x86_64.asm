; EXAMPLE USAGE OF SIGMATHLY FUNCTIONS IN x86_64 ASSEMBLY

; Arithmetic Progression Class (AP.o)


section .data
    ; Define the function arguments
    firstTerm dq 1.0
    commonDifference dq 2.0
    numTerms dd 10

section .text
    global _start

_start:
    ; Call the 'Arithmetic' function
    mov eax, dword [numTerms] ; Prepare the arguments
    movsd xmm0, qword [commonDifference]
    movsd xmm1, qword [firstTerm]
    sub esp, 12 ; Allocate space for the return value
    call _Z8Arithmeticdii ; Replace with the mangled name of the 'Arithmetic' function
    add esp, 12 ; Clean up the stack

    ; Call the 'ArithmeticSum' function
    mov eax, dword [numTerms] ; Prepare the arguments
    movsd xmm0, qword [commonDifference]
    movsd xmm1, qword [firstTerm]
    call _Z13ArithmeticSumdii ; Replace with the mangled name of the 'ArithmeticSum' function

    ; Call the 'NthTerm' function
    mov eax, 5 ; Prepare the arguments
    movsd xmm0, qword [commonDifference]
    movsd xmm1, qword [firstTerm]
    call _Z7NthTermid ; Replace with the mangled name of the 'NthTerm' function

    ; Call the 'TermNumber' function (version 1)
    movsd xmm0, qword [commonDifference] ; Prepare the arguments
    movsd xmm1, qword [firstTerm]
    movsd xmm2, qword [numTerms]
    call _Z10TermNumberddd ; Replace with the mangled name of the 'TermNumber' function

    ; Call the 'TermNumber' function (version 2)
    mov eax, 5 ; Prepare the arguments
    movsd xmm0, qword [commonDifference]
    movsd xmm1, qword [firstTerm]
    call _Z10TermNumberidi ; Replace with the mangled name of the 'TermNumber' function

    ; Call the 'CommonDifference' function
    movsd xmm0, qword [commonDifference] ; Prepare the arguments
    movsd xmm1, qword [firstTerm]
    mov eax, dword [numTerms]
    call _Z16CommonDifferenceddd ; Replace with the mangled name of the 'CommonDifference' function

    ; Call the 'FirstTerm' function
    mov eax, 5 ; Prepare the arguments
    movsd xmm0, qword [commonDifference]
    movsd xmm1, qword [firstTerm]
    call _Z9FirstTermidi ; Replace with the mangled name of the 'FirstTerm' function

    ; Call the 'LastTerm' function
    mov eax, 5 ; Prepare the arguments
    movsd xmm0, qword [commonDifference]
    movsd xmm1, qword [firstTerm]
    call _Z8LastTermidi ; Replace with the mangled name of the 'LastTerm' function

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80



; Calculus Class (CALCULUS.o)


section .data
    ; Define the function arguments
    f dq 0.0
    x dq 1.0
    a dq 0.0
    b dq 2.0
    n dd 100
    index dd 0
    h dq 1e-6
    epsilon dq 1e-6

section .text
    global _start

_start:
    ; Call the 'Derivative' function
    sub esp, 8 ; Allocate space for the return value
    fld qword [x] ; Load 'x' onto the FPU stack
    push dword [f] ; Push the function pointer onto the stack
    call _Z10DerivativeSt8functionIdEdd ; Replace with the mangled name of the 'Derivative' function
    add esp, 12 ; Clean up the stack

    ; Call the 'Integral' function
    sub esp, 8 ; Allocate space for the return value
    push dword [n] ; Push 'n' onto the stack
    fld qword [b] ; Load 'b' onto the FPU stack
    fld qword [a] ; Load 'a' onto the FPU stack
    push dword [f] ; Push the function pointer onto the stack
    call _Z8IntegralSt8functionIdEddd ; Replace with the mangled name of the 'Integral' function
    add esp, 20 ; Clean up the stack

    ; Call the 'Limit' function
    sub esp, 8 ; Allocate space for the return value
    fld qword [x] ; Load 'x' onto the FPU stack
    push dword [g] ; Push the function pointer 'g' onto the stack
    push dword [f] ; Push the function pointer 'f' onto the stack
    call _Z5LimitSt8functionIdES1_dd ; Replace with the mangled name of the 'Limit' function
    add esp, 16 ; Clean up the stack

    ; Call the 'FindRoot' function
    sub esp, 8 ; Allocate space for the return value
    push qword [epsilon] ; Push 'epsilon' onto the stack
    fld qword [b] ; Load 'b' onto the FPU stack
    fld qword [a] ; Load 'a' onto the FPU stack
    push dword [f] ; Push the function pointer onto the stack
    call _Z9FindRootSt8functionIdEddd ; Replace with the mangled name of the 'FindRoot' function
    add esp, 20 ; Clean up the stack

    ; Call the 'PartialDerivative' function
    sub esp, 8 ; Allocate space for the return value
    fld qword [h] ; Load 'h' onto the FPU stack
    push dword [index] ; Push 'index' onto the stack
    push dword [f] ; Push the function pointer onto the stack
    call _Z16PartialDerivativeSt8functionIdEid ; Replace with the mangled name of the 'PartialDerivative' function
    add esp, 12 ; Clean up the stack

    ; Call the 'Gradient' function
    sub esp, 8 ; Allocate space for the return value
    fld qword [h] ; Load 'h' onto the FPU stack
    push dword [f] ; Push the function pointer onto the stack
    call _Z8GradientSt8functionIdEd ; Replace with the mangled name of the 'Gradient' function
    add esp, 12 ; Clean up the stack

    ; Call the 'Hessian' function
    sub esp, 8 ; Allocate space for the return value
    fld qword [h] ; Load 'h' onto the FPU stack
    push dword [f] ; Push the function pointer onto the stack
    call _Z7HessianSt8functionIdEd ; Replace with the mangled name of the 'Hessian' function
    add esp, 12 ; Clean up the stack

    ; Call the 'FindCriticalPoints' function
    sub esp, 8 ; Allocate space for the return value
    push qword [epsilon] ; Push 'epsilon' onto the stack
    fld qword [b] ; Load 'b' onto the FPU stack
    fld qword [a] ; Load 'a' onto the FPU stack
    push dword [f] ; Push the function pointer onto the stack
    call _Z18FindCriticalPointsSt8functionIdEdd ; Replace with the mangled name of the 'FindCriticalPoints' function
    add esp, 20 ; Clean up the stack

    ; Call the 'RiemannSum' function
    sub esp, 8 ; Allocate space for the return value
    push dword [type] ; Push 'type' onto the stack
    push dword [n] ; Push 'n' onto the stack
    fld qword [b] ; Load 'b' onto the FPU stack
    fld qword [a] ; Load 'a' onto the FPU stack
    push dword [f] ; Push the function pointer onto the stack
    call _Z10RiemannSumSt8functionIdEdddd ; Replace with the mangled name of the 'RiemannSum' function
    add esp, 24 ; Clean up the stack

    ; Call the 'DefiniteIntegral' function
    sub esp, 8 ; Allocate space for the return value
    push dword [n] ; Push 'n' onto the stack
    fld qword [b] ; Load 'b' onto the FPU stack
    fld qword [a] ; Load 'a' onto the FPU stack
    push dword [f] ; Push the function pointer onto the stack
    call _Z16DefiniteIntegralSt8functionIdEddd ; Replace with the mangled name of the 'DefiniteIntegral' function
    add esp, 20 ; Clean up the stack

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80



; Calculus Class Equations Section (EQUATIONS.o)


section .data
    ; Function pointers
    func_ptr dq 0
    func_ptr_vector dq 0

    ; Function arguments
    arg_x dq 0
    arg_a dq 0
    arg_b dq 0
    arg_n dd 0
    arg_index dd 0
    arg_h dq 0
    arg_epsilon dq 0

    ; Other variables
    result dq 0

section .text
    extern _ZNSt8functionIFdEEd
    extern _ZNSt6vectorIdSaIdEEC1ERKS2_
    extern _ZNKSt6vectorIdSaIdEEixEj
    extern _ZNKSt8functionIFddEEd
    extern _ZNSt6vectorIdSaIdEEixEj
    extern _ZNSt6vectorIdSaIdEEC1EjRKd
    extern _ZNKSt6vectorIdSaIdEEixEj

    global _start

_start:
    ; Call the 'Derivative' function
    fld qword [arg_x] ; Load 'x' onto the FPU stack
    mov eax, offset _ZNSt8functionIFdEEd
    mov dword [func_ptr], eax ; Set the function pointer
    sub esp, 8 ; Allocate space for the return value
    push dword [func_ptr] ; Push the function pointer onto the stack
    call _ZNKSt8functionIFddEEd ; Call the function
    add esp, 12 ; Clean up the stack
    fstp qword [result] ; Store the result

    ; Call the 'Integral' function
    fld qword [arg_b] ; Load 'b' onto the FPU stack
    fld qword [arg_a] ; Load 'a' onto the FPU stack
    push dword [arg_n] ; Push 'n' onto the stack
    push dword [func_ptr] ; Push the function pointer onto the stack
    call _ZNSt8functionIFddEEd ; Call the function
    add esp, 12 ; Clean up the stack
    fstp qword [result] ; Store the result

    ; Call the 'Limit' function
    fld qword [arg_x] ; Load 'x' onto the FPU stack
    mov eax, offset _ZNSt8functionIFddEEd
    mov dword [func_ptr], eax ; Set the function pointer
    sub esp, 8 ; Allocate space for the return value
    push dword [func_ptr] ; Push the numerator function pointer onto the stack
    push dword [func_ptr] ; Push the denominator function pointer onto the stack
    call _ZNKSt8functionIFddEEd ; Call the function
    add esp, 12 ; Clean up the stack
    fstp qword [result] ; Store the result

    ; Call the 'FindRoot' function
    fld qword [arg_epsilon] ; Load 'epsilon' onto the FPU stack
    fld qword [arg_b] ; Load 'b' onto the FPU stack
    fld qword [arg_a] ; Load 'a' onto the FPU stack
    push dword [func_ptr] ; Push the function pointer onto the stack
    call _ZNSt8functionIFdEEd ; Call the function
    add esp, 16 ; Clean up the stack
    fstp qword [result] ; Store the result

    ; Call the 'PartialDerivative' function
    mov eax, offset _ZNSt8functionIFddEEd
    mov dword [func_ptr_vector], eax ; Set the function pointer
    push dword [arg_h] ; Push 'h' onto the stack
    push dword [arg_index] ; Push 'index' onto the stack
    push dword [func_ptr_vector] ; Push the function pointer onto the stack
    call _ZNSt6vectorIdSaIdEEC1ERKS2_ ; Construct the vector
    add esp, 16 ; Clean up the stack
    pushad ; Save all general-purpose registers
    mov edi, eax ; Store the vector in EDI for later use
    popad ; Restore all general-purpose registers
    push dword [edi] ; Push the vector address onto the stack
    call _ZNKSt6vectorIdSaIdEEixEj ; Call the 'PartialDerivative' function
    add esp, 4 ; Clean up the stack
    fstp qword [result] ; Store the result

    ; Call the 'Gradient' function
    mov eax, offset _ZNSt8functionIFddEEd
    mov dword [func_ptr_vector], eax ; Set the function pointer
    push dword [arg_h] ; Push 'h' onto the stack
    push dword [func_ptr_vector] ; Push the function pointer onto the stack
    call _ZNSt6vectorIdSaIdEEC1ERKS2_ ; Construct the vector
    add esp, 8 ; Clean up the stack
    pushad ; Save all general-purpose registers
    mov edi, eax ; Store the vector in EDI for later use
    popad ; Restore all general-purpose registers
    push dword [edi] ; Push the vector address onto the stack
    call _ZNKSt6vectorIdSaIdEEixEj ; Call the 'Gradient' function
    add esp, 4 ; Clean up the stack
    fstp qword [result] ; Store the result

    ; Call the 'Hessian' function
    mov eax, offset _ZNSt8functionIFddEEd
    mov dword [func_ptr_vector], eax ; Set the function pointer
    push dword [arg_h] ; Push 'h' onto the stack
    push dword [func_ptr_vector] ; Push the function pointer onto the stack
    call _ZNSt6vectorIdSaIdEEC1ERKS2_ ; Construct the vector
    add esp, 8 ; Clean up the stack
    pushad ; Save all general-purpose registers
    mov edi, eax ; Store the vector in EDI for later use
    popad ; Restore all general-purpose registers
    push dword [edi] ; Push the vector address onto the stack
    call _ZNKSt6vectorIdSaIdEEixEj ; Call the 'Hessian' function
    add esp, 4 ; Clean up the stack
    fstp qword [result] ; Store the result

    ; Call the 'FindCriticalPoints' function
    fld qword [arg_epsilon] ; Load 'epsilon' onto the FPU stack
    fld qword [arg_b] ; Load 'b' onto the FPU stack
    fld qword [arg_a] ; Load 'a' onto the FPU stack
    push dword [func_ptr] ; Push the function pointer onto the stack
    call _ZNSt8functionIFdEEd ; Call the function
    add esp, 16 ; Clean up the stack
    fstp qword [result] ; Store the result

    ; Call the 'RiemannSum' function
    fld qword [arg_n] ; Load 'n' onto the FPU stack
    fld qword [arg_b] ; Load 'b' onto the FPU stack
    fld qword [arg_a] ; Load 'a' onto the FPU stack
    push dword [func_ptr] ; Push the function pointer onto the stack
    call _ZNSt8functionIFdEEd ; Call the function
    add esp, 16 ; Clean up the stack
    fstp qword [result] ; Store the result

    ; Call the 'DefiniteIntegral' function
    fld qword [arg_b] ; Load 'b' onto the FPU stack
    fld qword [arg_a] ; Load 'a' onto the FPU stack
    push dword [func_ptr] ; Push the function pointer onto the stack
    call _ZNSt8functionIFdEEd ; Call the function
    add esp, 12 ; Clean up the stack
    fstp qword [result] ; Store the result

    ; Exit the program
    mov eax, 1 ; Exit system call number
    xor ebx, ebx ; Exit status
    int 0x80 ; Perform system call

section .bss
    resb 8 ; Reserve space for the result



; Matrix Class (MATRIX.o)


section .data
    ; Declare the function prototypes
    extern Sigmath_Matrix_Add  ; Add(const Matrix& a, const Matrix& b)
    extern printf              ; or any other functions you may need

section .text
    global _start

_start:
    ; Create matrices a and b
    ; ...

    ; Call the Add function
    push b                      ; Push the second matrix b onto the stack
    push a                      ; Push the first matrix a onto the stack
    call Sigmath_Matrix_Add     ; Call the Add function
    add esp, 8                  ; Clean up the stack after the function call
    mov ebx, eax                ; Store the result in EBX (assuming the result is an integer)

    ; Display the result
    push ebx                    ; Push the result onto the stack
    push format                 ; Push the format string onto the stack
    call printf                 ; Call the printf function
    add esp, 8                  ; Clean up the stack after the function call

    ; Exit the program
    mov eax, 1                  ; Exit system call number
    xor ebx, ebx                ; Exit status
    int 0x80                    ; Perform system call

section .data
    format db "%d", 0            ; Format string for printf

section .bss
    ; Define variables or reserve space as needed
    ; ...



; Basic Class (BASIC.o)


section .data
    ; Declare the function prototypes
    extern Sigmath_Basic_Add   ; double Add(const std::initializer_list<double>& numbers)
    extern printf              ; or any other functions you may need

section .text
    global _start

_start:
    ; Call the Add function
    push qword [numbers]        ; Push the address of the initializer list onto the stack
    call Sigmath_Basic_Add      ; Call the Add function
    add esp, 8                  ; Clean up the stack after the function call
    sub esp, 8                  ; Reserve space for the floating-point result
    fstp qword [esp]            ; Store the floating-point result onto the reserved space

    ; Display the result
    push format                 ; Push the format string onto the stack
    push dword [esp]            ; Push the floating-point result onto the stack
    call printf                 ; Call the printf function
    add esp, 12                 ; Clean up the stack after the function call

    ; Exit the program
    mov eax, 1                  ; Exit system call number
    xor ebx, ebx                ; Exit status
    int 0x80                    ; Perform system call

section .data
    format db "%lf", 10, 0      ; Format string for printf

section .data
    numbers dq 1.0, 2.0, 3.0, 4.0, 5.0, 6.0 ; Example initializer list

section .bss
    ; Define variables or reserve space as needed
    ; ...



; Complex Class (complex.o)


section .data
    ; Declare the function prototypes
    extern Sigmath_Compl_Abs       ; double Abs(const Complex& a)
    extern printf                  ; or any other functions you may need

section .text
    global _start

_start:
    ; Create a complex number
    movsd xmm0, qword 3.5       ; Set the real part of the complex number
    movsd xmm1, qword 4.2       ; Set the imaginary part of the complex number
    sub esp, 16                 ; Allocate space on the stack for the Complex structure
    mov qword [esp], xmm0       ; Store the real part on the stack
    mov qword [esp+8], xmm1     ; Store the imaginary part on the stack

    ; Call the Abs function
    mov ecx, esp                ; Pass the address of the Complex structure
    call Sigmath_Compl_Abs      ; Call the Abs function
    add esp, 16                 ; Clean up the stack after the function call

    ; Store the result in a floating-point register (e.g., xmm0)
    movsd xmm0, qword [esp]

    ; Display the result
    push format                 ; Push the format string onto the stack
    mov eax, 1                  ; Use the sys_write system call
    mov ebx, 1                  ; File descriptor 1: standard output
    lea ecx, [esp+8]            ; Address of the floating-point result
    mov edx, 8                  ; Number of bytes to write
    int 0x80                    ; Perform the system call

    ; Exit the program
    mov eax, 1                  ; Exit system call number
    xor ebx, ebx                ; Exit status
    int 0x80                    ; Perform system call

section .data
    format db "%lf", 10, 0      ; Format string for printf



; Computing Class (COMPUTING.o)


section .data
    ; Declare the function prototypes
    extern Sigmath_Computing_Floor     ; int Floor(double x)
    extern Sigmath_Computing_Ceil      ; int Ceil(double x)
    extern Sigmath_Computing_Round     ; int Round(double x)
    extern printf                      ; or any other functions you may need

section .text
    global _start

_start:
    ; Call the Floor function
    movsd xmm0, qword 4.8       ; Set the input value
    call Sigmath_Computing_Floor

    ; Store the result in a general-purpose register (e.g., eax)
    mov eax, eax                ; Result is already in eax

    ; Display the result
    push eax                    ; Push the result onto the stack
    push format                 ; Push the format string onto the stack
    mov eax, 0                  ; Use the sys_write system call
    mov ebx, 1                  ; File descriptor 1: standard output
    lea ecx, [esp+4]            ; Address of the result
    mov edx, 4                  ; Number of bytes to write
    int 0x80                    ; Perform the system call
    add esp, 8                  ; Clean up the stack after the function call

    ; Call the Ceil function
    movsd xmm0, qword -2.3      ; Set the input value
    call Sigmath_Computing_Ceil

    ; Store the result in a general-purpose register (e.g., eax)
    mov eax, eax                ; Result is already in eax

    ; Display the result
    push eax                    ; Push the result onto the stack
    push format                 ; Push the format string onto the stack
    mov eax, 0                  ; Use the sys_write system call
    mov ebx, 1                  ; File descriptor 1: standard output
    lea ecx, [esp+4]            ; Address of the result
    mov edx, 4                  ; Number of bytes to write
    int 0x80                    ; Perform the system call
    add esp, 8                  ; Clean up the stack after the function call

    ; Call the Round function
    movsd xmm0, qword 3.7       ; Set the input value
    call Sigmath_Computing_Round

    ; Store the result in a general-purpose register (e.g., eax)
    mov eax, eax                ; Result is already in eax

    ; Display the result
    push eax                    ; Push the result onto the stack
    push format                 ; Push the format string onto the stack
    mov eax, 0                  ; Use the sys_write system call
    mov ebx, 1                  ; File descriptor 1: standard output
    lea ecx, [esp+4]            ; Address of the result
    mov edx, 4                  ; Number of bytes to write
    int 0x80                    ; Perform the system call
    add esp, 8                  ; Clean up the stack after the function call

    ; Exit the program
    mov eax, 1                  ; Exit system call number
    xor ebx, ebx                ; Exit status
    int 0x80                    ; Perform system call

section .data
    format db "%d", 10, 0       ; Format string for printf



; Nums Class (NUMSG.o)


section .data
    ; Declare the function prototypes
    extern Sigmath_Nums_Gcd   ; int Gcd(int a, int b)
    extern Sigmath_Nums_Lcm   ; int Lcm(int a, int b)
    extern Sigmath_Nums_Mod   ; int Mod(int a, int b)
    extern printf             ; or any other functions you may need

section .text
    global _start

_start:
    ; Call the Gcd function
    mov eax, 10                 ; Set the first input value (a)
    mov ebx, 15                 ; Set the second input value (b)
    call Sigmath_Nums_Gcd

    ; Store the result in a general-purpose register (e.g., eax)
    mov ebx, eax                ; Result is in eax

    ; Display the result
    push ebx                    ; Push the result onto the stack
    push format                 ; Push the format string onto the stack
    mov eax, 0                  ; Use the sys_write system call
    mov ebx, 1                  ; File descriptor 1: standard output
    lea ecx, [esp+4]            ; Address of the result
    mov edx, 4                  ; Number of bytes to write
    int 0x80                    ; Perform the system call
    add esp, 8                  ; Clean up the stack after the function call

    ; Call the Lcm function
    mov eax, 10                 ; Set the first input value (a)
    mov ebx, 15                 ; Set the second input value (b)
    call Sigmath_Nums_Lcm

    ; Store the result in a general-purpose register (e.g., eax)
    mov ebx, eax                ; Result is in eax

    ; Display the result
    push ebx                    ; Push the result onto the stack
    push format                 ; Push the format string onto the stack
    mov eax, 0                  ; Use the sys_write system call
    mov ebx, 1                  ; File descriptor 1: standard output
    lea ecx, [esp+4]            ; Address of the result
    mov edx, 4                  ; Number of bytes to write
    int 0x80                    ; Perform the system call
    add esp, 8                  ; Clean up the stack after the function call

    ; Call the Mod function
    mov eax, 17                 ; Set the first input value (a)
    mov ebx, 5                  ; Set the second input value (b)
    call Sigmath_Nums_Mod

    ; Store the result in a general-purpose register (e.g., eax)
    mov ebx, eax                ; Result is in eax

    ; Display the result
    push ebx                    ; Push the result onto the stack
    push format                 ; Push the format string onto the stack
    mov eax, 0                  ; Use the sys_write system call
    mov ebx, 1                  ; File descriptor 1: standard output
    lea ecx, [esp+4]            ; Address of the result
    mov edx, 4                  ; Number of bytes to write
    int 0x80                    ; Perform the system call
    add esp, 8                  ; Clean up the stack after the function call

    ; Exit the program
    mov eax, 1                  ; Use the sys_exit system call
    xor ebx, ebx                ; Return value: 0
    int 0x80                    ; Perform the system call

section .data
    format db "%d", 10, 0       ; Format string for printf



; Sets Class (sets.o)


section .data
    ; Declare the function prototypes
    extern Sigmath_Sets_Union               ; std::vector<T> Union(const std::vector<T>& set1, const std::vector<T>& set2)
    extern Sigmath_Sets_Intersection        ; std::vector<T> Intersection(const std::vector<T>& set1, const std::vector<T>& set2)
    extern Sigmath_Sets_Difference          ; std::vector<T> Difference(const std::vector<T>& set1, const std::vector<T>& set2)
    extern Sigmath_Sets_SymmetricDifference ; std::vector<T> SymmetricDifference(const std::vector<T>& set1, const std::vector<T>& set2)
    extern Sigmath_Sets_IsSubset            ; bool IsSubset(const std::vector<T>& subset, const std::vector<T>& set)
    extern Sigmath_Sets_IsSuperset          ; bool IsSuperset(const std::vector<T>& superset, const std::vector<T>& set)
    extern printf                           ; or any other functions you may need

section .text
    global _start

_start:
    ; Set up the first vector
    mov esi, set1               ; Address of the first vector
    mov ecx, set1_length        ; Length of the first vector
    mov edi, set1_end           ; Address of the end of the first vector
    sub edi, esi                ; Calculate the size of the first vector
    push edi                    ; Push the size of the first vector onto the stack
    push esi                    ; Push the address of the first vector onto the stack

    ; Set up the second vector
    mov esi, set2               ; Address of the second vector
    mov ecx, set2_length        ; Length of the second vector
    mov edi, set2_end           ; Address of the end of the second vector
    sub edi, esi                ; Calculate the size of the second vector
    push edi                    ; Push the size of the second vector onto the stack
    push esi                    ; Push the address of the second vector onto the stack

    ; Call the Union function
    call Sigmath_Sets_Union
    add esp, 16                 ; Clean up the stack after the function call

    ; Store the returned vector size in a register (e.g., eax)
    mov edx, eax                ; Result size is returned in eax

    ; Display the result
    push edx                    ; Push the result size onto the stack
    push format                 ; Push the format string onto the stack
    mov eax, 0                  ; Use the sys_write system call
    mov ebx, 1                  ; File descriptor 1: standard output
    lea ecx, [esp+4]            ; Address of the result size
    mov edx, 4                  ; Number of bytes to write
    int 0x80                    ; Perform the system call
    add esp, 8                  ; Clean up the stack after the function call

    ; Call the Intersection function
    call Sigmath_Sets_Intersection
    add esp, 16                 ; Clean up the stack after the function call

    ; Call the Difference function
    call Sigmath_Sets_Difference
    add esp, 16                 ; Clean up the stack after the function call

    ; Call the SymmetricDifference function
    call Sigmath_Sets_SymmetricDifference
    add esp, 16                 ; Clean up the stack after the function call

    ; Call the IsSubset function
    call Sigmath_Sets_IsSubset
    add esp, 16                 ; Clean up the stack after the function call

    ; Call the IsSuperset function
    call Sigmath_Sets_IsSuperset
    add esp, 16                 ; Clean up the stack after the function call

    ; Exit the program
    mov eax, 1                  ; Use the sys_exit system call
    xor ebx, ebx                ; Return value: 0
    int 0x80                    ; Perform the system call

section .data
    format db "Result size: %d", 10, 0  ; Format string for printf

section .bss
    set1 resb 8                 ; Reserve space for the first vector
    set1_end equ $              ; End address of the first vector
    set2 resb 8                 ; Reserve space for the second vector
    set2_end equ $              ; End address of the second vector

section .data
    set1_length dd 4            ; Length of the first vector
    set2_length dd 4            ; Length of the second vector



; Civil Class (CIVIL.o)


section .data
    ; Declare the function prototypes
    extern Sigmath_Civil_CalculateBeamDeflection  ; double CalculateBeamDeflection(double length, double load, double elasticity, double momentOfInertia)
    extern Sigmath_Civil_CalculateStress          ; double CalculateStress(double force, double area)
    extern Sigmath_Civil_CalculateStrain          ; double CalculateStrain(double initialLength, double finalLength, double initialDiameter)
    extern Sigmath_Civil_CalculateYoungsModulus   ; double CalculateYoungsModulus(double stress, double strain)
    extern printf                                 ; or any other functions you may need

section .text
    global _start

_start:
    ; Set up the parameters
    movsd xmm0, length          ; xmm0 = length
    movsd xmm1, load            ; xmm1 = load
    movsd xmm2, elasticity      ; xmm2 = elasticity
    movsd xmm3, momentOfInertia ; xmm3 = momentOfInertia

    ; Call the CalculateBeamDeflection function
    call Sigmath_Civil_CalculateBeamDeflection
    add esp, 16                 ; Clean up the stack after the function call

    ; Store the returned value in a register (e.g., xmm4)
    movsd xmm4, xmm0            ; Result is returned in xmm0

    ; Display the result
    mov edi, format              ; Move the format string address to edi
    mov eax, 1                   ; Use the sys_write system call
    xor ebx, ebx                 ; File descriptor 1: standard output
    xor ecx, ecx                 ; Clear ecx (used as the counter)
    call printf                  ; Call printf to print the result

    ; Set up the parameters
    movsd xmm0, force           ; xmm0 = force
    movsd xmm1, area            ; xmm1 = area

    ; Call the CalculateStress function
    call Sigmath_Civil_CalculateStress
    add esp, 16                 ; Clean up the stack after the function call

    ; Set up the parameters
    movsd xmm0, initialLength   ; xmm0 = initialLength
    movsd xmm1, finalLength     ; xmm1 = finalLength
    movsd xmm2, initialDiameter ; xmm2 = initialDiameter

    ; Call the CalculateStrain function
    call Sigmath_Civil_CalculateStrain
    add esp, 24                 ; Clean up the stack after the function call

    ; Store the returned value in a register (e.g., xmm5)
    movsd xmm5, xmm0            ; Result is returned in xmm0

    ; Set up the parameters
    movsd xmm0, xmm4            ; xmm0 = beam deflection
    movsd xmm1, xmm5            ; xmm1 = strain

    ; Call the CalculateYoungsModulus function
    call Sigmath_Civil_CalculateYoungsModulus
    add esp, 16                 ; Clean up the stack after the function call

    ; Exit the program
    mov eax, 1                  ; Use the sys_exit system call
    xor ebx, ebx                ; Return value: 0
    int 0x80                    ; Perform the system call

section .data
    format db "Result: %f", 10, 0  ; Format string for printf

section .bss
    length            resq 1      ; Reserve space for length (64-bit)
    load              resq 1      ; Reserve space for load (64-bit)
    elasticity        resq 1      ; Reserve space for elasticity (64-bit)
    momentOfInertia   resq 1      ; Reserve space for momentOfInertia (64-bit)
    force             resq 1      ; Reserve space for force (64-bit)
    area              resq 1      ; Reserve space for area (64-bit)
    initialLength     resq 1      ; Reserve space for initialLength (64-bit)
    finalLength       resq 1      ; Reserve space for finalLength (64-bit)
    initialDiameter   resq 1      ; Reserve space for initialDiameter (64-bit)



; Electrical Class (ELECTRICAL.o)


section .data
    ; Declare the function prototypes
    extern Sigmath_Electrical_CalculateResistance                ; double CalculateResistance(double voltage, double current)
    extern Sigmath_Electrical_CalculateBasicPower               ; double CalculateBasicPower(double voltage, double current)
    extern Sigmath_Electrical_CalculateCapacitance              ; double CalculateCapacitance(double charge, double voltage)
    extern Sigmath_Electrical_CalculateInductance               ; double CalculateInductance(double voltage, double current, double frequency)
    extern Sigmath_Electrical_CalculateImpedance                ; double CalculateImpedance(double resistance, double reactance)
    extern Sigmath_Electrical_CalculateReactance                ; double CalculateReactance(double inductance, double frequency)
    extern Sigmath_Electrical_CalculateResonantFrequency        ; double CalculateResonantFrequency(double inductance, double capacitance)
    extern Sigmath_Electrical_CalculateBasicPowererFactor       ; double CalculateBasicPowererFactor(double realBasicPower, double apparentBasicPower)
    extern Sigmath_Electrical_CalculateRMS                      ; double CalculateRMS(const std::vector<double>& values)
    extern Sigmath_Electrical_CalculateTotalResistanceInSeries  ; double CalculateTotalResistanceInSeries(const std::vector<double>& resistances)
    extern Sigmath_Electrical_CalculateTotalResistanceInParallel; double CalculateTotalResistanceInParallel(const std::vector<double>& resistances)
    extern Sigmath_Electrical_CalculateTotalCapacitanceInSeries ; double CalculateTotalCapacitanceInSeries(const std::vector<double>& capacitances)
    extern Sigmath_Electrical_CalculateTotalCapacitanceInParallel; double CalculateTotalCapacitanceInParallel(const std::vector<double>& capacitances)
    extern Sigmath_Electrical_CalculateTotalInductanceInSeries  ; double CalculateTotalInductanceInSeries(const std::vector<double>& inductances)
    extern Sigmath_Electrical_CalculateTotalInductanceInParallel; double CalculateTotalInductanceInParallel(const std::vector<double>& inductances)
    extern printf                                               ; or any other functions you may need

section .text
    global _start

_start:
    ; Set up the parameters
    movsd xmm0, voltage         ; xmm0 = voltage
    movsd xmm1, current         ; xmm1 = current

    ; Call the CalculateResistance function
    call Sigmath_Electrical_CalculateResistance
    add esp, 16                 ; Clean up the stack after the function call

    ; Store the returned value in a register (e.g., xmm4)
    movsd xmm4, xmm0            ; Result is returned in xmm0

    ; Display the result
    mov edi, format              ; Move the format string address to edi
    mov eax, 1                   ; Use the sys_write system call (1)
    mov esi, 1                   ; Use file descriptor 1 (stdout)
    xor edx, edx                 ; Clear edx
    call printf                  ; Call the printf function

    ; Continue with calling other functions and displaying the results

    ; Exit the program
    mov eax, 1                   ; Use the sys_exit system call (1)
    xor ebx, ebx                 ; Return 0 status
    int 0x80                     ; Make the system call

section .data
    format db "Result: %f", 10, 0  ; Format string for printf

section .bss
    voltage  resq 1              ; Reserve space for voltage (64-bit)
    current  resq 1              ; Reserve space for current (64-bit)



; Kinematics Class (KINEMATICS.o)


section .data
    ; Declare the function prototypes
    extern Sigmath_Kinematics_CalculateDisplacement         ; double CalculateDisplacement(double initialVelocity, double finalVelocity, double acceleration, double time)
    extern Sigmath_Kinematics_CalculateFinalVelocity        ; double CalculateFinalVelocity(double initialVelocity, double acceleration, double displacement)
    extern Sigmath_Kinematics_CalculateTime                 ; double CalculateTime(double initialVelocity, double finalVelocity, double displacement, double acceleration)
    extern Sigmath_Kinematics_CalculateProjectileRange      ; double CalculateProjectileRange(double initialVelocity, double launchAngle)
    extern printf                                            ; or any other functions you may need

section .text
    global _start

_start:
    ; Set up the parameters
    movsd xmm0, initialVelocity    ; xmm0 = initialVelocity
    movsd xmm1, finalVelocity      ; xmm1 = finalVelocity
    movsd xmm2, acceleration       ; xmm2 = acceleration
    movsd xmm3, time                ; xmm3 = time

    ; Call the CalculateDisplacement function
    call Sigmath_Kinematics_CalculateDisplacement
    add esp, 32                   ; Clean up the stack after the function call

    ; Store the returned value in a register (e.g., xmm4)
    movsd xmm4, xmm0              ; Result is returned in xmm0

    ; Display the result
    mov edi, format               ; Move the format string address to edi
    mov eax, 1                    ; Use the sys_write system call (1)
    mov esi, 1                    ; Use file descriptor 1 (stdout)
    xor edx, edx                  ; Clear edx
    call printf                   ; Call the printf function

    ; Continue with calling other functions and displaying the results

    ; Exit the program
    mov eax, 1                    ; Use the sys_exit system call (1)
    xor ebx, ebx                  ; Return 0 status
    int 0x80                      ; Make the system call

section .data
    format db "Result: %f", 10, 0  ; Format string for printf

section .bss
    initialVelocity  resq 1        ; Reserve space for initialVelocity (64-bit)
    finalVelocity    resq 1        ; Reserve space for finalVelocity (64-bit)
    acceleration     resq 1        ; Reserve space for acceleration (64-bit)
    time             resq 1        ; Reserve space for time (64-bit)



; Mechanical Class (MECHANICAL.o)


section .data
    ; Declare the function prototypes
    extern Sigmath_Mechanical_CalculateTorque        ; double CalculateTorque(double force, double radius)
    extern Sigmath_Mechanical_CalculatePower         ; double CalculatePower(double torque, double angularVelocity)
    extern Sigmath_Mechanical_CalculateVelocity      ; double CalculateVelocity(double distance, double time)
    extern Sigmath_Mechanical_CalculateAcceleration  ; double CalculateAcceleration(double initialVelocity, double finalVelocity, double time)
    extern Sigmath_Mechanical_CalculateForce         ; double CalculateForce(double mass, double acceleration)
    extern printf                                    ; or any other functions you may need

section .text
    global _start

_start:
    ; Set up the parameters
    movsd xmm0, force            ; xmm0 = force
    movsd xmm1, radius           ; xmm1 = radius

    ; Call the CalculateTorque function
    call Sigmath_Mechanical_CalculateTorque
    add esp, 16                  ; Clean up the stack after the function call

    ; Store the returned value in a register (e.g., xmm2)
    movsd xmm2, xmm0             ; Result is returned in xmm0

    ; Display the result
    mov edi, format              ; Move the format string address to edi
    mov eax, 1                   ; Use the sys_write system call (1)
    mov esi, 1                   ; Use file descriptor 1 (stdout)
    xor edx, edx                 ; Clear edx
    call printf                  ; Call the printf function

    ; Continue with calling other functions and displaying the results

    ; Exit the program
    mov eax, 1                   ; Use the sys_exit system call (1)
    xor ebx, ebx                 ; Return 0 status
    int 0x80                     ; Make the system call

section .data
    format db "Result: %f", 10, 0 ; Format string for printf

section .bss
    force   resq 1               ; Reserve space for force (64-bit)
    radius  resq 1               ; Reserve space for radius (64-bit)



; Equify Class (EQUIFY.o)


section .data
    expression db "3 + 4 * 2 - ( 1 + 2 ) ^ 2", 0

section .text
    extern evaluateExpression
    global main

main:
    ; Set up the stack frame
    push ebp
    mov ebp, esp

    ; Save any necessary registers

    ; Pass the argument to the function
    push expression

    ; Call the function
    call evaluateExpression

    ; Retrieve the return value
    ; The return value is stored in ST(0) (FPU stack top)
    fld st(0)

    ; Clean up the stack
    add esp, 4

    ; Restore any saved registers

    ; Clean up the stack frame
    pop ebp

    ; Exit the program
    mov eax, 0
    ret


; Geometry Class (GEOMETRY.o)


section .data
    radius dd 2.5
    width dd 4.0
    height dd 5.0
    base dd 3.0
    triangle_height dd 2.5
    side1 dd 4.0
    side2 dd 3.0
    side3 dd 5.0
    x1 dd 1.0
    y1 dd 2.0
    x2 dd 3.0
    y2 dd 4.0
    x3 dd 1.0
    y3 dd 2.0
    z1 dd 3.0
    z2 dd 4.0
    z3 dd 5.0
    slope1 dd 1.0
    slope2 dd 2.0

section .text
    extern CircleArea
    extern CirclePerimeter
    extern RectangleArea
    extern RectanglePerimeter
    extern TriangleArea
    extern TrianglePerimeter
    extern DistanceBetweenPoints2D
    extern DistanceBetweenPoints3D
    extern AngleBetweenLines
    extern AngleBetweenVectors2D
    extern AngleBetweenVectors3D
    global main

main:
    ; Set up the stack frame
    push ebp
    mov ebp, esp

    ; Save any necessary registers

    ; Call CircleArea
    fld dword [radius]
    call CircleArea
    fstp qword [result1]

    ; Call CirclePerimeter
    fld dword [radius]
    call CirclePerimeter
    fstp qword [result2]

    ; Call RectangleArea
    fld dword [width]
    fld dword [height]
    call RectangleArea
    fstp qword [result3]

    ; Call RectanglePerimeter
    fld dword [width]
    fld dword [height]
    call RectanglePerimeter
    fstp qword [result4]

    ; Call TriangleArea
    fld dword [base]
    fld dword [triangle_height]
    call TriangleArea
    fstp qword [result5]

    ; Call TrianglePerimeter
    fld dword [side1]
    fld dword [side2]
    fld dword [side3]
    call TrianglePerimeter
    fstp qword [result6]

    ; Call DistanceBetweenPoints2D
    fld dword [x1]
    fld dword [y1]
    fld dword [x2]
    fld dword [y2]
    call DistanceBetweenPoints2D
    fstp qword [result7]

    ; Call DistanceBetweenPoints3D
    fld dword [x1]
    fld dword [y1]
    fld dword [z1]
    fld dword [x2]
    fld dword [y2]
    fld dword [z2]
    call DistanceBetweenPoints3D
    fstp qword [result8]

    ; Call AngleBetweenLines
    fld dword [slope1]
    fld dword [slope2]
    call AngleBetweenLines
    fstp qword [result9]

    ; Call AngleBetweenVectors2D
    fld dword [x1]
    fld dword [y1]
    fld dword [x2]
    fld dword [y2]
    call AngleBetweenVectors2D
    fstp qword [result10]

    ; Call AngleBetweenVectors3D
    fld dword [x1]
    fld dword [y1]
    fld dword [z1]
    fld dword [x2]
    fld dword [y2]
    fld dword [z2]
    call AngleBetweenVectors3D
    fstp qword [result11]

    ; Restore any saved registers

    ; Clean up the stack frame
    pop ebp

    ; Exit the program
    mov eax, 0
    ret


; Logarithm Class (LOGARITHM.o)


section .data
    x dd 2.0
    n dd 3.0
    result1 dq 0.0
    result2 dq 0.0
    result3 dq 0.0
    error_message db "Invalid argument: x must be positive", 0

section .text
    extern Log
    extern Log10
    extern Logn
    global main

main:
    ; Set up the stack frame
    push ebp
    mov ebp, esp

    ; Save any necessary registers

    ; Call Log
    fld dword [x]
    call Log
    fstp qword [result1]

    ; Call Log10
    fld dword [x]
    call Log10
    fstp qword [result2]

    ; Call Logn
    fld dword [n]
    fld dword [x]
    call Logn
    fstp qword [result3]

    ; Restore any saved registers

    ; Clean up the stack frame
    pop ebp

    ; Exit the program
    mov eax, 0
    ret


; Polynomial Class (POLYNOMIAL.o)


section .data
    coefficients dq 2.0, -3.0, 1.0    ; Example coefficients for the polynomial
    x dd 1.5                         ; Example value of x
    result1 dq 0.0                    ; Placeholder for Evaluate result
    result2 dq 0.0                    ; Placeholder for Divide result
    result3 dq 0.0                    ; Placeholder for Derivative result

section .text
    extern std::vector<double>::size
    extern std::vector<double>::operator[]
    extern std::reverse
    extern Sigmath::Polynomial::Evaluate
    extern Sigmath::Polynomial::Divide
    extern Sigmath::Derivative
    global main

main:
    ; Set up the stack frame
    push ebp
    mov ebp, esp

    ; Save any necessary registers

    ; Call Evaluate
    lea edi, [coefficients]
    mov ecx, [edi + std::vector<double>::size]
    mov esi, x
    fld dword [esi]
    push ecx
    dec ecx
    mov ebx, ecx
    shl ecx, 3
    sub edi, ecx
    lea edi, [edi + std::vector<double>::operator[]]
    call Sigmath::Polynomial::Evaluate
    fstp qword [result1]

    ; Call Divide
    lea edi, [coefficients]
    mov ecx, [edi + std::vector<double>::size]
    sub ecx, 1
    push ecx
    push ebx
    sub edi, ebx
    lea edi, [edi + std::vector<double>::operator[]]
    call Sigmath::Polynomial::Divide
    fstp qword [result2]

    ; Call Derivative
    lea edi, [coefficients]
    mov ecx, [edi + std::vector<double>::size]
    sub ecx, 1
    push ecx
    sub edi, ecx
    lea edi, [edi + std::vector<double>::operator[]]
    call Sigmath::Derivative
    fstp qword [result3]

    ; Restore any saved registers

    ; Clean up the stack frame
    pop ebp

    ; Exit the program
    mov eax, 0
    ret


; Random Class (RANDOM.o)


section .data
    minDouble dq 0.0      ; Minimum value for RandUniform
    maxDouble dq 1.0      ; Maximum value for RandUniform
    mean dq 0.0           ; Mean value for RandNormal
    stdDev dq 1.0         ; Standard deviation for RandNormal
    lambda dq 1.0         ; Lambda value for RandPoisson
    result1 dq 0.0        ; Placeholder for RandUniform result
    result2 dq 0.0        ; Placeholder for RandNormal result
    result3 dd 0          ; Placeholder for RandPoisson result

section .text
    extern Sigmath::Rand::NextDouble
    extern Sigmath::Random::RandUniform
    extern Sigmath::Random::RandNormal
    extern Sigmath::Random::RandPoisson
    global main

main:
    ; Set up the stack frame
    push ebp
    mov ebp, esp

    ; Save any necessary registers

    ; Call NextDouble
    call Sigmath::Rand::NextDouble
    fstp qword [result1]

    ; Call RandUniform
    fld qword [minDouble]
    fld qword [maxDouble]
    call Sigmath::Random::RandUniform
    fstp qword [result2]

    ; Call RandNormal
    fld qword [mean]
    fld qword [stdDev]
    call Sigmath::Random::RandNormal
    fstp qword [result2]

    ; Call RandPoisson
    fld qword [lambda]
    call Sigmath::Random::RandPoisson
    fstp dword [result3]

    ; Restore any saved registers

    ; Clean up the stack frame
    pop ebp

    ; Exit the program
    mov eax, 0
    ret


; Time Class (TIME.o)


section .data
    timeStr db 20   ; Placeholder for the time string
    timeLen equ $-timeStr   ; Length of the time string

section .text
    extern Sigmath::Time::Now
    extern Sigmath::Time::ToString
    global main

main:
    ; Set up the stack frame
    push ebp
    mov ebp, esp

    ; Save any necessary registers

    ; Call Now
    call Sigmath::Time::Now
    mov edi, eax   ; Store the result in edi

    ; Call ToString
    lea esi, [timeStr]
    push esi   ; Push the address of the time string
    push timeLen   ; Push the length of the time string
    mov eax, edi   ; Move the result from Now to eax
    call Sigmath::Time::ToString

    ; Print the time string
    push eax   ; Push the return value of ToString
    push timeLen   ; Push the length of the time string
    push 1   ; File descriptor for stdout
    mov eax, 4   ; System call number for write
    sub esp, 4   ; Adjust the stack pointer
    int 0x80   ; Call the kernel

    ; Restore any saved registers

    ; Clean up the stack frame
    pop ebp

    ; Exit the program
    mov eax, 0
    ret


; Statgorithm Class (ALGORITHMS.o)


section .data
    values: dq 1.5, 2.3, 0.8, 1.2, 3.1   ; Example array of values
    valuesLen equ ($ - values) / 8   ; Length of the array

section .text
    extern Sigmath::Statgorithm::Skewness
    extern Sigmath::Statgorithm::Kurtosis
    extern Sigmath::Statgorithm::Covariance
    extern Sigmath::Statgorithm::Percentile
    extern Sigmath::Statgorithm::RemoveOutliers
    global main

main:
    ; Set up the stack frame
    push ebp
    mov ebp, esp

    ; Save any necessary registers

    ; Call Skewness
    mov eax, values   ; Move the address of the values array to eax
    push eax   ; Push the address of the values array
    push valuesLen   ; Push the length of the values array
    call Sigmath::Statgorithm::Skewness

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Kurtosis
    mov eax, values   ; Move the address of the values array to eax
    push eax   ; Push the address of the values array
    push valuesLen   ; Push the length of the values array
    call Sigmath::Statgorithm::Kurtosis

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Covariance
    mov eax, values   ; Move the address of the xValues array to eax
    push eax   ; Push the address of the xValues array
    mov eax, values   ; Move the address of the yValues array to eax
    push eax   ; Push the address of the yValues array
    push valuesLen   ; Push the length of the arrays
    call Sigmath::Statgorithm::Covariance

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Percentile
    mov eax, values   ; Move the address of the values array to eax
    push eax   ; Push the address of the values array
    push 75   ; Push the percentile value
    call Sigmath::Statgorithm::Percentile

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call RemoveOutliers
    mov eax, values   ; Move the address of the values array to eax
    push eax   ; Push the address of the values array
    push valuesLen   ; Push the length of the values array
    call Sigmath::Statgorithm::RemoveOutliers

    ; The result is a new vector of values, which can be stored and processed as needed

    ; Restore any saved registers

    ; Clean up the stack frame
    pop ebp

    ; Exit the program
    mov eax, 0
    ret



; Statistics Class (STATS.o)


section .data
    values: dq 1.5, 2.3, 0.8, 1.2, 3.1   ; Example array of values
    valuesLen equ ($ - values) / 8   ; Length of the array

section .text
    extern Sigmath::Statistics::Mean
    extern Sigmath::Statistics::Median
    extern Sigmath::Statistics::Mode
    extern Sigmath::Statistics::Variance
    extern Sigmath::Statistics::StandardDeviation
    extern Sigmath::Statistics::Correlation
    global main

main:
    ; Set up the stack frame
    push ebp
    mov ebp, esp

    ; Save any necessary registers

    ; Call Mean
    mov eax, values   ; Move the address of the values array to eax
    push eax   ; Push the address of the values array
    push valuesLen   ; Push the length of the values array
    call Sigmath::Statistics::Mean

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Median
    mov eax, values   ; Move the address of the values array to eax
    push eax   ; Push the address of the values array
    push valuesLen   ; Push the length of the values array
    call Sigmath::Statistics::Median

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Mode
    mov eax, values   ; Move the address of the values array to eax
    push eax   ; Push the address of the values array
    push valuesLen   ; Push the length of the values array
    call Sigmath::Statistics::Mode

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Variance
    mov eax, values   ; Move the address of the values array to eax
    push eax   ; Push the address of the values array
    push valuesLen   ; Push the length of the values array
    call Sigmath::Statistics::Variance

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call StandardDeviation
    mov eax, values   ; Move the address of the values array to eax
    push eax   ; Push the address of the values array
    push valuesLen   ; Push the length of the values array
    call Sigmath::Statistics::StandardDeviation

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Correlation
    mov eax, values   ; Move the address of the valuesX array to eax
    push eax   ; Push the address of the valuesX array
    mov eax, values   ; Move the address of the valuesY array to eax
    push eax   ; Push the address of the valuesY array
    push valuesLen   ; Push the length of the valuesX and valuesY arrays
    call Sigmath::Statistics::Correlation

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Clean up the stack

    ; Clean up the stack frame
    pop ebp

    ; Exit the program
    mov eax, 0
    ret


; Trig Class (CONST.o)


section .data
    x: dq 1.5   ; Example value of x

section .text
    extern Sigmath::Trig::Sin
    extern Sigmath::Trig::Cos
    extern Sigmath::Trig::Tan
    extern Sigmath::Trig::Asin
    extern Sigmath::Trig::Acos
    extern Sigmath::Trig::Atan
    global main

main:
    ; Set up the stack frame
    push ebp
    mov ebp, esp

    ; Save any necessary registers

    ; Call Sin
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Trig::Sin

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Cos
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Trig::Cos

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Tan
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Trig::Tan

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Asin
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Trig::Asin

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Acos
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Trig::Acos

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Atan
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Trig::Atan

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Clean up the stack

    ; Clean up the stack frame
    pop ebp

    ; Exit the program
    mov eax, 0
    ret


; Hyperbolic Class 


section .data
    x: dq 1.5   ; Example value of x

section .text
    extern Sigmath::Hyperbolic::Sinh
    extern Sigmath::Hyperbolic::Cosh
    extern Sigmath::Hyperbolic::Tanh
    extern Sigmath::Hyperbolic::Sech
    extern Sigmath::Hyperbolic::Csch
    extern Sigmath::Hyperbolic::Coth
    extern Sigmath::Hyperbolic::Asinh
    extern Sigmath::Hyperbolic::Acosh
    extern Sigmath::Hyperbolic::Atanh
    extern Sigmath::Hyperbolic::Asech
    extern Sigmath::Hyperbolic::Acsch
    extern Sigmath::Hyperbolic::Acoth
    global main

main:
    ; Set up the stack frame
    push ebp
    mov ebp, esp

    ; Save any necessary registers

    ; Call Sinh
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Sinh

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Cosh
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Cosh

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Tanh
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Tanh

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Sech
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Sech

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Csch
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Csch

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Coth
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Coth

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Asinh
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Asinh

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Acosh
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Acosh

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Atanh
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Atanh

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Asech
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Asech

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Acsch
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Acsch

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Call Acoth
    mov eax, x   ; Move the value of x to eax
    push eax   ; Push the value of x
    call Sigmath::Hyperbolic::Acoth

    ; The result is in the FPU register(s) depending on the calling convention
    ; Retrieve the result from the FPU register(s) into a general-purpose register

    ; Clean up the stack

    ; Restore any saved registers

    ; Clean up the stack frame
    pop ebp

    ; Return from the function
    ret

