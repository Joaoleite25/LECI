package aula12.ex1;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashSet;
import java.util.Scanner;

public class Counter {
    public static void main(String[] args) {
        HashSet<String> palavras = new HashSet<>();
        try {
            File file = new File("Pratica/src/aula12/texto.txt");
            Scanner scanner = new Scanner(file);
            while (scanner.hasNext()) {
                String palavra = scanner.next();
                palavras.add(palavra);
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("Ocorreu um erro!");
            e.printStackTrace();
        }
        System.out.println("Número de palavras diferentes: " + palavras.size());
    }
}