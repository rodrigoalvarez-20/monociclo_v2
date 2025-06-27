#Ordenamiento Burbuja -- Optimizado
#2025
#UPII Unidad Puebla - IPN
#CIC - IPN
#Circuify

.data
	.word 5
	.word 0
	.word 2
	.word 0
	.word 9
	.word 0
	.word 1
	.word 0
	.word 5
	.word 0
	.word 6
	.word 0
	.word 3
	.word 0
	.word 8
	.word 0
	.word 7
	.word 0
	.word 4
	.word 0
.text
	#consideraciones
	#i a s0
	#arreglo enteros a s1
	#aux a s2
	#ordenado a s3
	#iteraciones a s4
	#limite a s5. Limite son 10 numeros
	addi t0, x0, 5
	sw t0, 0(x0)
	addi t0, x0, 2
	sw t0, 8(x0)
	addi t0, x0, 9
	sw t0, 16(x0)
	addi t0, x0, 1
	sw t0, 24(x0)
	addi t0, x0, 5
	sw t0, 32(x0)
	addi t0, x0, 6
	sw t0, 40(x0)
	addi t0, x0, 3
	sw t0, 48(x0)
	addi t0, x0, 8
	sw t0, 56(x0)
	addi t0, x0, 7
	sw t0, 64(x0)
	addi t0, x0, 4
	sw t0, 72(x0)
	#inicio
	addi s5, x0, 10					#limite = 10
	addi s4, x0, 1					#iteraciones = 1
	do_externo:	
		addi s0, x0, 0				#i = 0
		addi s3, x0, 0				#ordenado = 0
		do_interno:
		slli t0, s0, 3				#offset de i
		addi t1, t0, 8				#offset de i+1
		ld t2, 0(t0)				#enteros[i]
		ld t3, 0(t1)				#enteros[i+1]
			blt t3, t2, verdad		#if (enteros[1] > enteros[i+1]
			jal falso
		verdad:
			#addi s2, t2, 0			#aux = enteros[i]
			#addi t2, t3, 0			#enteros[i] = enteros[i+1] 	
			#addi t3, s2, 0			#enteros[i+1] = aux
			sd t3, 0(t0)
			sd t2, 0(t1)
			addi s3, x0, 1			#ordenado = 1
			falso:
			addi s0, s0, 1			#i++
			sub t5, s5, s4			#10 - iteraciones
		blt s0, t5, do_interno  		#while (i < 10 - iteraciones)
		addi s4, s4, 1				#iteraciones++
	addi t6, x0, 1
	beq s3, t6, do_externo				#while(ordenado)
	addi x0, x0, 0
		
				
			
			