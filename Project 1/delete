# Dado N un valor entero almacenado en la dirección de memoria 0xf0, diseñar un
# programa ensamblador que almacene en memoria, a partir de la dirección 0x100, un
# vector de palabras formado por los N primeros números pares. Nota: Propón un valor de N.
# El programa comienza en la dirección 0x100 = 256
# El valor entero debe estar almacenado en la dirección 0xf0 = 240

# Ejercicio 1

.global _start

_start:
ldw r5, N(r0)    # Registro que contiene el número par que hemos indicado en N
movia r6, VECTOR # r6 apunta a la dirección en la que empieza el vector

bucle:
stw r4, 0(r6)
subi r5,r5, 1
addi r4, r4, 2
addi r6, r6, 4
bge r2, r0, bucle

STOP:
br STOP

.org 0xf0
N: .word 8
.org 0x100
VECTOR: .skip 32
.end
