package aula07;

import java.util.Scanner;

public class Ex1_Rectangle {
    public static void main(String[] args) {
        double c, h;
        String cump = "Cumprimento", alt = "Altura";
        Scanner scanner = new Scanner(System.in);

        c = leitura(scanner, cump);
        h = leitura(scanner, alt);

        System.out.println(calcarea(c, h));
        System.out.println(calcper(c, h));

        scanner.close();
    }

    public static double leitura(Scanner scanner, String text) {
        double x;
        do {
            System.out.print(text + ": ");
            x = scanner.nextDouble();
        } while (x < 0);
        return x;
    }

    public static double calcarea(double c, double h) {
        return c * h;
    }

    public static double calcper(double c, double h) {
        return (c * 2) + (h * 2);
    }
}
