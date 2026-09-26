import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

public class Execute extends SuffixCalculatorBaseVisitor<Double> {

    @Override
    public Double visitStatExpr(SuffixCalculatorParser.StatExprContext ctx) {
        if (ctx.expr() != null) {
            Double res = visit(ctx.expr());
            if (res != null) {
                System.out.println("Resultado: " + res);
            }
            return res;
        }
        return null;
    }

    @Override
    public Double visitExprNumber(SuffixCalculatorParser.ExprNumberContext ctx) {
        return Double.parseDouble(ctx.Number().getText());
    }

    @Override
    public Double visitExprSuffix(SuffixCalculatorParser.ExprSuffixContext ctx) {
        Double left = visit(ctx.expr(0));
        Double right = visit(ctx.expr(1));
        String op = ctx.op.getText();

        if (left == null || right == null) return null;

        switch (op) {
            case "+": return left + right;
            case "-": return left - right;
            case "*": return left * right;
            case "/": 
                if (right == 0) {
                    System.err.println("Erro: Divisão por zero!");
                    return 0.0;
                }
                return left / right;
            default: return 0.0;
        }
    }
}