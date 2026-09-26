import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class b1_4 {
    public static void main(String[] args) {
        Map<String, String> numberMap = new HashMap<>();
        try (Scanner fileScanner = new Scanner(new java.io.File("numbers.txt"))) {
            while (fileScanner.hasNextLine()) {
                String line = fileScanner.nextLine();
                String[] parts = line.split("\\s+", 2);
                if (parts.length == 2) {
                    numberMap.put(parts[1].trim(), parts[0].trim());
                }
            }
        } catch (java.io.IOException e) {
            System.err.println("ERROR: Could not read numbers.txt");
            return;
        }

        Scanner inputScanner = new Scanner(System.in);
        while (inputScanner.hasNextLine()) {
            String line = inputScanner.nextLine();
            String[] words = line.split("\\s+");
            StringBuilder output = new StringBuilder();

            for (String word : words) {
                if (numberMap.containsKey(word)) {
                    output.append(numberMap.get(word)).append(" ");
                } else {
                    output.append(word).append(" ");
                }
            }

            System.out.println(output.toString().trim());
        }
    }
}