#include <iregdef.h>
.set noreorder
.text
.globl start
.ent start
start: jal wait # Wait for button click
nop
lui s0, 0xbf90 #Load switch port address
lb s1, 0x0(s0) #read first number from switches
nop
jal wait #Wait for button click
nop
lb s2, 0x0(s0) #Read second number from switches
nop
addu s3, s1, s2 #Perform an arithmetic operation
sb s3, 0x0(s0) #Wirte the result to LEDs
b start #Repeat all over again
nop
###Add code for wait subroutine here! ###
wait: 
lui t0, 0xbfa0
lb t1, 0x0(t0)
nop
andi t1, t1, 0x1
nop
beq $0, t1, wait
nop
wait2: 
lui t0, 0xbfa0
lb t1, 0x0(t0)
nop
andi t1, t1, 0x1
nop
bne $0, t1, wait2
nop
jr ra
.end start