# Dados tres valores enteros almacenados a partir de la
# dirección de memoria 0x1000, diseñar un programa ensamblador
# que sume los tres valores y almacene.
# SUMA_DOS: realiza la operación r2=r2+r3.
# SUMA_TRES: realiza la operación r5=r2+r3+r4 llamando a SUMA_DOS.
# Programa principal: realiza la operación pedida llamando a SUMA_TRES.
# Nota: Propón los tres valores a sumar.

# ------------------------------ version 1 ------------------------------

.global _start

.text

_start:

movia sp, 0x007FFFFC
movia r6, A
movia r8, B
movia r9, C
ldw r2, 0(r6)   # Primer número
ldw r3, 0(r8)   # Segundo número
ldw r4, 0(r9)   # Tercer número
movia r7, RESULT
call SUMA_TRES
stw r5, 0(r7)

STOP:
br STOP

SUMA_DOS:
add r2, r2, r3
ret

SUMA_TRES:
stw ra, 0(sp)
subi sp, sp, 4
call SUMA_DOS

add r5, r2, r4

addi sp, sp, 4
ldw ra, 0(sp)
ret

.org 0x1000
A: .word 2
B: .word 4
C: .word 6
RESULT: .skip 4
.end

# ------------------------------ version 1 ------------------------------

.global _start

.text

_start:

movia sp, 0x007FFFFC
movia r6, A
movia r8, B
movia r9, C
ldw r2, 0(r6)   # Primer número
ldw r3, 0(r8)   # Segundo número
ldw r4, 0(r9)   # Tercer número
movia r7, RESULT
call SUMA_TRES
stw r5, 0(r7)

STOP:
br STOP

SUMA_DOS:
stw ra, 0(sp)
subi sp, sp, 4
add r2, r2, r3
addi sp, sp, 4
ldw ra, 0(sp)
ret

SUMA_TRES:
stw ra, 0(sp)
subi sp, sp, 4
call SUMA_DOS

mov r3, r4
# stw ra, 0(sp)
# subi sp, sp, 4
call SUMA_DOS

mov r5, r2

addi sp, sp, 4
ldw ra, 0(sp)
ret

.org 0x1000
A: .word 2
B: .word 4
C: .word 6
RESULT: .skip 4
.end
