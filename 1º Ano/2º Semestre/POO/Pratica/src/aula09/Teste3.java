package aula09;

import java.util.Scanner;

public class Teste3 {
    public static void main(String[] args) {
        PlaneManager planeManager = new PlaneManager();
        Scanner scanner = new Scanner(System.in);
        int escolha;

        do {
            System.out.println("\nMenu de Aviões:");
            System.out.println("1. Adicionar avião");
            System.out.println("2. Remover avião");
            System.out.println("3. Procurar avião");
            System.out.println("4. Listar aviões");
            System.out.println("5. Listar aviões comerciais");
            System.out.println("6. Listar aviões militares");
            System.out.println("7. Imprimir o avião mais rápido");
            System.out.println("0. Sair");
            
            System.out.print("Escolha: ");
            escolha = Integer.parseInt(scanner.nextLine());
            switch (escolha) {
                case 1: adicionarAviao(planeManager, scanner);
                case 2: removerAviao(planeManager, scanner);
                case 3: procurarAviao(planeManager, scanner);
                case 4: imprimirTodosAvioes(planeManager);
                case 5: imprimirAvioesComerciais(planeManager);
                case 6: imprimirAvioesMilitares(planeManager);
                case 7: imprimirAviaoMaisRapido(planeManager);
                case 0: System.out.println(" ");
            }
        } while (escolha != 0);

        scanner.close();
    }

    private static void adicionarAviao(PlaneManager planeManager, Scanner scanner) {
        System.out.print("ID: ");
        String id = scanner.nextLine();
        System.out.print("Fabricante: ");
        String fabricante = scanner.nextLine();
        System.out.print("Modelo: ");
        String modelo = scanner.nextLine();
        System.out.print("Ano de fabrico: ");
        int ano = Integer.parseInt(scanner.nextLine());
        System.out.print("Passageiros: ");
        int contagemPassageiros = Integer.parseInt(scanner.nextLine());
        System.out.print("Velocidade máxima: ");
        int velocidadeMaxima = Integer.parseInt(scanner.nextLine());
        System.out.print("Tipo (comercial/militar): ");
        String tipo = scanner.nextLine();
        if (tipo.equals("comercial")) {
            System.out.print("Tripulação: ");
            int contagemTripulacao = Integer.parseInt(scanner.nextLine());
            planeManager.addPlane(new CommercialPlane(id, fabricante, modelo, ano, contagemPassageiros, velocidadeMaxima, contagemTripulacao));
        } else if (tipo.equals("militar")) {
            System.out.print("Mísseis: ");
            int contagemMissoes = Integer.parseInt(scanner.nextLine());
            planeManager.addPlane(new MilitaryPlane(id, fabricante, modelo, ano, contagemPassageiros, velocidadeMaxima, contagemMissoes));
        }
    }

    private static void removerAviao(PlaneManager planeManager, Scanner scanner) {
        System.out.print("ID: ");
        String id = scanner.nextLine();
        if (planeManager.searchPlane(id) == null) {
            System.out.println("Não encontrado.");
            return;
        }
        planeManager.removePlane(id);
    }

    private static void procurarAviao(PlaneManager planeManager, Scanner scanner) {
        System.out.print("ID: ");
        String id = scanner.nextLine();
        Plane aviao = planeManager.searchPlane(id);
        if (aviao == null) {
            System.out.println("Não encontrado.");
            return;
        }
        System.out.println(aviao);
    }

    private static void imprimirTodosAvioes(PlaneManager planeManager) {
        planeManager.printAllPlanes();
    }

    private static void imprimirAvioesComerciais(PlaneManager planeManager) {
        planeManager.printAllPlanes("comercial");
    }

    private static void imprimirAvioesMilitares(PlaneManager planeManager) {
        planeManager.printAllPlanes("militar");
    }

    private static void imprimirAviaoMaisRapido(PlaneManager planeManager) {
        System.out.print(planeManager.getFastestPlane());
    }
}
