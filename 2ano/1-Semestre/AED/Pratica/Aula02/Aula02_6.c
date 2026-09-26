#include <stdio.h>

// Função de pesquisa binária
int binary_search(int arr[], int size, int target) {
    int left = 0;
    int right = size - 1;

    while (left <= right) {
        int mid = left + (right - left) / 2; // Corrigir cálculo do índice médio

        if (arr[mid] == target) {
            return mid; // Elemento encontrado
        } else if (arr[mid] < target) {
            left = mid + 1; // Pesquisar na metade direita
        } else {
            right = mid - 1; // Pesquisar na metade esquerda
        }
    }

    return -1; // Elemento não encontrado
}

int main() {
    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int size = sizeof(arr) / sizeof(arr[0]);
    int target = 5;

    int result = binary_search(arr, size, target);

    if (result != -1) {
        printf("Elemento encontrado no índice %d\n", result);
    } else {
        printf("Elemento não encontrado\n");
    }

    return 0;
}