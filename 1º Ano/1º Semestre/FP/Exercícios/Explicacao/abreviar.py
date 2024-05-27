def shorten(palavra):
    resultado = ''
    for letra in palavra:
        if letra.isupper():
            resultado = resultado + letra
    print(resultado)

def main():
    palavra = input("Palavra? ")
    shorten(palavra)


main()
