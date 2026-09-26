import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Execute {
    public static void main(String[] args) throws Exception {
        CharStream input = CharStreams.fromStream(System.in);
        CalculatorLexer lexer = new CalculatorLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        CalculatorParser parser = new CalculatorParser(tokens);

        ParseTree tree = parser.program();

        InfixToPostfix visitor = new InfixToPostfix(); 
        visitor.visit(tree);
    }
}