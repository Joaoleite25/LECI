#include <stdio.h>
#include <math.h>

// Função para exibir um polinômio
void DisplayPol(double* coef, size_t degree) {
    if (coef == NULL || degree < 0) return;
    printf("Pol(x) = ");
    for (size_t i = 0; i <= degree; i++) {
        printf("%.6f * x^%zu", coef[i], degree - i);
        if (i < degree) {
            printf(" + ");
        }
    }
    printf("\n");
}

// Função para calcular o valor de um polinômio usando o método de Horner
double ComputePol(double* coef, size_t degree, double x) {
    if (coef == NULL || degree < 0) return 0.0;
    double result = coef[0];
    for (size_t i = 1; i <= degree; i++) {
        result = result * x + coef[i];
    }
    return result;
}

// Função para calcular as raízes reais de um polinômio de segundo grau
unsigned int GetRealRoots(double* coef, size_t degree, double* root_1, double* root_2) {
    if (coef == NULL || degree != 2 || coef[0] == 0 || root_1 == NULL || root_2 == NULL) return 0;

    double a = coef[0];
    double b = coef[1];
    double c = coef[2];
    double discriminant = b * b - 4 * a * c;

    if (discriminant < 0) {
        *root_1 = 0.0;
        *root_2 = 0.0;
        return 0;
    } else if (discriminant == 0) {
        *root_1 = *root_2 = -b / (2 * a);
        return 1;
    } else {
        *root_1 = (-b + sqrt(discriminant)) / (2 * a);
        *root_2 = (-b - sqrt(discriminant)) / (2 * a);
        return 2;
    }
}

int main() {
    // Polinômio de exemplo: x^2 + 4x + 1
    double coef[] = {1.0, 4.0, 1.0};
    size_t degree = 2;

    // Exibir o polinômio
    DisplayPol(coef, degree);

    // Calcular o valor do polinômio para x = 2
    double x = 2.0;
    double value = ComputePol(coef, degree, x);
    printf("Pol(%.6f) = %.6f\n", x, value);

    // Calcular as raízes reais do polinômio
    double root_1, root_2;
    unsigned int num_roots = GetRealRoots(coef, degree, &root_1, &root_2);

    if (num_roots == 0) {
        printf("Não há raízes reais.\n");
    } else if (num_roots == 1) {
        printf("Uma raiz real com multiplicidade 2: %.6f\n", root_1);
    } else {
        printf("Duas raízes reais distintas: %.6f e %.6f\n", root_1, root_2);
    }

    return 0;
}