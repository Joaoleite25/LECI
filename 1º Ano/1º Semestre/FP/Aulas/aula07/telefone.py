# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {}".format("Numero", "Nome"))
    for num in dic:
        print("{:>12s} : {}".format(num, dic[num]))

def filterNumber(contactos):
    """Returns a new dict with the name whose number id."""
    while True:
        verificacao = 0
        num = str(input("Numero: "))
        if len(num) == 9:
            if num in contactos:
                verificacao = 1
            else:
                print("Esse número não está a ser utilizado!")
        else:
            print("O número deve ter 9 dígitos!")
        if verificacao == 1:
            print("O nome correspondente a esse número é:", contactos[num])
            break
    
def filterPartName(contactos):
    """Returns a new dict with the contacts whose names contain partName."""
    while True:
        verificacao = 0
        nome = str(input("Nome: "))
        if len(nome) > 0:
            if nome in contactos:
                verificacao = 1
            else:
                print("Esse nome não está a ser utilizado!")
        else:
            print("Tem de inserir um nome!")
        if verificacao == 1:
            print("O numero correspondente a esse nome é:", contactos[num])
            break
    


def addContacts(contactos):
    while True:
        count = 0
        num = str(input("Numero: "))
        if len(num) == 9:
            if not (num in contactos):
                for letra in num:
                    if letra.isdigit() == False:
                        print("O número só pode conter numeros!")
                        break
                    else:
                        count += 1
            else:
                print("Esse número já está a ser utilizado!")
                pergunta = input("Quer trocar o nome desse número?(S/s) Caso não pretenda, clique em ENTER " ).upper()
                if pergunta == "S":
                    count = 9
        else:
            print("O número deve ter 9 dígitos!")
        if count == 9:
            break
    while True: 
        count = 0
        nome = str(input("Nome: "))
        if len(nome) > 0:
            for letra in nome:
                if letra.isdigit() == True:
                    print("O nome só pode conter letras!")
                    break
                else:
                    count += 1
        else:
            print("Tem de inserir um nome!")
        if count == len(nome):
            break
    contactos[num] = nome
    return contactos

def removeContacts(contactos):
    while True:
        verificacao = 0
        num = str(input("Numero: "))
        if len(num) == 9:
            if num in contactos:
                verificacao = 1
            else:
                print("Esse número não está a ser utilizado!")
        else:
            print("O número deve ter 9 dígitos!")
        if verificacao == 1:
            break
    del contactos[num]
    return contactos

def menu():
    """Shows the menu and gets user option."""
    print()
    print("(L)istar contactos")
    print("(A)dicionar contacto")
    print("(R)emover contacto")
    print("Procurar (N)úmero")
    print("Procurar (P)arte do nome")
    print("(T)erminar")
    op = input("opção? ").upper()   # converts to uppercase...
    return op


def main():
    """This is the main function containing the main loop."""

    # The list of contacts (it's actually a dictionary!):
    contactos = {"234370200": "Universidade de Aveiro",
        "727392822": "Cristiano Aveiro",
        "387719992": "Maria Matos",
        "887555987": "Marta Maia",
        "876111333": "Carlos Martins",
        "433162999": "Ana Bacalhau"
        }

    op = ""
    while op != "T":
        op = menu()
        if op == "T":
            print("Fim")
        elif op == "L":
            print("Contactos:")
            listContacts(contactos)
        elif op == "A":
            print("Adicionar Contacto:")
            contactos = addContacts(contactos)
        elif op == "R":
            print("Remover Contacto:")
            contactos = removeContacts(contactos)
        elif op == "N":
            print("Pesquisa por número:")
            filterNumber(contactos)
        elif op == "P":
            print("Pesquisa por Nome:")
            filterPartName(contactos)
    

# O programa começa aqui
main()

