def ler_ficheiro():
	ficheiro = input("Ficheiro? ")
	with open(ficheiro, "r", encoding="utf-8") as file:
		for linha in file:
			palavras = linha.split()
			lista1.append(palavras)

def ler_virgulas():
	ficheiro = input("Ficheiro? ")
	with open(ficheiro, "r", encoding="utf-8") as file:
		for linha in file:
			palavras = linha.rstrip().split(",")
			lista2.append(palavras)

def main():
    print("JIJEI JOTA")
    ler_ficheiro()
    
    for i in lista1:
        print(i, end=", ")
    print("")

    ler_virgulas()

    for i in lista2:
        print(i, end=" ")
    print("")


lista1 = []
lista2 = []
main()