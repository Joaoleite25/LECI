class Chamada:
    def __init__(self, origem, destino, duracao):
        self.origem = origem
        self.destino = destino
        self.duracao = duracao


class EmpresaTelecom:
    def __init__(self):
        self.chamadas = []

    def validar_numero_telefone(self, numero):
        # Função para validar um número de telefone
        if (numero.startswith('+') and numero[1:].isdigit() and len(numero) >= 3) or (numero.isdigit() and len(numero) >= 3):
            if all(digito.isdigit() or digito == '+' for digito in numero):
                return True
        print("Número inválido")
        return False

    def registrar_chamada(self, origem, destino, duracao):
        # Registra uma nova chamada
        chamada = Chamada(origem, destino, duracao)
        self.chamadas.append(chamada)
        print("Chamada registrada com sucesso!")

    def ler_ficheiro_chamadas(self, nome_arquivo):
        # Lê chamadas de um arquivo
        with open(nome_arquivo, 'r') as file:
            for line in file:
                origem, destino, duracao = line.strip().split()
                self.registrar_chamada(origem, destino, int(duracao))

    def listar_clientes(self):
        # Lista os clientes sem repetições
        clientes = set(chamada.origem for chamada in self.chamadas)
        print("Clientes:", ' '.join(clientes))

    def gerar_fatura_detalhada(self, cliente):
        # Gera uma fatura detalhada para um cliente específico
        tarifas = {
            "fixa": 0.02,
            "internacional": 0.80,
            "mesma_rede": 0.04,
            "outros_destinos": 0.10
        }

        total_custo = 0

        print(f"Fatura do cliente {cliente}")
        print("Destino  Duração  Custo")
        for chamada in self.chamadas:
            if chamada.origem == cliente:
                custo = 0
                if chamada.destino.startswith('+'):
                    custo = chamada.duracao * tarifas["internacional"]
                elif chamada.destino.startswith('2'):
                    custo = chamada.duracao * tarifas["fixa"]
                elif chamada.destino[:2] == cliente[:2]:
                    custo = chamada.duracao * tarifas["mesma_rede"]
                else:
                    custo = chamada.duracao * tarifas["outros_destinos"]

                total_custo += custo
                print(f"{chamada.destino}  {chamada.duracao}  {custo:.2f}")

        print(f"Total: {total_custo:.2f}")


# Função principal
def main():
    empresa_telecom = EmpresaTelecom()

    while True:
        print("\n1) Registar chamada")
        print("2) Ler ficheiro de chamadas")
        print("3) Listar clientes")
        print("4) Gerar fatura detalhada")
        print("5) Terminar")

        opcao = input("Opção? ")

        if opcao == '1':
            origem = input("Telefone origem? ")
            destino = input("Telefone destino? ")
            duracao = int(input("Duração (s)? "))

            if empresa_telecom.validar_numero_telefone(origem) and empresa_telecom.validar_numero_telefone(destino):
                empresa_telecom.registrar_chamada(origem, destino, duracao)

        elif opcao == '2':
            nome_arquivo = input("Ficheiro? ")
            empresa_telecom.ler_ficheiro_chamadas(nome_arquivo)

        elif opcao == '3':
            empresa_telecom.listar_clientes()

        elif opcao == '4':
            cliente = input("Cliente? ")
            empresa_telecom.gerar_fatura_detalhada(cliente)

        elif opcao == '5':
            break

        else:
            print("Opção inválida. Tente novamente.")


if __name__ == "__main__":
    main()
