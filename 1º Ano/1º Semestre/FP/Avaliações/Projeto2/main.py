import requests
from countryinfo import CountryInfo

#Defenição que pede a longitude, latitude, distãncia e categoria(s) e verifica se estas são válidas.
def start():
    while True:
        #Caso a latitude inserida contenha virgulas, transforma as vírgulas em pontos, para na linha x verificar se é dígito.
        latitude = (input("Latitude: ")).replace(",", ".").strip()
        #Remove os sinais menos e pontos, para a partir da linha 12 verificar se a latitude inserida é um dígito.
        latitude_1 = latitude.replace("-", "").replace(".", "")

        if latitude.upper() != "E" and latitude.upper() != "R":
            if latitude_1.isdigit():
                if -90 <= float(latitude) <= 90:
                    break
                else:
                    print("Valores de Latitude Inválidos. A latitude deve estar entre -90 e 90.")
            else:
                print("Caracter inválido para Latitude.")
        else:
            if latitude.upper() == "E":
                exit()
            elif latitude.upper() == "R":
                main()

    while True:
        longitude = (input("Longitude: ")).replace(",", ".").strip() 
        longitude_1 = longitude.replace("-", "").replace(".", "")

        if longitude.upper() != "E" and longitude.upper() != "R":
            if longitude_1.isdigit():
                if -180 <= float(longitude) <= 180:
                    break
                else:
                    print("Valores de Longitude Inválidos. A Longitude deve estar entre -180 e 180.")
            else:
                print("Caracter inválido para Longitude.")
        else:
            if longitude.upper() == "E":
                exit()
            elif longitude.upper() == "R":
                main()

    while True:
        distancia_km = (input("Distância (Km): ")).replace(",", ".").strip()
        distancia_km_1 = distancia_km.replace("-", "").replace(".", "")

        if distancia_km.upper() != "E" and distancia_km.upper() != "R":
            if distancia_km_1.isdigit():
                break
            else:
                print("Carater inválido para Distância.")
        else:
            if distancia_km.upper() == "E":
                exit()
            elif distancia_km.upper() == "R":
                main()

    #Converter a distância de kilómetros para metros.
    distancia_m = float(distancia_km) * 1000

    print("\nPara ver as categorias principais prima C.")

    while True:
        categorias = input("\nInsira a(s) Categorias separadas por vírgula: ").lower().strip()
        categorias_1 = categorias.replace(",", "").replace(" ", "")

        if categorias.upper() != "C":
            if categorias.upper() != "E" and categorias.upper() != "R":
                if categorias_1.isalpha():
                    #Invoca a função check_categoria(s) para verificar se esta(s) são válidas de acordo com o ficheiro categorias.txt.
                    if check_categorias(categorias):
                        break
                    else:
                        print("A categoria {} é inválida.".format(categorias))
                else:
                    print("Carcater inválido para categoria(s).")
            else:
                if categorias.upper() == "E":
                    exit()
                elif categorias.upper() == "R":
                    main()
        else:
            categorias_possiveis()


    return latitude, longitude, distancia_m, categorias


#Defenição com as categorias principais.
def categorias_possiveis():
    print("""
. Commercial;        
. Accomodation:
. Activity;
. Commercial;
. Catering;
. Education;
. Childcare;
. Entertainment;
. Healthcare;
. Heritage;
. Leisure;
. Man Made;
. Natural;
. Office;
. Parking;
. Pet;
. Service;
. Tourism;
. Religion
. Camping;
. Amenity;
. Beach;
. Adult;
. Airport;
. Sport;
. Administrative;
. Political;
. Production.""")


#Defenição que verifica se as categoria(s) inserida(s) são válida(s) de acordo com o ficheiro categorias.txt.
def check_categorias(categorias):
    with open('categories.txt', 'r') as f:
        conteudo = f.read()

    #Separa o conteúdo para este ser usado no ciclo for da linha 90.
    arquivo_categorias = conteudo.split("\n")

    for categoria in categorias.split(","):
        if categoria in arquivo_categorias:
            return True

    return False


#Fazer "pip install countryinfo" no terminal para funcionar
def moedapais(pais):
    try:
        ipais = CountryInfo(pais)
        moeda = ipais.currencies()[0]
        return moeda
    except Exception as error:
        return f"Erro! Informação em falta: {str(error)}"


#Defenição de API.
def registo(latitude, longitude, distancia_m, categorias):
    url = f"https://api.geoapify.com/v2/places?categories={categorias.lower()}&filter=circle:{float(longitude)},{float(latitude)},{float(distancia_m)}&bias=proximity:{float(longitude)},{float(latitude)}&apiKey=b762d98029da49b9828cd5baac859043"
    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()

        lista = []

        #Procura as propriedades na API, organiza-as numa lista por categorias.
        for feature in data.get("features", []):
            propriedades = feature.get("properties", {})
            
            nome = propriedades.get("name", "Não Encontrado.")
            pais = propriedades.get("country", "Não Encontrado.")
            moeda = moedapais(pais)
            latitude = propriedades.get("lon", "Não Encontrado.")
            longitude = propriedades.get("lat", "Não Encontrado.")
            distancia = propriedades.get("distance", "Não Encontrado.")
            codigo_postal = propriedades.get("postcode", "Não Encontrado.")
            categorias = propriedades.get("categories", "Não Encontrado.")

            categorias_formatadas = ", ".join(categorias)

            lista.append([nome, pais, moeda, latitude, longitude, distancia, codigo_postal, categorias_formatadas])

        return lista


#Defenição que Calcula a distância Média, arredondada a três casas décimais.
def distancia_media(lista):
    lista_distancias = []
    for item in lista:
        lista_distancias.append(float(item[4]))

    distancia_media = sum(lista_distancias)/len(lista)

    return round(distancia_media, 3)


def main():
    print("Bem Vindo! Escolha as melhores opções para a sua viagem.")
    #Opções Disponíveis.
    print("\nPara sair prima E.")
    print("Para reeniciar prima R.\n")

    #Chama as variáveis necessárias para contar o número de linhas da lista.
    #Invoca a função start.
    latitude, longitude, distancia, categorias = start()
    lista = registo(latitude, longitude, distancia, categorias)
    #Calcula o número de linhas existentes na lista.
    resultados = len(lista)
    
    #Verifica o número de elementos da lista.
    #Caso a lista esteja vazia, informa o utilizador que não foi encontrado nenhum resultado e pede uma opção.
    if resultados == 0:
        print("\nNunhum resultado encontrado!")

        print("\nPara sair prima E.")
        print("Para reeniciar prima R.")

        while True:
            opção = input("\nOpção: ")
            if opção.upper() == "E":
                exit()
            elif opção.upper() == "R":
                main()
            else:
                print("Opção Inválida.")

    #Caso a lista não esteja vazia, imprime os elemntos da mesma e pede uma opção. 
    else:
        for linha in lista:
            print("""
Nome: {}
País: {}
Moeda: {}
Latitude: {}
Longitude: {}
Distância: {}
Código Postal: {}
Categorias: {}""".format(*linha))
        
        print("\n{} resultados encontrados.".format(resultados))

        print("\nDistância Média:", distancia_media(lista))

        print("\nPara sair prima E.")
        print("Para reeniciar prima R.")

        while True:
            opção = input("\nOpção: ")
            if opção.upper() == "E":
                exit()
            elif opção.upper() == "R":
                main()
            else:
                print("Opção Inválida.")


main()
