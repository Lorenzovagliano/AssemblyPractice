.data 

      vetor:  .word 200, 190, 340, 100 # exemplo 


##### START MODIFIQUE AQUI START ##### 
# 

# Este espaço é para você definir as suas constantes e vetores auxiliares. 

#
##### END MODIFIQUE AQUI END ##### 

.text     

    jal ra, main  

# Ao final do reajuste (aplica_reajuste) você deve retornar o programa para a próxima instrução abaixo, que consiste na correção/verificação. 

 ##### START INSTRUÇÃO DE CORREÇÃO/VERIFICAÇÃO ##### 

   # utilizado para correção (considerando um limiar de 200 para o vetor de      exemplo após a aplicação do reajuste. 

  

addi a4, x0, 3 # configurando a quantidade de salários acima do limiar de 200. 
  

beq a4, t0, FIM # Verifica a quantidade de salários acima do limiar. 

 

 ##### END INSTRUÇÃO DE CORREÇÃO/VERIFICAÇÃO ##### 

 

main:
    ##### START MODIFIQUE AQUI START #####
    addi sp, sp -4
    sw ra, 0(sp)
    
    jal ra aplica_reajuste
    
    lw ra 0(sp)
    addi sp, sp, 4
    jalr zero, (0)ra
    ##### END MODIFIQUE AQUI END #####

aplica_reajuste:
    ##### START MODIFIQUE AQUI START #####
    addi sp, sp -4
    sw ra, 0(sp)

    la a0, vetor        # inicializar o endereço do vetor em a0
    li a2, 200  		# Inicializar o valor do limiar em a2 como 200 (*** CORRETOR, ALTERAR TAMANHO DO LIMIAR AQUI ***)
    add t1, x0, x0      # Inicializar o counter do loop t1 como 0
    li a1, 4      		# Inicializar a1 como o tamanho do loop (*** CORRETOR, ALTERAR TAMANHO DO VETOR AQUI ***)
    add t0, x0, x0      # Inicializar o counter para elementos acima do limiar em t0 como 0

    L3:
        lw t4, 0(a0)    # Colocar o elemento atual do vetor em t4
        li t5, 3  		# Colocar 3 em t5
        li a3, 2 		# colocar 2 em a3

        mul t4, t4, t5  # Multiplicar o elemento atual por 3
        div t4, t4, a3 	# Dividir o elemento atual por 2

        bgt t4, a2, greater_than_threshold  # Checar se o resultado é maior do que o limiar

        j not_greater_than_threshold

    greater_than_threshold:
        addi t0, t0, 1  # Incrementar o counter para elementos acima do limiar

    not_greater_than_threshold:
        sw t4, 0(a0)    # Colocar o resultado no vetor

        addi a0, a0, 4  # Mover para o próximo elemento do vetor
        addi t1, t1, 1  # Incrementar ou counter do loop

        bne t1, a1, L3  # Checar se chegamos ao fim do array, se não, continuar o loop

    lw ra 0(sp)
    addi sp, sp, 4

    jalr x0 0(ra) # Retornar função


##### END MODIFIQUE AQUI END #####

 

FIM: addi x0, x0, 1 