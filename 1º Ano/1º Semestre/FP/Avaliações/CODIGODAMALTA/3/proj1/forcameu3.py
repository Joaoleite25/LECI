AUTORES=[117468,118899]
import random

# Função para verificar as letras acentuadas
def CheckWord(letra, palavra, descobertas, erros):
    acentos = {
        'A': ['Á', 'Ã', 'Â'],
        'E': ['É', 'Ê'],
        'I': ['Í'],
        'O': ['Ó', 'Õ', 'Ô'],
        'U': ['Ú'],
        'C': ['Ç']
    }

    letras = [letra]
    letraUpper = letra.upper()

    for key, value in acentos.items():
        if letraUpper == key:
            for acento in value:
                if acento in palavra:
                    letras.append(acento)

    return letras

# Função para imprimir as letras descobertas e os erros
def PalavraSecreta(palavra, descobertas, erros):
    alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    nerros = len(erros)
    palavraAtual = ''.join([letra if letra in descobertas else '_' for letra in palavra])
    letrasDisponiveis = ','.join([letra for letra in alfabeto if letra not in descobertas + erros])

    print(f"Nº DE ERROS: {nerros}")
    print(f"Letras que eu errei: {', '.join(erros)}")
    print(f"Letras disponíveis: {letrasDisponiveis}")

    return palavraAtual

# Função de desenho da forca
def DesenhaForca(erros):
    nerros = len(erros)

    if nerros == 0:
        print(
            "  +---+\n"
            "      |\n"
            "      |\n"
            "      |\n"
            "      |\n"
            "      |\n"
            "========="
        )
    elif nerros == 1:
        print(
            "  +---+\n"
            "  |   |\n"
            "      |\n"
            "      |\n"
            "      |\n"
            "      |\n"
            "========="
        )
    elif nerros == 2:
        print(
            "  +---+\n"
            "  |   |\n"
            "  O   |\n"
            "      |\n"
            "      |\n"
            "      |\n"
            "========="
        )
    elif nerros == 3:
        print(
            "  +---+\n"
            "  |   |\n"
            "  O   |\n"
            "  |   |\n"
            "      |\n"
            "      |\n"
            "========="
        )
    elif nerros == 4:
        print(
            "  +---+\n"
            "  |   |\n"
            "  O   |\n"
            " /|   |\n"
            "      |\n"
            "      |\n"
            "========="
        )
    elif nerros == 5:
        print(
            "  +---+\n"
            "  |   |\n"
            "  O   |\n"
            " /|\\  |\n"
            "      |\n"
            "      |\n"
            "========="
        )
    elif nerros == 6:
        print(
            "  +---+\n"
            "  |   |\n"
            "  O   |\n"
            " /|\\  |\n"
            " /    |\n"
            "      |\n"
            "========="
        )
    else:
        print(
            "  +---+\n"
            "  |   |\n"
            "  O   |\n"
            " /|\\  |\n"
            " / \\   |\n"
            "      |\n"
            "========="
        )
    print("")

# Função para verificar se o usuário digitou apenas uma letra e se colocou algum caractere inválido
def Entrada(letra):
    if len(letra) != 1 or not letra.isalpha():
        print("Digite uma única letra válida.")
        return None
    return letra.upper()

# Função para verificar se a letra está na palavra
def CheckWords(letra, palavra, descobertas, erros):
    acerto = False
    erro = False
    letraComAcento = CheckWord(letra, palavra, descobertas, erros)

    for letra in letraComAcento:
        if letra in palavra:
            descobertas.append(letra)
            acerto = True
        else:
            if letra not in erros:
                erros.append(letra)
            erro = True

    return acerto, erro

# Função para jogar o jogo da forca
def jogo(palavra):
    descobertas = []
    erros = []

    while True:
        DesenhaForca(erros)
        Newpalavra = PalavraSecreta(palavra, descobertas, erros)
        print(Newpalavra)

        if len(erros) > 6:
            print(f"Você perdeu! A palavra era {palavra}")
            break

        letra = input(">:")  # Digitar letra
        letra = Entrada(letra)

        if letra:
            if letra in erros or letra in descobertas:
                print("Você já digitou essa letra antes")
                continue

            acerto, erro = CheckWords(letra, palavra, descobertas, erros)

            if acerto:
                print("Você acertou uma letra :D")
            if erro:
                print("Você errou :(")

            palavra_atual = PalavraSecreta(palavra, descobertas, erros)

            if palavra_atual == palavra:
                print("Você ganhou. Parabéns! :D")
                break

# Função principal para escolher a biblioteca de palavras
def menu():
    from words  import words1,words2 
    print("ESCOLHA:\n1) Palavras sem acentos nem cedilhas\n2) Palavras com acentos ou cedilhas\n3) Palavras de ambos os tipos")
    escolha = input(">:")
    
    if escolha == "1":
        palavras = words1
    elif escolha == "2":
        palavras = words2
    elif escolha == "3":
        palavras = words1+words2
    else:
        print("Opção inválida.")
        return
    
    palavra = random.choice(palavras).upper()
    print(palavra)
    jogo(palavra)

if __name__ == "__main__":
    menu()
