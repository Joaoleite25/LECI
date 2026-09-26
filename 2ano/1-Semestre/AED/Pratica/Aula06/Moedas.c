#include <stdio.h>
#include <stdlib.h>

// Função iterativa para calcular o valor da solução ótima usando Programação Dinâmica
// e identificar as moedas que constituem essa solução
void maxSubsetSumIterative(int* coins, int n) {
    if (n == 0) {
        printf("O valor da solução ótima é: 0\n");
        printf("Moedas na solução ótima: Nenhuma\n");
        return;
    }
    if (n == 1) {
        printf("O valor da solução ótima é: %d\n", coins[0]);
        printf("Moedas na solução ótima: %d\n", coins[0]);
        return;
    }

    int* V = (int*)malloc((n + 1) * sizeof(int));
    int* selected = (int*)malloc((n + 1) * sizeof(int)); // Array para rastrear as escolhas
    int comparisons = 0; // Contador de comparações

    V[0] = 0;
    V[1] = coins[0];
    selected[0] = 0;
    selected[1] = 1;

    for (int i = 2; i <= n; i++) {
        comparisons++;
        if (coins[i - 1] + V[i - 2] > V[i - 1]) {
            V[i] = coins[i - 1] + V[i - 2];
            selected[i] = 1; // Moeda i-1 é selecionada
        } else {
            V[i] = V[i - 1];
            selected[i] = 0; // Moeda i-1 não é selecionada
        }
    }

    int result = V[n];
    printf("O valor da solução ótima é: %d\n", result);
    printf("Número de comparações: %d\n", comparisons);

    // Identificar as moedas que constituem a solução ótima
    printf("Moedas na solução ótima: ");
    for (int i = n; i > 0;) {
        if (selected[i] == 1) {
            printf("%d ", coins[i - 1]);
            i -= 2; // Pular a moeda adjacente
        } else {
            i -= 1;
        }
    }
    printf("\n");

    free(V);
    free(selected);
}

int main() {
    int coins[] = {5, 1, 2, 10, 6, 2};
    int n = sizeof(coins) / sizeof(coins[0]);

    maxSubsetSumIterative(coins, n);

    return 0;
}