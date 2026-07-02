.model small        ; Modelo de memoria de un solo segmento [1, 7]
.8086               ; Conjunto de instrucciones del 8086 [1, 8]
.stack 512          ; Reserva de espacio para la pila [1, 9]

.data               ; Inicio del segmento de datos [1, 9]

; --- DIRECCIONES PPI NIVEL 1 (Fijo - Nombres) ---
; Conectado a la salida Y0 del decodificador 74HC138
N1_A    equ 0080H
N1_B    equ 0082H
N1_C    equ 0084H
N1_CTRL equ 0086H

; --- DIRECCIONES PPI NIVEL 2 (Móvil - "CIS ACREDITADA") ---
; Conectado a la salida Y1 del decodificador (A3=1)
N2_A    equ 0088H
N2_B    equ 008AH
N2_C    equ 008CH
N2_CTRL equ 008EH

; --- MÁSCARAS DE LETRAS (Extraídas de tus fuentes) [1, 2] ---
; Se definen una por línea para evitar errores de sintaxis
A1 equ 22H
A2 equ 37H
B1 equ 0AH
B2 equ 8FH
C1 equ 00H
C2 equ 39H
D1 equ 08H
D2 equ 8FH
E1 equ 22H
E2 equ 39H
F1 equ 22H
F2 equ 31H
G1 equ 02H
G2 equ 3DH
H1 equ 22H
H2 equ 36H
I1 equ 08H
I2 equ 89H
J1 equ 00H
J2 equ 1EH
K1 equ 25H
K2 equ 30H
L1 equ 00H
L2 equ 38H
M1 equ 01H
M2 equ 76H
NN1 equ 04H
NN2 equ 76H
O1 equ 00H
O2 equ 3FH
P1 equ 22H
P2 equ 33H
Q1 equ 04H
Q2 equ 3FH
R1 equ 26H
R2 equ 33H
S1 equ 22H
S2 equ 2DH
T1 equ 08H
T2 equ 81H
U1 equ 00H
U2 equ 3EH
V1 equ 11H
V2 equ 30H
W1 equ 14H
W2 equ 36H
X1 equ 15H
X2 equ 40H
Y1 equ 09H
Y2 equ 40H
Z1 equ 11H
Z2 equ 09H
ll1 equ 00h
ll2 equ 36H

.code

; --- MACRO PARAMETRIZADA PARA DOS NIVELES ---
print_dual macro p_A, p_B, p_C, dato1, dato2, selec
mov al, dato2
mov dx, p_A
out dx, al
mov al, dato1
mov dx, p_B
out dx, al
mov al, selec
not al
mov dx, p_C
out dx, al
mov al, 00h
not al
mov dx, p_C
out dx, al
endm

inicio:
mov ax, @data
mov ds, ax
mov al, 80h
mov dx, N1_CTRL
out dx, al
mov dx, N2_CTRL
out dx, al



bucle:

mov cx, 2000
C:
print_dual N1_A, N1_B, N1_C, J1, J2, 04h
print_dual N1_A, N1_B, N1_C, E1, E2, 08h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 10h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 20h
print_dual N1_A, N1_B, N1_C, Y1, Y2, 40h

print_dual N2_A, N2_B, N2_C, C1, C2, 80h
loop C

mov cx, 2000
CI:
print_dual N1_A, N1_B, N1_C, J1, J2, 04h
print_dual N1_A, N1_B, N1_C, E1, E2, 08h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 10h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 20h
print_dual N1_A, N1_B, N1_C, Y1, Y2, 40h

print_dual N2_A, N2_B, N2_C, C1, C2, 40h
print_dual N2_A, N2_B, N2_C, I1, I2, 80h
loop CI

mov cx, 2000
CIS:
print_dual N1_A, N1_B, N1_C, J1, J2, 04h
print_dual N1_A, N1_B, N1_C, E1, E2, 08h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 10h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 20h
print_dual N1_A, N1_B, N1_C, Y1, Y2, 40h

print_dual N2_A, N2_B, N2_C, C1, C2, 20h
print_dual N2_A, N2_B, N2_C, I1, I2, 40h
print_dual N2_A, N2_B, N2_C, S1, S2, 80h
loop CIS


mov cx, 2000
CIS_:
print_dual N1_A, N1_B, N1_C, J1, J2, 04h
print_dual N1_A, N1_B, N1_C, E1, E2, 08h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 10h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 20h
print_dual N1_A, N1_B, N1_C, Y1, Y2, 40h

print_dual N2_A, N2_B, N2_C, C1, C2, 10h
print_dual N2_A, N2_B, N2_C, I1, I2, 20h
print_dual N2_A, N2_B, N2_C, S1, S2, 40h
loop CIS_


