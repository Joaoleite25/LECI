package aula08;

import java.util.Scanner;

public class Ex01 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Motociclo motociclo = new Motociclo("11-22-33", "Honda", "CBR", 100, "desportivo");
        Ligeiro ligeiro = new Ligeiro("44-55-66", "Fiat", "Punto", 90, "123456", 300);
        Taxi taxi = new Taxi("77-88-99", "Toyota", "Corolla", 110, "654321", 400, "123456");
        Mercadorias mercadorias = new Mercadorias("22-33-44", "Mercedes", "Actros", 500, 10000, 20000);
        Passageiros passageiros = new Passageiros("55-66-77", "Volvo", "B12", 460, 15000, 50);

        Empresa empresa = new Empresa("Alugueres Lda", "1234-567", "alugueres@empresa.com");
        empresa.addViatura(motociclo);
        empresa.addViatura(ligeiro);
        empresa.addViatura(taxi);
        empresa.addViatura(mercadorias);
        empresa.addViatura(passageiros);

        System.out.println("\n Menu:");
        System.out.println("1 - Listar");
        System.out.println("2 - Implementar");
        System.out.println("Opção: ");
        int opcao = sc.nextLine();

        switch (opcao) {
            case "1":
                
                break;
        
            default:
                break;
        }












        //System.out.println("Viaturas da empresa:");
        //for (Veiculo viatura : empresa.getViaturas()) {
        //    System.out.println(viatura.toString());
        //}

        motociclo.trajeto(100);
        System.out.println("Último trajeto do motociclo: " + motociclo.ultimoTrajeto());
        System.out.println("Distância total percorrida pelo motociclo: " + motociclo.distanciaTotal());

        //Veiculo viaturaComMaisKm = empresa.getViaturas().stream()
        //        .max(Comparator.comparingInt(Veiculo::distanciaTotal))
        //        .orElse(null);

        //if (viaturaComMaisKm != null) {
        //    System.out.println("Viatura com maior quilómetros percorridos: " + viaturaComMaisKm.toString());
        //} 
        sc.close();
    }
}

