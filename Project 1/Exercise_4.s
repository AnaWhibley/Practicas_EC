# Escribe un programa que calcule la serie de Fibonacci de los 8 primeros números
# (0, 1, 1, 2, 3, 5, 8, 13). Observar que los dos primeros números son 0, 1.

.global _start

.text

_start:
movia r2, VECTOR
movia r3, CONTADOR
ldw r6, 0(r3)
add r4, r4, r0
addi r5, r5, 1
stw r4, 0(r2)
stw r5, 4(r2)
addi r2, r2, 4

bucle:
subi r6, r6, 1
add r7, r4, r5
stw r7, 0(r2)
addi r2, r2, 4
mov r4, r5
mov r5, r7
and r7, r7, r0
bne r6, r0, bucle

STOP:
br STOP

.org 0xf0
CONTADOR:
.word 6

.org 0x100
VECTOR:
.skip 32


.end
