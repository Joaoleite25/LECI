package Ex01;

import java.util.Scanner;

public class Triangle {
    public static void main(String[] args) {
        double l1, l2, l3;
        Scanner scanner = new Scanner(System.in);
        l1 = leitura(scanner);
        l2 = leitura(scanner);
        l3 = leitura(scanner);

        System.out.println(calcarea(l1, l2, l3));
        System.out.println(calcper(l1, l2, l3));

        scanner.close();
    }

    public static double leitura(Scanner scanner) {
        double l;
        do {
            System.out.print("Dimensão do lado: ");
            l = scanner.nextDouble();
        } while(l < 0);
        return l;
    }

    public static double calcarea(double l1, double l2, double l3) {
        double area, p = (l1 + l2 + l3) / 2;
        area = Math.sqrt(p * (p - l1) * (p - l2) * (p - l3));
        return area;
    }

    public static double calcper(double l1, double l2, double l3) {
        return l1 + l2 + l3;
    }
}
