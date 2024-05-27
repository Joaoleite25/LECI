# Preencha a lista com os números mecanográficos dos autores.
AUTORES = [119859, 119814]

# Biblioteca usada para escolher a palavra
import random

# Bibliotecas usadas para remover acentos na palavra escolhida
import unicodedata
import re
import os

#Retirar acentos
def remover_acentos(secret):                                                    #Definição que remove os acentos do secret
    string_normal = unicodedata.normalize("NFKD", secret)
    secret_sem_acentos = re.sub(r"[^\x00-\x7F]", "", string_normal)
    return secret_sem_acentos

# Defina funções aqui.
def verificacao(secret, l, vidas, p, e, c):
    if len(l)!=1 or not l.isalpha():
        print("A tentativa foi inválida!")
    else :
        if l in p:
            print("Letra repetida!")
        elif l in secret:
            c += l + " "
            p += l
        else:
            e += l + " "
            vidas -= 1
            p += l

    return vidas, c, e, p

def texto(secret, vidas, p, e, c):
    # Definir variáveis locais
    erradas = 0
    acabar = 0

    # Percorrer todas as letras da palavra escolhida para verificar se estas ja foram adivinhadas
    for char in secret:      
        if char in c:    
            print (char + " ",end=""),    
        else:
            print ("_ ",end=""),     
            erradas += 1
    print("")
    print("Letras Certas = ", "".join(c))
    print("Letras Erradas = ", "".join(e))
    print("Vidas = ", vidas)

    # Caso a variável "erradas" seja igual a 0, todas as letras foram adivinhadas
    if erradas>0:
        l = input("Aposta? ").lower() 
        vidas, c, e, p = verificacao(secret, l, vidas, p, e, c)
    else:
        acabar = 1

    return vidas, c, e, p, acabar
    
def jogo(secret, p, e, c, palavra):
    vidas = 7      # Definir a variável vidas
    while True:
        # Verificação de quantas vidas tem para desenhar a forca
        if vidas == 7:
            print("""
   ______ 
  |     |
  |
  | 
  | 
  |          
  |_______
        """)
            vidas, c, e, p, acabar = texto(secret, vidas, p, e, c)  
        elif vidas == 6:
            print("""
   ______ 
  |     | 
  |     O
  | 
  | 
  |         
  |_______
        """)
            vidas, c, e, p, acabar = texto(secret, vidas, p, e, c)
        elif vidas == 5:
            print("""
   ______ 
  |     | 
  |     O 
  |     | 
  | 
  |        
  |_______
        """)
            vidas, c, e, p, acabar = texto(secret, vidas, p, e, c)
        elif vidas == 4:
            print("""
   ______ 
  |     | 
  |     O 
  |     | 
  |     | 
  |          
  |_______
        """)
            vidas, c, e, p, acabar = texto(secret, vidas, p, e, c)
        elif vidas == 3:
            print("""
   ______ 
  |     | 
  |     O 
  |    /| 
  |     | 
  |           
  |_______
        """)
            vidas, c, e, p, acabar = texto(secret, vidas, p, e, c)
        elif vidas == 2:
            print("""
   ______ 
  |     | 
  |     O 
  |    /|\ 
  |     | 
  |           
  |_______
        """)
            vidas, c, e, p, acabar = texto(secret, vidas, p, e, c)
        elif vidas == 1:
            print("""
   ______ 
  |     | 
  |     O 
  |    /|\ 
  |     | 
  |    /       
  |_______
        """)
            vidas, c, e, p, acabar = texto(secret, vidas, p, e, c)
        elif vidas == 0:
            print("""
   ______ 
  |     | 
  |     O 
  |    /|\ 
  |     | 
  |    / \     
  |_______
        """)
            print("A palavra correta era: ", palavra)
            break
        # Caso todas as letras tenham sido adivinhadas
        if acabar == 1:
            print("Ganhaste!")
            break
        


def main():
    from wordlist import words1, words2

    #Definir as variáveis p(todas as letras), e(letras erradas), c(letras certas)
    p = ''
    e = ''
    c = ''
    
    # Descomente a linha que interessar para testar
    #words = words1              # palavras sem acentos nem cedilhas.
    #words = words2             # palavras com acentos ou cedilhas.
    words = words1 + words2    # palavras de ambos os tipos
    
    import sys                  # INCLUA estas 3 linhas para permitir
    if len(sys.argv) > 1:       # correr o programa com palavras dadas:
        words = sys.argv[1:]    #   python3 forca.py duas palavras
   
    # Escolhe palavra aleatoriamente
    secret = random.choice(words).lower()
    palavra = secret            # Guardar a palavra escolhida para apresenta-la quando perder o jogo
    secret = remover_acentos(secret)  # Remover os acentos para verificação
    # Complete o programa
    jogo(secret, p, e, c, palavra)


if __name__ == "__main__":
    main()

