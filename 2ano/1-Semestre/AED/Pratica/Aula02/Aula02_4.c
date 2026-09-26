#include <stdio.h>
#include <stdlib.h>

// Função para exibir o conteúdo de um array
void DisplayArray(double* a, size_t n) {
    if (a == NULL || n == 0) return;
    printf("Array = [");
    for (size_t i = 0; i < n; i++) {
        printf(" %.2f", a[i]);
        if (i < n - 1) {
            printf(",");
        }
    }
    printf(" ]\n");
}

// Função para ler o número de elementos, alocar o array e ler seus elementos
double* ReadArray(size_t* size_p) {
    if (size_p == NULL) return NULL;

    printf("Digite o número de elementos: ");
    scanf("%zu", size_p);

    if (*size_p == 0) return NULL;

    double* array = (double*)malloc(*size_p * sizeof(double));
    if (array == NULL) {
        *size_p = 0;
        return NULL;
    }

    printf("Digite os elementos do array:\n");
    for (size_t i = 0; i < *size_p; i++) {
        scanf("%lf", &array[i]);
    }

    return array;
}

// Função para alocar e retornar um novo array com elementos concatenados
double* Append(double* array_1, size_t size_1, double* array_2, size_t size_2) {
    if (array_1 == NULL || array_2 == NULL || size_1 == 0 || size_2 == 0) return NULL;

    double* new_array = (double*)malloc((size_1 + size_2) * sizeof(double));
    if (new_array == NULL) return NULL;

    for (size_t i = 0; i < size_1; i++) {
        new_array[i] = array_1[i];
    }
    for (size_t i = 0; i < size_2; i++) {
        new_array[size_1 + i] = array_2[i];
    }

    return new_array;
}

int main() {
    size_t size1, size2;
    double* array1 = ReadArray(&size1);
    double* array2 = ReadArray(&size2);

    if (array1 != NULL) {
        DisplayArray(array1, size1);
    }
    if (array2 != NULL) {
        DisplayArray(array2, size2);
    }

    double* concatenated_array = Append(array1, size1, array2, size2);
    if (concatenated_array != NULL) {
        DisplayArray(concatenated_array, size1 + size2);
        free(concatenated_array);
    }

    free(array1);
    free(array2);

    return 0;
}