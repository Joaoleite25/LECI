// Generated from Hello.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;
import java.util.ArrayList;
import java.util.List;

/**
 * This class provides an empty implementation of {@link HelloVisitor},
 * which can be extended to create a visitor which only needs to handle a subset
 * of the available methods.
 *
 * @param <String> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
@SuppressWarnings("CheckReturnValue")
// Note the "implements HelloVisitor<String>" addition
public class Execute extends HelloBaseVisitor<String> {

	@Override
    public String visitProgram(HelloParser.ProgramContext ctx) {
        StringBuilder sb = new StringBuilder();
        // Percorre cada 'stat' dentro do 'program'
        for (HelloParser.StatContext s : ctx.stat()) {
            String res = visit(s);
            if (res != null) {
                sb.append(res).append("\n");
            }
        }
        return sb.toString();
    }

    @Override 
    public String visitGreetings(HelloParser.GreetingsContext ctx) { 
        return "Olá, " + ctx.ID().getText(); 
    }

    @Override 
    public String visitBye(HelloParser.ByeContext ctx) { 
        // Você precisa deste método aqui!
        return "Tchau, " + ctx.ID().getText(); 
    }
}