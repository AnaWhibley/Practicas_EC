# Diseñar un programa ensamblador que encienda alternativamente todos los
# leds rojos en posiciones pares y todos los leds rojos en posiciones impares
# de la placa DE2. Nota: observar la asignación de la dirección del espacio de
# direccionamiento del procesador NIOS II de la interfaz paralela de los leds rojos

# ---------------------------- version 1 ---------------------------------

.global _start
_start:

movia r1, 0x10000000                # Puerto paralelo de los leds rojos
movia r2, 0b101010101010101010      # Posiciones pares
movia r3, 0b10101010101010101       # Posiciones impares
                # Un segundo de tiempo
loop:
stwio r2, 0(r1)
movia r4, 0x500000
loopPares:
subi r4, r4, 1
bne r4, r0, loopPares
stwio r3, 0(r1)
movia r4, 0x500000
loopImpares:
subi r4, r4, 1
bne r4, r0, loopImpares
br loop

# ---------------------------- version 2 ---------------------------------

.global _start
_start:

movia r2, 0x10000000  # Leds rojos
movia r3, 0b101010101010101010
movia r4, 0b010101010101010101
movia r5, 0x500000

buclePrincipal:

stwio r3, 0(r2)
addi r6, r0, r5

loopPares:

subi r6, r6, 1
bne r6, r0, loopPares
stwio r4, 0(r2)
addi r6, r0, r5

loopImpares:

subi r6, r6, 1
bne r6, r0, loopImpares
br buclePrincipal
