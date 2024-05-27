package aula12.ex2;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;
import java.util.TreeMap;

public class CounterbyInicial {
    public static void main(String[] args) throws IOException {
        TreeMap<Character, TreeMap<String, Integer>> words = new TreeMap<>();
        Path path = Paths.get("Pratica/src/aula12/texto.txt");

        try (Scanner scanner = new Scanner(path)) {
            while (scanner.hasNext()) {
                String word = scanner.next().toLowerCase().replaceAll("[^a-zà-ú]", "");
                if (word.length() < 3) continue;
        
                char initial = word.charAt(0);
                words.putIfAbsent(initial, new TreeMap<>());
                words.get(initial).put(word, words.get(initial).getOrDefault(word, 0) + 1);
            }
        }
        
        for (Character initial : words.keySet()) {
            System.out.print(initial + ": ");
            for (String word : words.get(initial).keySet())
                System.out.print(word + ", " + words.get(initial).get(word) + "; ");
            System.out.println();
        }
    }
}