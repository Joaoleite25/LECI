import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        try {
            // Scanner para ler linha a linha do teclado
            Scanner sc = new Scanner(System.in);
            System.out.println("Calculadora RPN Pronta (Ctrl+D para sair):");

            while (sc.hasNextLine()) {
                String line = sc.nextLine() + "\n"; // Adiciona \n para bater com a regra NEWLINE
                if (line.trim().isEmpty()) continue;

                CharStream input = CharStreams.fromString(line);
                SuffixCalculatorLexer lexer = new SuffixCalculatorLexer(input);
                CommonTokenStream tokens = new CommonTokenStream(lexer);
                SuffixCalculatorParser parser = new SuffixCalculatorParser(tokens);
                
                ParseTree tree = parser.program();
                
                Execute visitor = new Execute();
                visitor.visit(tree);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}