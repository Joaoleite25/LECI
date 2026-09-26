#include <stdio.h>
#include <math.h>

void f2(int n, int *k, int *soma) {
    if (n == 1) {
        *soma += 1;
        return;
    } else {
        (*k)++;
        (*k)++;
        *soma += n;
        f2(n / 2, k, soma);
        f2((n + 1) / 2, k, soma);
    }
}

int main(void) {
    int k, soma, n;
    for (int i = 0; i < 15; i++) {
        k = 0;
        soma = 0;
        n = i + 1;

        f2(n, &k, &soma);

        printf("F2(%d): %d, k: %d\n", i + 1, soma, k);
    }
    return 0;
}