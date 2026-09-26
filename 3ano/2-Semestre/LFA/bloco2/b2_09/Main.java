import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {   
        try {
            CharStream input;
            if (args.length > 0) {
                // Lê o ficheiro passado como argumento (Nota 3 do exercício)
                input = CharStreams.fromFileName(args[0]);
            } else {
                // Lê do terminal se não houver argumento
                input = CharStreams.fromStream(System.in);
            }

            FractionalLexer lexer = new FractionalLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            FractionalParser parser = new FractionalParser(tokens);
            
            // Executa o programa através do Visitor
            ParseTree tree = parser.program();
            Interpreter visitor = new Interpreter();
            visitor.visit(tree);

        } catch (IOException e) {
            System.err.println("Erro ao ler o ficheiro: " + e.getMessage());
        }
    }
}