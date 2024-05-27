package aula03;

import java.text.DecimalFormat;
import java.util.Scanner;

public class Ex02 {
    public static void main(String[] args) {
        double valor, juros;
        DecimalFormat df = new DecimalFormat("#.00");
        Scanner scanner = new Scanner(System.in);
        do {
            System.out.print("Montante Investido: ");
            valor = scanner.nextDouble();
        } while (valor % 1000 != 0 || valor < 0);
        do {
            System.out.print("Juros: ");
            juros = scanner.nextDouble();
        } while (juros < 0 || juros > 5);
        juros = juros / 100;
        for (int i = 0; i < 12; i++) {
            valor += (valor * juros);

            System.out.println("Valor do fundo no mês " + (i + 1) + ": " + df.format(valor));
        }

        scanner.close();
    }
}
