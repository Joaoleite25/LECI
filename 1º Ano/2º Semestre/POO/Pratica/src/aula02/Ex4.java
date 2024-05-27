package aula02;

import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        double invest, j, total;
        Scanner sc = new Scanner(System.in);
        System.out.print("Montante investido: ");
        invest = sc.nextDouble();
        System.err.print("Juros: ");
        j = sc.nextDouble();
        j = j / 100;
        total = invest;
        for (int i = 0; i < 3; i++) {
            total += total * j;
        }
        System.out.print("Para um investimento de " + invest + " com uma taxa de juros de " + j + " ao fim de 3 meses o valor a pagar é: " + total);
        
        sc.close();
    }
}
