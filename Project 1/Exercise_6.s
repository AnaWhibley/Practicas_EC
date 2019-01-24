# Calcular el producto escalar de 2 vectores con 6 elementos cada uno de ellos.
# Propón los seis valores de 32 bits de cada vector. El resultado debe
# almacenarse en la posición de memoria siguiente al último componente de uno
# de los vectores.

# Ejercicio 6

.global _start
.text

_start:
movia r2, AVECTOR
movia r3, BVECTOR
movia r4, RESULTADO
ldw r5, 0(r2)
ldw r6, 0(r3)
addi r7, r0, 6
addi r8, r0, 0

producto:
subi r7, r7, 1
call multiplicacion
add r8, r8, r9
addi r2, r2, 4
addi r3, r3, 4
ldw r5, 0(r2)
ldw r6, 0(r3)
beq r7, r0, salir
br producto

multiplicacion:
mul r9, r5, r6
ret

salir:
stw r8, 0(r4)       # O stw r8, 52(r4)

stop:
br stop

.org 0x100
AVECTOR:  .word 2, 4, 6, 8, 10, 12
BVECTOR:  .word 1, 2, 3, 4, 5, 6

.org 0x130
RESULTADO: .skip 4
.end
