#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX_LEN 100

int main() {
    char str1[MAX_LEN], str2[MAX_LEN], str2_copy[MAX_LEN], concat_str[MAX_LEN * 2];
    int count_alpha = 0, count_upper = 0;

    // Ler as duas strings
    printf("Digite a primeira string: ");
    fgets(str1, MAX_LEN, stdin);
    str1[strcspn(str1, "\n")] = '\0'; // Remover o newline

    printf("Digite a segunda string: ");
    fgets(str2, MAX_LEN, stdin);
    str2[strcspn(str2, "\n")] = '\0'; // Remover o newline

    // Contar caracteres da primeira string que são letras do alfabeto
    for (int i = 0; str1[i] != '\0'; i++) {
        if (isalpha(str1[i])) {
            count_alpha++;
        }
    }

    // Contar caracteres da segunda string que são letras maiúsculas
    for (int i = 0; str2[i] != '\0'; i++) {
        if (isupper(str2[i])) {
            count_upper++;
        }
    }

    // Converter todas as letras maiúsculas das duas strings para minúsculas
    for (int i = 0; str1[i] != '\0'; i++) {
        str1[i] = tolower(str1[i]);
    }
    for (int i = 0; str2[i] != '\0'; i++) {
        str2[i] = tolower(str2[i]);
    }

    // Comparar as duas strings resultantes
    int cmp_result = strcmp(str1, str2);
    if (cmp_result == 0) {
        printf("As strings são iguais.\n");
    } else if (cmp_result < 0) {
        printf("Ordem lexicográfica: %s, %s\n", str1, str2);
    } else {
        printf("Ordem lexicográfica: %s, %s\n", str2, str1);
    }

    // Criar uma cópia da segunda string
    strcpy(str2_copy, str2);

    // Concatenar a segunda string com a sua cópia
    strcpy(concat_str, str2);
    strcat(concat_str, str2_copy);

    // Imprimir a string resultante da concatenação
    printf("String concatenada: %s\n", concat_str);

    // Imprimir contagens
    printf("Número de letras na primeira string: %d\n", count_alpha);
    printf("Número de letras maiúsculas na segunda string: %d\n", count_upper);

    return 0;
}