mov cx, 2000
CIS_A:
print_dual N1_A, N1_B, N1_C, J1, J2, 04h
print_dual N1_A, N1_B, N1_C, E1, E2, 08h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 10h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 20h
print_dual N1_A, N1_B, N1_C, Y1, Y2, 40h

print_dual N2_A, N2_B, N2_C, C1, C2, 08h
print_dual N2_A, N2_B, N2_C, I1, I2, 10h
print_dual N2_A, N2_B, N2_C, S1, S2, 20h
print_dual N2_A, N2_B, N2_C, A1, A2, 80h

loop CIS_A

mov cx, 2000
CIS_AC:
print_dual N1_A, N1_B, N1_C, I1, I2, 04h
print_dual N1_A, N1_B, N1_C, S1, S2, 08h
print_dual N1_A, N1_B, N1_C, M1, M2, 10h
print_dual N1_A, N1_B, N1_C, A1, A2, 20h
print_dual N1_A, N1_B, N1_C, E1, E2, 40h
print_dual N1_A, N1_B, N1_C, L1, L2, 80h


print_dual N2_A, N2_B, N2_C, C1, C2, 04h
print_dual N2_A, N2_B, N2_C, I1, I2, 08h
print_dual N2_A, N2_B, N2_C, S1, S2, 10h
print_dual N2_A, N2_B, N2_C, A1, A2, 40h
print_dual N2_A, N2_B, N2_C, C1, C2, 80h

loop CIS_AC


mov cx, 2000
CIS_ACR:
print_dual N1_A, N1_B, N1_C, I1, I2, 04h
print_dual N1_A, N1_B, N1_C, S1, S2, 08h
print_dual N1_A, N1_B, N1_C, M1, M2, 10h
print_dual N1_A, N1_B, N1_C, A1, A2, 20h
print_dual N1_A, N1_B, N1_C, E1, E2, 40h
print_dual N1_A, N1_B, N1_C, L1, L2, 80h


print_dual N2_A, N2_B, N2_C, C1, C2, 02h
print_dual N2_A, N2_B, N2_C, I1, I2, 04h
print_dual N2_A, N2_B, N2_C, S1, S2, 08h
print_dual N2_A, N2_B, N2_C, A1, A2, 20h
print_dual N2_A, N2_B, N2_C, C1, C2, 40h
print_dual N2_A, N2_B, N2_C, R1, R2, 80h
loop CIS_ACR


mov cx, 2000
CIS_ACRE:
print_dual N1_A, N1_B, N1_C, I1, I2, 04h
print_dual N1_A, N1_B, N1_C, S1, S2, 08h
print_dual N1_A, N1_B, N1_C, M1, M2, 10h
print_dual N1_A, N1_B, N1_C, A1, A2, 20h
print_dual N1_A, N1_B, N1_C, E1, E2, 40h
print_dual N1_A, N1_B, N1_C, L1, L2, 80h


print_dual N2_A, N2_B, N2_C, C1, C2, 01h
print_dual N2_A, N2_B, N2_C, I1, I2, 02h
print_dual N2_A, N2_B, N2_C, S1, S2, 04h
print_dual N2_A, N2_B, N2_C, A1, A2, 10h
print_dual N2_A, N2_B, N2_C, C1, C2, 20h
print_dual N2_A, N2_B, N2_C, R1, R2, 40h
print_dual N2_A, N2_B, N2_C, E1, E2, 80h
loop CIS_ACRE

mov cx, 2000
CIS_ACRED:
print_dual N1_A, N1_B, N1_C, I1, I2, 04h
print_dual N1_A, N1_B, N1_C, S1, S2, 08h
print_dual N1_A, N1_B, N1_C, M1, M2, 10h
print_dual N1_A, N1_B, N1_C, A1, A2, 20h
print_dual N1_A, N1_B, N1_C, E1, E2, 40h
print_dual N1_A, N1_B, N1_C, L1, L2, 80h


print_dual N2_A, N2_B, N2_C, I1, I2, 01h
print_dual N2_A, N2_B, N2_C, S1, S2, 02h
print_dual N2_A, N2_B, N2_C, A1, A2, 08h
print_dual N2_A, N2_B, N2_C, C1, C2, 10h
print_dual N2_A, N2_B, N2_C, R1, R2, 20h
print_dual N2_A, N2_B, N2_C, E1, E2, 40h
print_dual N2_A, N2_B, N2_C, D1, D2, 80h
loop CIS_ACRED


mov cx, 2000
CIS_ACREDI:
print_dual N1_A, N1_B, N1_C, I1, I2, 04h
print_dual N1_A, N1_B, N1_C, S1, S2, 08h
print_dual N1_A, N1_B, N1_C, M1, M2, 10h
print_dual N1_A, N1_B, N1_C, A1, A2, 20h
print_dual N1_A, N1_B, N1_C, E1, E2, 40h
print_dual N1_A, N1_B, N1_C, L1, L2, 80h



