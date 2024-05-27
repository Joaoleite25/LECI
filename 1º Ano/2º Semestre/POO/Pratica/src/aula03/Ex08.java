package aula03;

import java.util.Scanner;

public class Ex08 {
    public static void main(String[] args) {
        String s;
        Scanner scanner = new Scanner(System.in);
        System.out.println("Escreva a frase: ");
        s = scanner.nextLine();

        System.out.println("Acrónimo: " + acronimo(s));

        scanner.close();
    }

    public static String acronimo(String s) {
        String[] palavras = s.split(" ");
        StringBuilder acronimo = new StringBuilder();
        for (String p : palavras) {
            if (p.length() > 3)  {
                acronimo.append(p.charAt(0));
            }
        }

        return acronimo.toString().toUpperCase();
    }
}
