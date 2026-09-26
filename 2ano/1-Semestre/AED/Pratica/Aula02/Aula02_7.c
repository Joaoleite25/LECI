#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Função para executar o Crivo de Eratóstenes
void sieve_of_eratosthenes(int n) {
    bool *prime = (bool *)malloc((n + 1) * sizeof(bool));
    if (prime == NULL) {
        fprintf(stderr, "Erro ao alocar memória\n");
        return;
    }

    // Inicializar todos os números como primos
    for (int i = 0; i <= n; i++) {
        prime[i] = true;
    }

    for (int p = 2; p * p <= n; p++) {
        // Se prime[p] não for alterado, então é um número primo
        if (prime[p] == true) {
            // Atualizar todos os múltiplos de p como não primos
            for (int i = p * p; i <= n; i += p) {
                prime[i] = false;
            }
        }
    }

    // Imprimir todos os números primos
    printf("Números primos menores ou iguais a %d:\n", n);
    for (int p = 2; p <= n; p++) {
        if (prime[p]) {
            printf("%d ", p);
        }
    }
    printf("\n");

    // Liberar a memória alocada
    free(prime);
}

int main() {
    int n;
    printf("Digite um número inteiro positivo: ");
    scanf("%d", &n);

    if (n < 2) {
        printf("Não há números primos menores que 2.\n");
        return 1;
    }

    sieve_of_eratosthenes(n);

    return 0;
}