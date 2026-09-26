#include <stdio.h>

// Função para contar elementos que respeitam a propriedade
int count_elements_with_property(int array[], int n, int *comparisons)
{
    int count = 0;
    *comparisons = 0;

    for (int i = 1; i < n - 1; i++)
    {
        (*comparisons)++;
        if (array[i] == array[i - 1] + array[i + 1])
        {
            count++;
        }
    }

    return count;
}

int main()
{
    int sequences[5][10] = {
        {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
        {1, 2, 1, 4, 5, 6, 7, 8, 9, 10},
        {1, 2, 1, 3, 2, 6, 7, 8, 9, 10},
        {0, 2, 2, 0, 3, 3, 0, 4, 4, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}};

    for (int i = 0; i < 5; i++)
    {
        int comparisons = 0;
        int count = count_elements_with_property(sequences[i], 10, &comparisons);
        printf("Sequência %d: %d elementos obedecem à condição, %d comparações efetuadas\n", i + 1, count, comparisons);
    }

    return 0;
}