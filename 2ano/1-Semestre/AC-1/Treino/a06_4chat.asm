    .data
msg_param_count: .asciiz "Nr. de parametros: "    # Mensagem inicial para o número de parâmetros
msg_param:       .asciiz "\nP"                    # Prefixo para cada parâmetro (e.g., "P0: ")
colon:           .asciiz ": "                     # String com ": " para separar nome do parâmetro
newline:         .asciiz "\n"                     # Nova linha para formato de saída

    .eqv print_string, 4
    .eqv print_int10, 1

    .text
    .globl main

main:
    # Print "Nr. de parametros: "
    la $a0, msg_param_count        # Carrega a string "Nr. de parametros: " em $a0
    li $v0, print_string           # Código do serviço de impressão de string
    syscall                        # Imprime a string

    # Print argc
    move $a0, $a0                  # Move o valor de argc para $a0 (argc está em $a0)
    li $v0, print_int10            # Código do serviço para imprimir um número inteiro
    syscall                        # Imprime argc

    # Inicializa o índice i para o loop
    li $t0, 0                      # i = 0
    move $t1, $a0                  # t1 = argc (guarda o valor de argc)

loop:
    # Checa se i < argc, sai do loop se i >= argc
    bge $t0, $t1, end_loop

    # Print "\nP"
    la $a0, msg_param              # Carrega a string "\nP"
    li $v0, print_string           # Código do serviço para imprimir string
    syscall                        # Imprime "\nP"

    # Print i
    move $a0, $t0                  # Move o valor de i para $a0
    li $v0, print_int10            # Código do serviço para imprimir um número inteiro
    syscall                        # Imprime i

    # Print ": "
    la $a0, colon                  # Carrega a string ": "
    li $v0, print_string           # Código do serviço para imprimir string
    syscall                        # Imprime ": "

    # Print argv[i]
    # Calcula o endereço de argv[i] (array de ponteiros para strings)
    sll $t2, $t0, 2                # Calcula o deslocamento i * 4 para acessar argv[i]
    add $t3, $a1, $t2              # Calcula o endereço de argv[i] (argv base em $a1)
    lw $a0, 0($t3)                 # Carrega o ponteiro argv[i] em $a0
    li $v0, print_string           # Código do serviço para imprimir string
    syscall                        # Imprime argv[i]

    # Incrementa o índice i
    addi $t0, $t0, 1               # i++

    # Repete o loop
    j loop

end_loop:
    # Finaliza o programa com retorno 0
    li $v0, 10                     # Código do serviço para encerrar o programa
    syscall
