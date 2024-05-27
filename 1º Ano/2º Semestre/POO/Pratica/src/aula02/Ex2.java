package aula02;

import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        double c, f;
        Scanner sc = new Scanner(System.in);
        System.out.print("Insira a temperatura(ºC): ");
        c = sc.nextDouble();
        f = 1.8 * c + 32;
        System.out.println("A temperatura em Fahrenheit(F) " + f);
        
        sc.close();
    }
}
