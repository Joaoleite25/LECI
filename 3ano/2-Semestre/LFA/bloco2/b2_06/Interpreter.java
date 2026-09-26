import java.util.HashMap;
import java.util.Map;

public class Interpreter extends CalculatorBaseVisitor<Long> {
    private Map<String, Long> memory = new HashMap<>();

    // s t a t : expr NEWLINE
    @Override
    public Long visitStatExpr(CalculatorParser.StatExprContext ctx) {
        if (ctx.expr() != null) {
            Long res = visit(ctx.expr());
            System.out.println(res); // É ESTA LINHA QUE FALTA!
            return res;
        }
        return null;
    }

    // s t a t : assignment NEWLINE
    @Override
    public Long visitStatAssign(CalculatorParser.StatAssignContext ctx) {
        // Nas atribuições (a = 5), normalmente não imprimimos nada,
        // apenas guardamos o valor.
        String id = ctx.assignment().ID().getText();
        Long value = visit(ctx.assignment().expr());
        memory.put(id, value);
        return value;
    }

    @Override
    public Long visitExprId(CalculatorParser.ExprIdContext ctx) {
        String id = ctx.ID().getText();
        if (memory.containsKey(id)) {
            return memory.get(id);
        }
        System.err.println("Erro: variável '" + id + "' não definida.");
        return 0L;
    }

    @Override
    public Long visitExprInteger(CalculatorParser.ExprIntegerContext ctx) {
        return Long.parseLong(ctx.Integer().getText());
    }


    @Override
    public Long visitExprMultDivMod(CalculatorParser.ExprMultDivModContext ctx) {
        Long left = visit(ctx.expr(0));
        Long right = visit(ctx.expr(1));
        String op = ctx.op.getText();

        if (op.equals("*")) return left * right;
        if (right == 0) throw new ArithmeticException("Erro: Divisão por zero!");
        return left / right;
    }

    @Override
    public Long visitExprAddSub(CalculatorParser.ExprAddSubContext ctx) {
        Long left = visit(ctx.expr(0));
        Long right = visit(ctx.expr(1));
        String op = ctx.op.getText();

        return op.equals("+") ? left + right : left - right;
    }
    @Override
    public Long visitExprParent(CalculatorParser.ExprParentContext ctx) {
        return visit(ctx.expr());
    }
}