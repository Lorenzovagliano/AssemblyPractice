.data 

vetor: .word 2 1 4 7 

 

##### START MODIFIQUE AQUI START ##### 

# 

# Este espaço é para você definir as suas constantes e vetores auxiliares. 

# 
##### END MODIFIQUE AQUI END ##### 

 

.text 

jal x1, contador 

addi x14, x0, 2 # utilizado para correção 

beq x14, x10, FIM # Verifica $ de pares 

beq x14, x11, FIM # Verifica # de ímpares 

 

##### START MODIFIQUE AQUI START ##### 

contador:
		addi sp, sp -4
        sw ra, 0(sp)

        # Inicializar contadores em 0
        li x10, 0	#x10 é o contador par
        li x11, 0   #x11 é o contador ímpar

        # Inicializar o endereço do vetor em t2
        la t2, vetor

        # Inicializar o tamanho do vetor em t2 (*** CORRETOR, ALTERAR TAMANHO DO VETOR AQUI ***)
        li t3, 4

        # loop para iterar pelo vetor
        loop:
            lw t0, 0(t2)     # Colocar o elemento atual em t0
            andi t1, t0, 1   # Checar se o element é par
            beqz t1, par     # Se o resultado for zero(é par), pular para a label "par"

            # Se o elemento for ímpar, aumentar o counter do ímpar(x11)
            addi x11, x11, 1
            j next_iteration

        par:
            # Se o elemento for par, aumentar o counter do par(x10)
            addi x10, x10, 1

        next_iteration:
            addi t2, t2, 4   # Move para o próximo elemento do vetor (4 bytes)
            addi t3, t3, -1  # Diminuir o tamanho restando do vetor
            bnez t3, loop    # Se ainda houverem elementos no vetor, voltar ao loop

        # Retornar a função
        lw ra 0(sp)
        addi sp, sp, 4
        
        jalr x0 0(ra)

 

##### END MODIFIQUE AQUI END ##### 

 

FIM: addi x0, x0, 1 