package aula03;

import java.util.Random;
import java.util.Scanner;

public class Ex03 {
    public static void main(String[] args) {
        String resposta;
        Random rand = new Random();
        Scanner scanner = new Scanner(System.in);
        do {
            jogo(rand, scanner);
            System.out.print("Pretende continuar? Prima (S)im ");
            resposta = scanner.next();
        } while (resposta.equals("S") || resposta.equals("Sim"));

        scanner.close();
    }

    public static void jogo(Random rand, Scanner scanner) {
        int num, tent;
        num = rand.nextInt(100) + 1;
        do {
            System.err.print("Tentativa: ");
            tent = scanner.nextInt();
            if (tent < num) {
                System.out.println("Tentativa baixa!");
            }
            else if (tent > num) {
                System.out.println("Tentativa alta!");
            }
        } while (tent != num);

    }
}
