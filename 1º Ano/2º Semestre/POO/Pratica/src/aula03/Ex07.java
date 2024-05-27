package aula03;

import java.util.Scanner;

public class Ex07 {
    public static void main(String[] args) {
        String s;
        Scanner scanner = new Scanner(System.in);
        System.out.println("Escreva a sua frase: ");
        s = scanner.nextLine();
        System.out.println();

        System.out.println("Número de Dígitos: " + countDigits(s));
        System.out.println("Número de Espaços: " + countSpaces(s));
        System.out.println("Número de Minusculas: " + countMinusculas(s));
        System.err.println("String sem duplos espaços:" + retirarDuplosEspacos(s));
        System.err.println("É um palíndromo? " + Palindromo(s));

        scanner.close();
    }

    public static int countDigits(String s) {
        int count = 0;
        String digits = "0123456789";
        for (int i = 0; i < s.length(); i++) {
            if (digits.contains(String.valueOf(s.charAt(i)))) {
                count++;
            }
        }
        return count;
    }

    public static int countSpaces(String s) {
        int count = 0;
        for (char c : s.toCharArray()) {
            if (c == ' ') {
                count++;
            }
        }
        return count;
    }

    public static int countMinusculas(String s) {
        int count = 0;
        for (int i = 0; i < s.length(); i++) {
            if (String.valueOf(s.charAt(i)).equals(String.valueOf(s.charAt(i)).toLowerCase())) {
                count++;
            }
        }
        count -= (countDigits(s) + countSpaces(s));
        return count;
    }

    public static String retirarDuplosEspacos(String s) {
        return s.replaceAll("\\s+", " ");
    }

    public static boolean Palindromo(String s) {
        String reversed = new StringBuilder(s).reverse().toString();
        return s.equalsIgnoreCase(reversed);
    }
}
