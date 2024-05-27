package aula02;

import java.util.Scanner;

public class Ex7 {
    public static void main(String[] args) {
        double x1, x2, y1, y2, d;
        Scanner sc = new Scanner(System.in);
        System.err.print("A cordenada X de P1: ");
        x1 = sc.nextDouble();
        System.err.print("A cordenada Y de P1: ");
        y1 = sc.nextDouble();
        System.err.print("A cordenada X de P2: ");
        x2 = sc.nextDouble();
        System.err.print("A cordenada Y de P2: ");
        y2 = sc.nextDouble();

        d = Math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
        System.err.print("A distância entre P1 e P2 é: " + d);

        sc.close();
    }
}
