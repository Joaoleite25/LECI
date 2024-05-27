package aula02;

import java.util.Scanner;

public class Ex5 {
    public static void main(String[] args) {
        double v1, v2, d1, d2, d, t, vm;
        Scanner sc = new Scanner(System.in);
        System.out.print("Velocidade 1: ");
        v1 = sc.nextDouble();
        while (v1 < 0) {
            System.out.print("Valor invalido! Velocidade 1: ");
            v1 = sc.nextDouble();
        }
        System.out.print("Distância 1: ");
        d1 = sc.nextDouble();
        while (d1 < 0) {
            System.out.print("Valor invalido! Distância 1: ");
            d1 = sc.nextDouble();
        }
        System.out.print("Velocidade 2: ");
        v2 = sc.nextDouble();
        while (v2 < 0) {
            System.out.print("Valor invalido! Velocidade 2: ");
            v2 = sc.nextDouble();
        }
        System.out.print("Distância 2: ");
        d2 = sc.nextDouble();
        while (d2 < 0) {
            System.out.print("Valor invalido! Distância 2: ");
            d2 = sc.nextDouble();
        }
        t = (d1 / v1) + (d2 / v2);
        d = d1 + d2;
        vm = d / t;
        System.out.print("A velocidade média é de: " + vm + "Km/h");

        sc.close();
    }
}
