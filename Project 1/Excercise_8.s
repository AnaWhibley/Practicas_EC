# Selecciona de la lista adjunta las instrucciones que se deben incluir en
# las posiciones 4, 6, y 10 del programa en ensamblador para que se pueda
# ejecutar correctamente en DE2. El programa realiza la siguiente funcionalidad:
# N es un valor entero almacenado en la dirección de memoria 0xf0, y el programa
# almacena en memoria, a partir de la dirección 0x100, un vector de palabras
# formado por los N primeros números pares. 

# Ejercicio 8

.global _start

_start:
ldw r2, N(r0)   # Registro que contiene el número par que hemos indicado en N
addi r3, r0, 2  # Registro que contiene un dos para los numeros pares
movia r4, V     # Apunta a la dirección en la que empieza el vector
LOOP:
stw r3, 0(r4)   # Almacena lo que hay en r3 en r4 (comienza el vector desde 2)
subi r2, r2, 1  # Le resta 1 a la cantidad total de números que hay que mostrar
addi r3, r3, 2  # Suma a lo que hay en r3 un 2 para formar numeros pares
addi r4, r4, 4  # Avanza en el puntero de la dirección 4
bne r2, r0, LOOP  # Si r2 ha acabado es que es menor de 0, sino, sigue
STOP:
br STOP
.org 0xf0
N: .word 12
.org 0x100
V: .skip 48
.end
