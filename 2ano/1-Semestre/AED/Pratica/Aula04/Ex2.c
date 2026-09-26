#include <stdio.h>

// Função para verificar se uma sequência é uma progressão geométrica
int is_geometric_progression(int array[], int n, int *multiplications, int *divisions) {
    if (n <= 2) return 0;

    *multiplications = 0;
    *divisions = 0;

    // Verificar se o primeiro elemento é zero para evitar divisão por zero
    if (array[0] == 0) return 0;

    double r = (double)array[1] / array[0];
    (*divisions)++;

    for (int i = 2; i < n; i++) {
        (*multiplications)++;
        if (array[i] != r * array[i - 1]) {
            return 0;
        }
    }

    return 1;
}

int main() {
    int sequences[9][10] = {
        {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
        {1, 2, 4, 4, 5, 6, 7, 8, 9, 10},
        {1, 2, 4, 8, 5, 6, 7, 8, 9, 10},
        {1, 2, 4, 8, 16, 6, 7, 8, 9, 10},
        {1, 2, 4, 8, 16, 32, 7, 8, 9, 10},
        {1, 2, 4, 8, 16, 32, 64, 8, 9, 10},
        {1, 2, 4, 8, 16, 32, 64, 128, 9, 10},
        {1, 2, 4, 8, 16, 32, 64, 128, 256, 10},
        {1, 2, 4, 8, 16, 32, 64, 128, 256, 512}
    };

    for (int i = 0; i < 9; i++) {
        int multiplications = 0;
        int divisions = 0;
        int result = is_geometric_progression(sequences[i], 10, &multiplications, &divisions);
        printf("Sequência %d: %s, %d multiplicações, %d divisões\n", i + 1, result ? "é uma progressão geométrica" : "não é uma progressão geométrica", multiplications, divisions);
    }

    return 0;
}