#include <stdio.h>
#include <math.h>

void f1(int n, int *k, int *soma) {
    if (n == 1) {
        *soma += 1;
        return;
    } else {
        (*k)++;
        *soma += n;
        f1(n / 2, k, soma);
    }
}

int main(void) {
    int k, soma, n;
    for (int i = 0; i < 15; i++) {
        k = 0;
        soma = 0;
        n = i + 1;

        f1(n, &k, &soma);

        printf("F1(%d): %d, k: %d\n", i + 1, soma, k);
    }
    return 0;
}