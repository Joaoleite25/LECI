package aula02;

import java.util.Scanner;

public class Ex10 {
    public static void main(String[] args) {
        int max, min, med, p, n, c = 1;
        Scanner sc = new Scanner(System.in);
        System.err.print("Primeiro Número: ");
        p = sc.nextInt();
        max = p;
        min = p;
        med = p;
        do {
            System.err.print("Próximo Número: ");
            n = sc.nextInt();
            if (max < n) {
                max = n;
            }
            else if (min > n) {
                min = n;
            }
            med += n;
            c ++;
        } while (p != n);   
        med = med/c;

        System.err.println("Valor Máximo: " + max);
        System.err.println("Valor Minimo: " + min);
        System.err.println("Média: " + med);
        System.err.println("Total: " + c);

        sc.close();
    }
}
