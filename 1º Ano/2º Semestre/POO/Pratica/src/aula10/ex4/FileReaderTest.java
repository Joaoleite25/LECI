package aula10.ex4;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FileReaderTest {
    public static void main(String[] args) {
        List<String> words = new ArrayList<>();

        try (Scanner input = new Scanner(new FileReader("src/aula10/ex4/palavras.txt"))) { 
            while (input.hasNext()) {
                String word = input.next();
                if (word.length() > 2) {
                    words.add(word);
                }
                System.out.println(word);
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }

        for (String word : words) {
            if (word.endsWith("s")) {
                System.out.println(word);
            }
        }

        words.removeIf(word -> !word.matches("^[a-zA-Záàãâéẽêíóõôúç]+$"));
    }
}