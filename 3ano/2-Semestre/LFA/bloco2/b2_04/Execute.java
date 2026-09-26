import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Execute {
    public static void main(String[] args) throws Exception {
        // 1. Ler o input do terminal
        CharStream input = CharStreams.fromStream(System.in);
        // 2. Ligar ao Lexer e Parser da calculadora prefixa
        PrefixCalculatorLexer lexer = new PrefixCalculatorLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        PrefixCalculatorParser parser = new PrefixCalculatorParser(tokens);
        
        // 3. Gerar a árvore
        ParseTree tree = parser.program();

        // 4. Correr o Visitor (Interpreter)
        Interpreter visitor = new Interpreter();
        visitor.visit(tree);
    }
}