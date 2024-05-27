package aula02;

import java.util.Scanner;

public class Ex9 {
    public static void main(String[] args) {
        int n;
        Scanner sc = new Scanner(System.in);
        do {
            System.out.print("N: ");
            n = sc.nextInt();
        } while (n < 0);
        while (n > 0) {
            if (n % 10 == 0) {
                System.err.println("");
                System.out.print(n + ", ");
            }
            else if ((n-1) % 10 == 0) {
                System.out.print(n);
            }
            else {
                System.err.print(n +", ");
            }
            n --;
        }


        sc.close();
    }
}
