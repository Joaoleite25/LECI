package aula03;

import java.text.DecimalFormat;
import java.util.Scanner;

public class Ex04 {
    public static void main(String[] args) {
        int alunos, pauta;
        double nt, np;
        DecimalFormat df = new DecimalFormat("#.0");
        Scanner scanner = new Scanner(System.in);
        do {
            System.out.print("Número de alunos:");
            alunos = scanner.nextInt();
        } while (alunos < 0);

        double[][] notas = new double[alunos][2];
        
        for (int i = 0; i < alunos; i++) {
            do {
                System.out.print("Nota T: ");
                nt = scanner.nextDouble();
                notas[i][0] = nt;
            } while (nt < 0 || nt > 20);
            do {
                System.out.print("Nota P: ");
                np = scanner.nextDouble();
                notas[i][1] = np;
            } while (np < 0 || np > 20);
        }

        System.out.printf("%10s %10s %10s", "NotaT", "NotaP", "Pauta");
        System.out.println();

        for (int i = 0; i < alunos; i++) {
            pauta = Pauta(notas[i][0], notas[i][1]);
            System.out.printf("%10s %10s %10s", df.format(notas[i][0]), df.format(notas[i][1]), pauta);
            System.out.println();
        }

        scanner.close();
    }

    public static int Pauta(Double nt, Double np) {
        if (nt < 7 || np < 7) {
            return 66;
        }
        return (int) Math.round(0.4 * nt + 0.6 * np);
    }
}
