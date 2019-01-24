# Encuentra el número mayor de la siguiente lista de números enteros:
# 4, 5, 3, 6, 1, 8, 2. Almacena el resultado en una posición de memoria.

.global _start

.text

_start:
movia r2, VECTOR
movia r3, CONTADOR
ldw r4, 0(r2)
ldw r5, 0(r3)

bucle:
subi r5, r5, 1
beq r5, r0, DONE
addi r2, r2, 4
ldw r6, 0(r2)
bge r4, r6, bucle
mov r4, r6
br blucle

DONE:
stw r4, 4(r3)

STOP:
br STOP

.org 0x1000
VECTOR:
.word 4, 5, 3, 6, 1, 8, 2

.org 0x101C
CONTADOR:
.word 7
RESULTADO:
.skip 4


.end
