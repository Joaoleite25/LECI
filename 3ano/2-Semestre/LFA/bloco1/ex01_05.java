import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.StringTokenizer;

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
    }

    private static int convertToNumber(String input) {
        StringTokenizer tokenizer = new StringTokenizer(input, " ");
        int total = 0;
        int currentValue = 0;

        while (tokenizer.hasMoreTokens()) {
            String token = tokenizer.nextToken();
            if (numberMap.containsKey(token)) {
                currentValue += numberMap.get(token);
            } else if (token.equalsIgnoreCase("hundred")) {
                currentValue *= 100;
            } else if (token.equalsIgnoreCase("thousand")) {
                total += currentValue * 1000;
                currentValue = 0;
            }
        }
        total += currentValue;
        return total;
    }
}