print_dual N2_A, N2_B, N2_C, S1, S2, 01h
print_dual N2_A, N2_B, N2_C, A1, A2, 04h
print_dual N2_A, N2_B, N2_C, C1, C2, 08h
print_dual N2_A, N2_B, N2_C, R1, R2, 10h
print_dual N2_A, N2_B, N2_C, E1, E2, 20h
print_dual N2_A, N2_B, N2_C, D1, D2, 40h
print_dual N2_A, N2_B, N2_C, I1, I2, 80h
loop CIS_ACREDI

mov cx, 2000
CIS_ACREDIT:
print_dual N1_A, N1_B, N1_C, E1, E2, 04h
print_dual N1_A, N1_B, N1_C, D1, D2, 08h
print_dual N1_A, N1_B, N1_C, I1, I2, 10h
print_dual N1_A, N1_B, N1_C, L1, L2, 20h





print_dual N2_A, N2_B, N2_C, A1, A2, 02h
print_dual N2_A, N2_B, N2_C, C1, C2, 04h
print_dual N2_A, N2_B, N2_C, R1, R2, 08h
print_dual N2_A, N2_B, N2_C, E1, E2, 10h
print_dual N2_A, N2_B, N2_C, D1, D2, 20h
print_dual N2_A, N2_B, N2_C, I1, I2, 40h
print_dual N2_A, N2_B, N2_C, T1, T2, 80h
loop CIS_ACREDIT




mov cx, 2000
CIS_ACREDITA:
print_dual N1_A, N1_B, N1_C, E1, E2, 04h
print_dual N1_A, N1_B, N1_C, D1, D2, 08h
print_dual N1_A, N1_B, N1_C, I1, I2, 10h
print_dual N1_A, N1_B, N1_C, L1, L2, 20h





print_dual N2_A, N2_B, N2_C, A1, A2, 01h
print_dual N2_A, N2_B, N2_C, C1, C2, 02h
print_dual N2_A, N2_B, N2_C, R1, R2, 04h
print_dual N2_A, N2_B, N2_C, E1, E2, 08h
print_dual N2_A, N2_B, N2_C, D1, D2, 10h
print_dual N2_A, N2_B, N2_C, I1, I2, 20h
print_dual N2_A, N2_B, N2_C, T1, T2, 40h
print_dual N2_A, N2_B, N2_C, A1, A2, 80h
loop CIS_ACREDITA



mov cx, 2000
CIS_ACREDITAD:
print_dual N1_A, N1_B, N1_C, E1, E2, 04h
print_dual N1_A, N1_B, N1_C, D1, D2, 08h
print_dual N1_A, N1_B, N1_C, I1, I2, 10h
print_dual N1_A, N1_B, N1_C, L1, L2, 20h






print_dual N2_A, N2_B, N2_C, C1, C2, 01h
print_dual N2_A, N2_B, N2_C, R1, R2, 02h
print_dual N2_A, N2_B, N2_C, E1, E2, 04h
print_dual N2_A, N2_B, N2_C, D1, D2, 08h
print_dual N2_A, N2_B, N2_C, I1, I2, 10h
print_dual N2_A, N2_B, N2_C, T1, T2, 20h
print_dual N2_A, N2_B, N2_C, A1, A2, 40h
print_dual N2_A, N2_B, N2_C, D1, D2, 80h
loop CIS_ACREDITAD


mov cx, 2000
CIS_ACREDITADA:
print_dual N1_A, N1_B, N1_C, E1, E2, 04h
print_dual N1_A, N1_B, N1_C, D1, D2, 08h
print_dual N1_A, N1_B, N1_C, I1, I2, 10h
print_dual N1_A, N1_B, N1_C, L1, L2, 20h




print_dual N2_A, N2_B, N2_C, R1, R2, 01h
print_dual N2_A, N2_B, N2_C, E1, E2, 02h
print_dual N2_A, N2_B, N2_C, D1, D2, 04h
print_dual N2_A, N2_B, N2_C, I1, I2, 08h
print_dual N2_A, N2_B, N2_C, T1, T2, 10h
print_dual N2_A, N2_B, N2_C, A1, A2, 20h
print_dual N2_A, N2_B, N2_C, D1, D2, 40h
print_dual N2_A, N2_B, N2_C, A1, A2, 80h
loop CIS_ACREDITADA



mov cx, 2000
IS_ACREDITADA:
print_dual N1_A, N1_B, N1_C, J1, J2, 04h
print_dual N1_A, N1_B, N1_C, E1, E2, 08h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 10h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 20h
print_dual N1_A, N1_B, N1_C, Y1, Y2, 40h




