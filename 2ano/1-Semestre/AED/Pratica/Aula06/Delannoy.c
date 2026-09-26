#include <stdio.h>

// Função para calcular o número de Delannoy e contar chamadas e adições
int delannoy(int m, int n, int *c, int *additions) {
    (*c)++;
    if (m == 0 || n == 0) {
        return 1;
    } else {
        int d1 = delannoy(m - 1, n, c, additions);
        int d2 = delannoy(m, n - 1, c, additions);
        int d3 = delannoy(m - 1, n - 1, c, additions);
        (*additions) += 2; // Contar as duas adições realizadas
        return d1 + d2 + d3;
    }
}

int main(void) {
    int m, n, c, additions, num;

    while (1)
    {
        printf("Digite o numero de n&m entre 0 e 13: ");
        scanf("%d", &num);
        if (num > 0 && num < 13) {
            break;
        }
    }
    

    printf("%-10s %-10s %-10s %-10s %-10s\n", "m", "n", "Delannoy", "Chamadas", "Adições");

    for (int i = 0; i < num; i++) {
        m = i;
        n = i;
        c = 0;
        additions = 0;
        int d = delannoy(m, n, &c, &additions);
        printf("%-10d %-10d %-10d %-10d %-10d\n", m, n, d, c, additions);
    }


    printf("\nDelannoy's Matrix - Recursive Function\n\n");

    for (int i = 0; i < num; i++) {
        for (int j = 0; j < num; j++) {
            c = 0;
            additions = 0;
            int d = delannoy(i, j, &c, &additions);
            printf("%-10d ", d);
        }
        printf("\n");
    }

    return 0;
}