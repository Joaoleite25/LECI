import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Execute {
    public static void main(String[] args) throws Exception {
        // Lê o input (podes escrever no terminal ou passar um ficheiro)
        CharStream input = CharStreams.fromStream(System.in);
        CalculatorLexer lexer = new CalculatorLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        CalculatorParser parser = new CalculatorParser(tokens);
        
        // Gera a árvore sintática
        ParseTree tree = parser.program();

        // Executa o teu Interpreter (Visitor)
        Interpreter visitor = new Interpreter();
        visitor.visit(tree);
    }
}