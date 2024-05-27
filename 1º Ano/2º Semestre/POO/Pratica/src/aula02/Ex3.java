package aula02;

import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args) {
        double m, ti, tf, q;
        Scanner sc = new Scanner(System.in);
        System.out.print("Insira a Massa(Kg): ");
        m = sc.nextDouble();
        System.out.print("Insira a Temperatura Inicial: ");
        ti = sc.nextDouble();
        System.out.print("Insira a Temperatura Final: ");
        tf = sc.nextDouble();
        q = m * (tf - ti) * 4184;
        System.out.println("São necessários " + q + " Joules.");
        
        sc.close();
    }
}
