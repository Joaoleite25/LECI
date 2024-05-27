package aula03;

import java.util.Scanner;

public class Ex06 {
    public static void main(String[] args){
        String str;
        Scanner scanner = new Scanner(System.in);
        System.out.println("Escreva a sua frase: ");
        str = scanner.nextLine();
        System.out.println();

        fraseminuscula(str);
        ultimocrt(str);
        tresprimeiroscrts(str);

        //Extras
        espacosporhifen(str);
        procurarpalavra(str, scanner);
        inverterstr(str);

        scanner.close();
    }

    public static void fraseminuscula(String str) {
        System.out.println("Frase minúscula: " + str.toLowerCase());
    }

    public static void ultimocrt(String str) {
        System.out.println("Último caractere: " + str.charAt(str.length() - 1));
    }

    public static void tresprimeiroscrts(String str) {
        System.out.println("Três primeiros Caracteres: " + str.substring(0, Math.min(str.length(), 3)));
    }

    public static void espacosporhifen(String str) {
        System.out.println("Espaços por Hífens: " + str.replace(" ", "-"));
    }

    public static void procurarpalavra(String str, Scanner scanner) {
        System.out.print("Palavra que procura: ");
        String palavra = scanner.next();
        System.out.println("A string contém a palavra? " + str.contains(palavra));
    }

    public static void inverterstr(String str) {
        String strinvertida = "";

        for (int i = (str.length()-1); i >=0 ; i--) {
            strinvertida += str.charAt(i);
        }
        System.out.println("String invertida: " + strinvertida);
    }
}
