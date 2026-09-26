import java.util.Scanner;
import java.util.Stack;

public class b1_3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Stack<Double> stack = new Stack<>();

        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            String[] tokens = line.split("\\s+");

            for (String token : tokens) {
                if (isNumber(token)) {
                    //* Meter os Números na Stack */
                    stack.push(Double.parseDouble(token));
                    System.out.println("Stack: " + stack);
                } else if (isOperator(token)) {
                    /* Se não houver Números suficientes */
                    if (stack.size() < 2) {
                        System.err.println("ERROR: Not enough operands for operator \"" + token + "\"");
                        return;
                    }
                    double b = stack.pop();
                    double a = stack.pop();
                    double result = performOperation(a, b, token);
                    stack.push(result);
                    System.out.println("Stack: " + stack);
                } else {
                    System.err.println("ERROR: Invalid token \"" + token + "\"");
                    return;
                }
            }
        }

        if (stack.size() == 1) {
            System.out.println("Result: " + stack.pop());
        } else {
            System.err.println("ERROR: Invalid expression, leftover elements in stack: " + stack);
        }
    }

    private static boolean isNumber(String token) {
        try {
            Double.parseDouble(token);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private static boolean isOperator(String token) {
        return token.equals("+") || token.equals("-") || token.equals("*") || token.equals("/");
    }

    private static double performOperation(double a, double b, String operator) {
        switch (operator) {
            case "+":
                return a + b;
            case "-":
                return a - b;
            case "*":
                return a * b;
            case "/":
                if (b == 0) {
                    System.err.println("ERROR: Divide by zero");
                    System.exit(1);
                }
                return a / b;
            default:
                throw new IllegalArgumentException("Invalid operator: " + operator);
        }
    }
}