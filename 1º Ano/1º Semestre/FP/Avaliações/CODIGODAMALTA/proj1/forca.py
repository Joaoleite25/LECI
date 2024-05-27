# Preencha a lista com os números mecanográficos dos autores.
AUTORES = [114288, 113505 ]

import random


# Defina funções aqui.
def boneco(erros):
    
    linha1 = [' ','   O  '] # cabeça
    linha2=[' ','   |','  /|','  /|\ '] # tronco        
    linha3=[' ','  /','  / \ '] # pernas

    index_1 = 1 if erros > 1 else erros             #index é o que se pode vir a desenhar
    index_2 = max(0, 3 if erros > 4 else erros - 1) #para garantir que o index não seja negativo
    index_3 = max(0, 2 if erros > 6 else erros - 4) #para garantir que o index não seja negativo
    
    print(' _______\n|')
    print("|"+linha1[index_1])
    print("|"+linha2[index_2])
    print("|"+linha3[index_3])
    print('|_______')


def forca(palavra_certa, letra_adiv):
    lstNormal = special(palavra_certa)
    mostrar = ""
    
    for i in range(len(lstNormal)):
        if lstNormal[i] not in letra_adiv:
            mostrar = mostrar + "*"
        else:
            mostrar = mostrar + palavra_certa[i]
    
    return mostrar
      
    
def special(palavra):
    
    returnList = []
    caracteresDic = {'C':['Ç'],'A':['Á','À','Ã','Â'],'E':['É','Ê'],'I':['Í','Î'],'O':['Ó','Ô','Õ'],'U':['Ú','Û']}
    specialCaracters = ['Ç','Á','À','Ã','Â','É','Ê','Í','Î','Ó','Ô','Õ','Ú','Û']

    for letra in palavra:
        if letra in specialCaracters:
            for key in caracteresDic:
                if letra in caracteresDic[key]:
                    returnList.append(key)
        else:
            returnList.append(letra)            
    return returnList

def main():
    from wordlist import words1, words2
    
    # Descomente a linha que interessar para testar
    words = words1              # palavras sem acentos nem cedilhas.
    #words = words2             # palavras com acentos ou cedilhas.
    #words = words1 + words2    # palavras de ambos os tipos

    import sys                  # INCLUA estas 3 linhas para permitir
    if len(sys.argv) > 1:       # correr o programa com palavras dadas:
        words = sys.argv[1:]    #   python3 forca.py duas palavras

    # Escolhe palavra aleatoriamente
    secret = random.choice(words).upper()

    # Complete o programa
    palavra_secreta = random.choice(words).upper()
    

    erros_total = 0  # Definir o número de tentativas.
    letra_adiv = []


    print("Bem-vindo ao jogo da forca!")
    print('Só pode ter 6 erros. Boa sorte!')
    print(forca(palavra_secreta, letra_adiv))

    alfabeto=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'] 
    
    while erros_total < 6:
    
        print (alfabeto)
        tentativaCru = input("Adivinhe uma letra: ").upper()
        tentativa = "".join(special(tentativaCru))

        if len(tentativa) != 1:
            print("Por favor, insira uma única letra válida.")  # não validar se for mais que uma letra
            continue

        elif not tentativa.isalpha():
            print("Por favor, insira uma letra.")  # não validar se for um número
            continue

        elif tentativa in letra_adiv:
            print("Já escolheu essa letra. Tente outra.") # não validar se já tiver escolhido a letra
            continue

        
        alfabeto.remove(tentativa) # remover a letra que já foi escolhida
        letra_adiv.append(tentativa)

        if tentativa not in palavra_secreta:
            erros_total += 1
            print('A letra' , tentativa, 'não está na palavra.' 'Você tem' , erros_total, 'erros')  
            
        else:
            print('A letra ',tentativa, 'está na palavra!')
        boneco(erros_total)
        
        mostrador = forca(palavra_secreta, letra_adiv)
        print(mostrador)

        if "*" not in mostrador:
            print("Parabéns, você ganhou!")
            break

        elif erros_total == 6:
            print("Não conseguiu acertar a palavra correta! A palavra era", palavra_secreta,'.')
            print("Fim do jogo.")



if __name__ == "__main__":
    main()