# Preencha a lista com os números mecanográficos dos autores.
AUTORES = [112771, 120562]

import random
import wordlist

def Interfacedaforca(index):
        if index==0:
                print('         _____ ')
                print('         |   | ')
                print('         O   | ')
                print('        /|\  | ')
                print('        / \  | ')
                print('             | ')
                print('     ________|_')
                return
        if index==1:
                print('         _____ ')
                print('         |   | ')
                print('         O   | ')
                print('        /|\  | ')
                print('        /    | ')
                print('             | ')
                print('     ________|_')
                return
        if index==2:
                print('         _____ ')
                print('         |   | ')
                print('         O   | ')
                print('        /|\  | ')
                print('             | ')
                print('             | ')
                print('     ________|_')
                return
        if index==3:
                print('         _____ ')
                print('         |   | ')
                print('         O   | ')
                print('        /|   | ')
                print('             | ')
                print('             | ')
                print('     ________|_')
                return
        if index==4:
                print('         _____ ')
                print('         |   | ')
                print('         O   | ')
                print('         |   | ')
                print('             | ')
                print('             | ')
                print('     ________|_')
                return
        if index==5:
                print('         _____ ')
                print('         |   | ')
                print('         O   | ')
                print('             | ')
                print('             | ')
                print('             | ')
                print('     ________|_')
                return
        if index==6:
                print('         _____ ')
                print('         |   | ')
                print('             | ')
                print('             | ')
                print('             | ')
                print('             | ')
                print('     ________|_')
                return
        if index==7:
                print('         _____ ')
                print('             | ')
                print('             | ')
                print('             | ')
                print('             | ')
                print('             | ')
                print('     ________|_')
                return
        if index==8:
                print('               ')
                print('             | ')
                print('             | ')
                print('             | ')
                print('             | ')
                print('             | ')
                print('     ________|_')
                return
        if index==9:
                print('               ')
                print('               ')
                print('               ')
                print('               ')
                print('               ')
                print('               ')
                print('     ________|_')
                return



def main():
    from wordlist import words1, words2
    
    # Descomente a linha que interessar para testar
    #words = words1              # palavras sem acentos nem cedilhas.
    #words = words2             # palavras com acentos ou cedilhas.
    words = words1 + words2    # palavras de ambos os tipos

    import sys                  # INCLUA estas 3 linhas para permitir
    if len(sys.argv) > 1:       # correr o programa com palavras dadas:
        words = sys.argv[1:]    #   python3 forca.py duas palavras
                                # Escolhe palavra aleatoriamente
    secret = random.choice(words1 + words2).upper()
    print(secret)
    letrasinseridas = []
    Letraserradas = []
    chance = 9
    ganhou= False
    while chance > 0 and not ganhou:
        Interfacedaforca(chance)
        for letra in secret:
            if letra in letrasinseridas:
                print(letra, end=" ")
            else:
                print("_", end=" ")
        print("")
        print("Chances =", chance)
        print("Letras erradas", Letraserradas)
        tentativa = input("Aposta? ").upper()

        if tentativa in letrasinseridas or tentativa in Letraserradas:
            print("Você já tentou essa letra. Tente outra vez.")
        else:
            letrasinseridas.append(tentativa)
            if tentativa not in secret:
                if tentativa.isalpha() and len(tentativa) == 1:
                    chance -= 1
                    Letraserradas.append(tentativa)

        if all(letra in letrasinseridas for letra in secret):
            ganhou = True
        elif not tentativa.isalpha() or len(tentativa) != 1:
            print("Isso não é uma letra! Tente outra vez.")


    if ganhou:
        print("Parabéns, você ganhou!! A palavra era:", secret)
    else:
        print("Você perdeu. A palavra era:", secret)


if __name__ == "__main__":
    main()


