import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.FileInputStream;
import java.util.Map;

public class NumbersMain {
    public static void main(String[] args) throws Exception {
        // 1. Setup do ANTLR para ler o ficheiro numbers.txt
        CharStream input = CharStreams.fromStream(new FileInputStream("numbers.txt"));
        NumbersLexer lexer = new NumbersLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        NumbersParser parser = new NumbersParser(tokens);
        ParseTree tree = parser.file();

        // 2. Usar o Listener para preencher o mapa
        ParseTreeWalker walker = new ParseTreeWalker();
        NumbersLoader loader = new NumbersLoader();
        walker.walk(loader, tree);

        // 3. Obter o mapa preenchido
        Map<Integer, String> dictionary = loader.getMappings();

        // A partir daqui, usas o 'dictionary' para converter frases 
        // (ex: "two hundred" -> 200) como fizeste no ex 1.04
        System.out.println("Dicionário carregado com " + dictionary.size() + " entradas.");
    }
}