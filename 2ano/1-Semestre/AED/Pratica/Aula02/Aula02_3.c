#include <stdio.h>

// Função que efetua a permutação circular dos valores de três variáveis inteiras
void Permute(int* a, int* b, int* c) {
    int temp = *a;
    *a = *b;
    *b = *c;
    *c = temp;
}

int main() {
    int x = 1, y = 2, z = 3;

    // Imprimir valores antes da permutação
    printf("Antes da permutação: x = %d, y = %d, z = %d\n", x, y, z);

    // Chamar a função de permutação
    Permute(&x, &y, &z);

    // Imprimir valores após a permutação
    printf("Após a permutação: x = %d, y = %d, z = %d\n", x, y, z);

    return 0;
}