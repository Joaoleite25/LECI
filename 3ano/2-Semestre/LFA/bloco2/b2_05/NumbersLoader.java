import java.util.HashMap;
import java.util.Map;

public class NumbersLoader extends NumbersBaseListener {
    // 1. Criar o mapa para guardar os dados
    private Map<Integer, String> mappings = new HashMap<>();

    @Override
    public void exitLine(NumbersParser.LineContext ctx) {
        // 2. Extrair os valores (ajustado para os tokens em maiúsculas NUM e NAME)
        int value = Integer.parseInt(ctx.NUM().getText());
        String name = ctx.NAME().getText();
        
        mappings.put(value, name);
    }

    // 3. ADICIONAR ESTE MÉTODO (O que está a faltar)
    public Map<Integer, String> getMappings() {
        return mappings;
    }
}