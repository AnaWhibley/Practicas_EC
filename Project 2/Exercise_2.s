# Diseñar un programa ensamblador que encienda alternativamente cada uno de
# los leds verdes de la placa DE2. Nota: observar la asignación de la dirección
# del espacio de direccionamiento del procesador NIOS II de la interfaz paralela
# de los leds verdes

.global _start
_start:

movia r1, 0x10000010    # Principio leds verdes
addi r2, r0, 1
movia r3, 0x500000   # Un segundo de tiempo
addi r4, r0, 9

loopP:
subi r3, r3, 1
bne r3, r0, loopP
stwio r2, 0(r1)
roli r2, r2, 1
subi r4, r4, 1
movia r3, 0x500000
beq r4, r0, _start
br loopP
