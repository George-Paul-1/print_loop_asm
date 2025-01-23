.global _main 
.align 4 

_main: 
    mov X3, #10 ; set target number 
    mov X4, #0 ; set counter
    bl loop 

loop: 
    adr X1,num ; loading in string
    add X1,X1,X4 ; adding counter to string
    mov X2, #1 ; setting number of bytes to 1
    bl print ; calling print function 
    
    cmp X4,X3 ; comapre counter with target  
    beq exit_success ; exit if equal 
    add X4,X4,#1 ; else increment by 1
    bl loop ; recall loop 

print: 
    mov X16, #4 ; move write syscall into X16 
    mov X0, #1 ; move stdout into X0
    svc #0x80  ; make the call 
    ret  ; return 

exit_success: 
    mov X0, #0
    mov X16, #1 
    svc #0x80

num: 
    .asciz "0123456789\n"