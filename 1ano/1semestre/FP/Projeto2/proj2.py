import requests

def start():
    print("Bem Vindo! Escolha as melhores opções para a sua viagem.")
    print("\nPara sair prima E")
    print("Para reeniciar prima R\n")

    while True:
        latitude = (input("Latitude: ")) 

        if latitude.upper() != "E" and latitude.upper() != "R":
            if latitude.replace("-", "").replace(".", "").isdigit():
                if -90 <= float(latitude) <= 90:
                    break
                else:
                    print("Valores de Latitude Inválidos. A latitude deve estar entre -90 e 90.")
            else:
                print("Carater inválido para Latitude")
        else:
            if latitude.upper() == "E":
                exit()
            elif latitude.upper() == "R":
                main()

    while True:
        longitude = (input("Longitude: ")) 

        if longitude.upper() != "E" and longitude.upper() != "R":
            if longitude.replace("-", "").replace(".", "").isdigit():
                if -90 <= float(longitude) <= 90:
                    break
                else:
                    print("Valores de Longitude Inválidos. A Longitude deve estar entre -180 e 180.")
            else:
                print("Carater inválido para Longitude")
        else:
            if longitude.upper() == "E":
                exit()
            elif longitude.upper() == "R":
                main()

    while True:
        distancia = (input("Distância (m): "))

        if distancia.upper() != "E" or distancia.upper() != "R":
            if distancia.isdigit():
                break
            else:
                print("Carater inválido para Distância.")
        else:
            if distancia.upper() == "E":
                exit()
            elif distancia.upper() == "R":
                main()

    while True:
        categorias = input("Insira a(s) Categorias separadas por vírgula: ")

        if categorias != "E" or categorias != "R":
            if categorias.isalpha():
                break
            else:
                print("Carater inválido para categoria(s).")
        else:
            if categorias.upper() == "E":
                exit()
            elif categorias.upper() == "R":
                main()

    return latitude, longitude, distancia, categorias


def registo(latitude, longitude, distancia, categorias):
    url = f"https://api.geoapify.com/v2/places?categories={categorias.lower()}&filter=circle:{float(latitude)},{float(longitude)},{float(distancia)}&bias=proximity:{float(latitude)},{float(longitude)}&apiKey=b762d98029da49b9828cd5baac859043"
    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()

        lista = []

        for feature in data.get("features", []):
            propriedades = feature.get("properties", {})
            nome = propriedades.get("name", "")
            pais = propriedades.get("country", "")
            estado = propriedades.get("state", "")
            cidade = propriedades.get("city", "")
            rua = propriedades.get("street", "")
            codigo_postal = propriedades.get("postcode", "")

            lista.append([nome, pais, estado, cidade, rua, codigo_postal])

        return lista


def main():
    latitude, longitude, distancia, categorias = start()

    lista = registo(latitude, longitude, distancia, categorias)
    
    print("\n{: <25} {: <25} {: <25} {: <25} {: <25} {: <25}".format("Nome", "País", "Estado", "Cidade", "Rua", "Código Postal"))

    for linha in lista:
        print("{: <25} {: <25} {: <25} {: <25} {: <25} {: <25}".format(*linha))
    
    print("{} resultados encontrados.".format(len(lista)))

    opção = input("Opção: ")

    if opção.upper() == "E":
        exit()
    elif opção.upper() == "R":
        main()
    else:
        print("Opção Inválida.")


main()
