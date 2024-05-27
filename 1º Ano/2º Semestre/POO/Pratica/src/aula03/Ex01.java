package aula03;

import java.util.Scanner;

public class Ex01 {
    public static void main(String[] args) {
        int n, ver, soma = 0;
        Scanner sc = new Scanner(System.in);
        do {
            System.out.print("Número: ");
            n = sc.nextInt();
        } while (n < 0);

        for (int i = 1; i < (n + 1); i++) {
            ver = 0;
            for (int j = 2; j < i; j++) {
                if (i % j == 0 && i != j) {
                    ver = 1;
                    break;
                }
            }
            if (ver == 0) {
                soma += i;
            }
        }

        System.out.println("Soma: " + soma);

        ver = 0;

        for (int i = 2; i < (n/2); i++) {
            if (n % i == 0) {
                System.out.println("O número não é primo!");
                ver = 1;
                break;
            }
        }
        if (ver == 0) {
            System.out.println("O número é primo!");
        }

        sc.close();
    }
}
