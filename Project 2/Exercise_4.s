# Diseñar un programa ensamblador que encienda en la placa DE2 los leds rojos
# correspondientes a los interruptores que no estén activados.

.global _start
_start:
movia r2, 0x10000000
movia r3, 0x10000040

loop:

ldwio r4, 0(r3)
stwio r4, 0(r2)
br loop
