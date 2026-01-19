#include <stdio.h>
#include <stdlib.h>

unsigned int* Partition(unsigned int* a, unsigned int n) {
    // Alocar memória para o novo vetor
    unsigned int* result = (unsigned int*)malloc(n * sizeof(unsigned int));
    if (!result) {
        printf("Erro ao alocar memória.\n");
        return NULL;
    }

    // Índices para as duas partições
    unsigned int oddIndex = 0; // Para números ímpares
    unsigned int evenIndex = n - 1; // Para números pares

    // Iterar pelo vetor original
    for (unsigned int i = 0; i < n; i++) {
        if (a[i] % 2 != 0) {
            // Números ímpares vão para o início (ordem crescente)
            result[oddIndex++] = a[i];
        } else {
            // Números pares vão para o fim (ordem decrescente)
            result[evenIndex--] = a[i];
        }
    }

    // Ordenar a partição de ímpares (crescente)
    for (unsigned int i = 0; i < oddIndex - 1; i++) {
        for (unsigned int j = i + 1; j < oddIndex; j++) {
            if (result[i] > result[j]) {
                unsigned int temp = result[i];
                result[i] = result[j];
                result[j] = temp;
            }
        }
    }

    // Ordenar a partição de pares (decrescente)
    for (unsigned int i = n - 1; i > evenIndex + 1; i--) {
        for (unsigned int j = evenIndex + 1; j < i; j++) {
            if (result[j] < result[j + 1]) {
                unsigned int temp = result[j];
                result[j] = result[j + 1];
                result[j + 1] = temp;
            }
        }
    }

    return result;
}

// Função principal para testar
int main() {
    unsigned int a[] = {1, 2, 3, 4, 5};
    unsigned int n = sizeof(a) / sizeof(a[0]);

    unsigned int* result = Partition(a, n);

    if (result) {
        printf("Vetor resultante: ");
        for (unsigned int i = 0; i < n; i++) {
            printf("%u ", result[i]);
        }
        printf("\n");

        // Liberar memória alocada
        free(result);
    }

    return 0;
}

