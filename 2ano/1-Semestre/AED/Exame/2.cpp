#include <stdio.h>
#include <stdlib.h>

// Definição do nó da lista
typedef struct node {
    unsigned int value;
    struct node* next;
} node;

// Função para apagar elementos repetidos da lista
unsigned int DeleteRepetitions(node* p) {
    if (p == NULL) return 0;

    unsigned int count = 0;
    node* current = p;

    while (current != NULL) {
        node* runner = current;
        while (runner->next != NULL) {
            if (runner->next->value == current->value) {
                // Apagar o nó repetido
                node* temp = runner->next;
                runner->next = runner->next->next;
                free(temp);
                count++;
            } else {
                runner = runner->next;
            }
        }
        current = current->next;
    }

    return count;
}

// Função auxiliar para criar um novo nó
node* createNode(unsigned int value) {
    node* newNode = (node*)malloc(sizeof(node));
    newNode->value = value;
    newNode->next = NULL;
    return newNode;
}

// Função auxiliar para imprimir a lista
void printList(node* head) {
    while (head != NULL) {
        printf("%u -> ", head->value);
        head = head->next;
    }
    printf("NULL\n");
}

// Função principal para testar
int main() {
    // Criar uma lista ligada: 1 -> 5 -> 3 -> 5 -> 2 -> 2 -> 4 -> NULL
    node* head = createNode(1);
    head->next = createNode(5);
    head->next->next = createNode(3);
    head->next->next->next = createNode(5);
    head->next->next->next->next = createNode(2);
    head->next->next->next->next->next = createNode(2);
    head->next->next->next->next->next->next = createNode(4);

    printf("Lista original:\n");
    printList(head);

    unsigned int removed = DeleteRepetitions(head);

    printf("\nLista após remover repetições:\n");
    printList(head);

    printf("\nNúmero de elementos apagados: %u\n", removed);

    return 0;
}

