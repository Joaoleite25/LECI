package aula02;

import java.util.Scanner;

public class Ex8 {
    public static void main(String[] args) {
        double a, b, c, angulo;
        Scanner sc = new Scanner(System.in);
        System.out.print("Cateto A: ");
        a = sc.nextDouble();
        while (a < 0) {
            System.out.print("Valor invalido! Cateto A: ");
            a = sc.nextDouble();
        }
        System.out.print("Cateto B: ");
        b = sc.nextDouble();
        while (b < 0) {
            System.out.print("Valor invalido! Cateto B: ");
            b = sc.nextDouble();
        }

        c = Math.sqrt(a * a + b * b);

        angulo = Math.acos(a / c);
        angulo = Math.toDegrees(angulo);
        
        System.err.print("A hipotenusa C: " + c);
        System.err.print("O angulo formado pelo cateto A e a hipotenusa C: " + angulo);

        sc.close();
    }
}
