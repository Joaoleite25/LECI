package Ex01;

import java.util.Scanner;

public class Circle {
    public static void main(String[] args) {
        double r;
        Scanner scanner = new Scanner(System.in);
        r = leitura(scanner);

        System.out.println(calcarea(r));
        System.out.println(calcper(r));

        scanner.close();
    }

    public static double leitura(Scanner scanner) {
        double r;
        do {
            System.out.print("Raio do círculo: ");
            r = scanner.nextDouble();
        } while(r < 0);
        return r;
    }

    public static double calcarea(double r) {
        double area = 3.14 * (r * r);
        return area;
    }

    public static double calcper(double r) {
        double per = 2 * 3.14 * r;
        return per;
    }
}
