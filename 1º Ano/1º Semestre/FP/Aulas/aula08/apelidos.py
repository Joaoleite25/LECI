def main():
    with open('names.txt', 'r') as arquivo:
        nomes = arquivo.readlines()
    
    apelidos = {}
    for nome_completo in nomes:
        partes_nome = nome_completo.split()
        ultimo_nome = partes_nome[-1]
        primeiro_nome = partes_nome[0]

        if ultimo_nome in apelidos:
            apelidos[ultimo_nome].append(primeiro_nome)
        else:
            apelidos[ultimo_nome] = [primeiro_nome]

    for sobrenome, primeiros_nomes in apelidos.items():
        nomes_formatados = ", ".join(primeiros_nomes)
        print(f"{sobrenome} : {nomes_formatados}")

main()