print_dual N2_A, N2_B, N2_C, E1, E2, 01h
print_dual N2_A, N2_B, N2_C, D1, D2, 02h
print_dual N2_A, N2_B, N2_C, I1, I2, 04h
print_dual N2_A, N2_B, N2_C, T1, T2, 08h
print_dual N2_A, N2_B, N2_C, A1, A2, 10h
print_dual N2_A, N2_B, N2_C, D1, D2, 20h
print_dual N2_A, N2_B, N2_C, A1, A2, 40h
loop IS_ACREDITADA



mov cx, 2000
S_ACREDITADA:
print_dual N1_A, N1_B, N1_C, J1, J2, 04h
print_dual N1_A, N1_B, N1_C, E1, E2, 08h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 10h
print_dual N1_A, N1_B, N1_C, NN1, NN2, 20h
print_dual N1_A, N1_B, N1_C, Y1, Y2, 40h



print_dual N2_A, N2_B, N2_C, D1, D2, 01h
print_dual N2_A, N2_B, N2_C, I1, I2, 02h
print_dual N2_A, N2_B, N2_C, T1, T2, 04h
print_dual N2_A, N2_B, N2_C, A1, A2, 08h
print_dual N2_A, N2_B, N2_C, D1, D2, 10h
print_dual N2_A, N2_B, N2_C, A1, A2, 20h
loop S_ACREDITADA



mov cx, 2000
_ACREDITADA:
print_dual N1_A, N1_B, N1_C, I1, I2, 04h
print_dual N1_A, N1_B, N1_C, S1, S2, 08h
print_dual N1_A, N1_B, N1_C, M1, M2, 10h
print_dual N1_A, N1_B, N1_C, A1, A2, 20h
print_dual N1_A, N1_B, N1_C, E1, E2, 40h
print_dual N1_A, N1_B, N1_C, L1, L2, 80h





print_dual N2_A, N2_B, N2_C, I1, I2, 01h
print_dual N2_A, N2_B, N2_C, T1, T2, 02h
print_dual N2_A, N2_B, N2_C, A1, A2, 04h
print_dual N2_A, N2_B, N2_C, D1, D2, 08h
print_dual N2_A, N2_B, N2_C, A1, A2, 10h
loop _ACREDITADA


mov cx, 2000
ACREDITADA:
print_dual N1_A, N1_B, N1_C, I1, I2, 04h
print_dual N1_A, N1_B, N1_C, S1, S2, 08h
print_dual N1_A, N1_B, N1_C, M1, M2, 10h
print_dual N1_A, N1_B, N1_C, A1, A2, 20h
print_dual N1_A, N1_B, N1_C, E1, E2, 40h
print_dual N1_A, N1_B, N1_C, L1, L2, 80h







print_dual N2_A, N2_B, N2_C, T1, T2, 01h
print_dual N2_A, N2_B, N2_C, A1, A2, 02h
print_dual N2_A, N2_B, N2_C, D1, D2, 04h
print_dual N2_A, N2_B, N2_C, A1, A2, 08h
loop ACREDITADA



mov cx, 2000
CREDITADA:
print_dual N1_A, N1_B, N1_C, E1, E2, 04h
print_dual N1_A, N1_B, N1_C, D1, D2, 08h
print_dual N1_A, N1_B, N1_C, I1, I2, 10h
print_dual N1_A, N1_B, N1_C, L1, L2, 20h








print_dual N2_A, N2_B, N2_C, A1, A2, 01h
print_dual N2_A, N2_B, N2_C, D1, D2, 02h
print_dual N2_A, N2_B, N2_C, A1, A2, 04h
loop CREDITADA



mov cx, 2000
REDITADA:
print_dual N1_A, N1_B, N1_C, E1, E2, 04h
print_dual N1_A, N1_B, N1_C, D1, D2, 08h
print_dual N1_A, N1_B, N1_C, I1, I2, 10h
print_dual N1_A, N1_B, N1_C, L1, L2, 20h








print_dual N2_A, N2_B, N2_C, D1, D2, 01h
print_dual N2_A, N2_B, N2_C, A1, A2, 02h
loop REDITADA


mov cx, 2000
EDITADA:
print_dual N1_A, N1_B, N1_C, E1, E2, 04h
print_dual N1_A, N1_B, N1_C, D1, D2, 08h
print_dual N1_A, N1_B, N1_C, I1, I2, 10h
print_dual N1_A, N1_B, N1_C, L1, L2, 20h










print_dual N2_A, N2_B, N2_C, A1, A2, 01h
loop EDITADA



jmp bucle


end inicio

