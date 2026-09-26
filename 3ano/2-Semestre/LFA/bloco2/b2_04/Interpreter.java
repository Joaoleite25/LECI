public class Interpreter extends PrefixCalculatorBaseVisitor<Long> {

    @Override
    public Long visitStat(PrefixCalculatorParser.StatContext ctx) {
        if (ctx.expr() != null) {
            Long res = visit(ctx.expr());
            System.out.println("Result: " + res);
            return res;
        }
        return null;
    }

    @Override
    public Long visitExprBinary(PrefixCalculatorParser.ExprBinaryContext ctx) {
        // Numa gramática prefixa, visitamos os dois filhos
        Long left = visit(ctx.expr(0));
        Long right = visit(ctx.expr(1));
        String op = ctx.op.getText();

        switch (op) {
            case "+": return left + right;
            case "-": return left - right;
            case "*": return left * right;
            case "/": return left / right;
            case "%": return left % right;
            default: return 0L;
        }
    }

    @Override
    public Long visitExprUnary(PrefixCalculatorParser.ExprUnaryContext ctx) {
        Long val = visit(ctx.expr());
        return ctx.op.getText().equals("-") ? -val : val;
    }

    @Override
    public Long visitExprInteger(PrefixCalculatorParser.ExprIntegerContext ctx) {
        return Long.parseLong(ctx.Integer().getText());
    }

    @Override
    public Long visitExprParent(PrefixCalculatorParser.ExprParentContext ctx) {
        return visit(ctx.expr());
    }
}
