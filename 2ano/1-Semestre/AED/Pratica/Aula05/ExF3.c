#include <stdio.h>
#include <math.h>

void f3(int n, int *k, int *soma) {
    if (n == 1) {
        *soma += 1;
        return;
    } else if (n%2 != 0) {
        (*k)++;
        (*k)++;
        *soma += n;
        f3(n / 2, k, soma);
        f3((n + 1) / 2, k, soma);
    } else {
        (*k)++;
        *soma += n;
        f3(n / 2, k, soma);
        *soma = *soma * 2;
    }
}

int main(void) {
    int k, soma, n;
    for (int i = 0; i < 15; i++) {
        k = 0;
        soma = 0;
        n = i + 1;

        f3(n, &k, &soma);

        printf("F3(%d): %d, k: %d\n", i + 1, soma, k);
    }
    return 0;
}