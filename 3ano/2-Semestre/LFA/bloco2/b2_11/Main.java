import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        SetVisitor visitor = new SetVisitor();

        System.out.println("Calculadora de Conjuntos (Digita as expressões ou 'exit' para sair):");
        System.out.println("Exemplo: A = {a, b, c}");

        while (true) {
            System.out.print("> ");
            if (!sc.hasNextLine()) break;
            
            String line = sc.nextLine().trim();
            if (line.equalsIgnoreCase("exit")) break;
            if (line.isEmpty() || line.startsWith("--")) continue;

            try {
                CharStream input = CharStreams.fromString(line);

                SetCalcLexer lexer = new SetCalcLexer(input);
                CommonTokenStream tokens = new CommonTokenStream(lexer);
                SetCalcParser parser = new SetCalcParser(tokens);

                ParseTree tree = parser.stat();

                visitor.visit(tree);

            } catch (Exception e) {
                System.err.println("Erro de sintaxe: " + e.getMessage());
            }
        }
        sc.close();
    }
}