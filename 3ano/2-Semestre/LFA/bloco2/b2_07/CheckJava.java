import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.FileInputStream;

public class CheckJava {
    public static void main(String[] args) throws Exception {
        CharStream input = CharStreams.fromStream(new FileInputStream(args[0]));
        
        Java8Lexer lexer = new Java8Lexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        Java8Parser parser = new Java8Parser(tokens);
        
        ParseTree tree = parser.compilationUnit();

        ParseTreeWalker walker = new ParseTreeWalker();
        JavaStats extractor = new JavaStats();
        walker.walk(extractor, tree);
    }
}