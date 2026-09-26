public class InfixToPostfix extends CalculatorBaseVisitor<String> {

    @Override
    public String visitStatExpr(CalculatorParser.StatExprContext ctx) {
        if (ctx.expr() != null) {
            String res = visit(ctx.expr());
            System.out.println(res);
            return res;
        }
        return "";
    }

    @Override
public String visitStatAssign(CalculatorParser.StatAssignContext ctx) {
    String id = ctx.assignment().ID().getText();
    String exprPostfix = visit(ctx.assignment().expr());
    String res = id + " = " + exprPostfix;
    
    System.out.println(res);
    return res;
}
    @Override
    public String visitExprMultDivMod(CalculatorParser.ExprMultDivModContext ctx) {
        // Formato Sufixo: operando1 operando2 operador
        return visit(ctx.expr(0)) + " " + visit(ctx.expr(1)) + " " + ctx.op.getText();
    }

    @Override
    public String visitExprAddSub(CalculatorParser.ExprAddSubContext ctx) {
        return visit(ctx.expr(0)) + " " + visit(ctx.expr(1)) + " " + ctx.op.getText();
    }

    @Override
    public String visitExprUnary(CalculatorParser.ExprUnaryContext ctx) {
        String op = ctx.op.getText().equals("+") ? "!+" : "!-";
        return visit(ctx.expr()) + " " + op;
    }

    @Override
    public String visitExprInteger(CalculatorParser.ExprIntegerContext ctx) {
        return ctx.Integer().getText();
    }

    @Override
    public String visitExprId(CalculatorParser.ExprIdContext ctx) {
        return ctx.ID().getText();
    }

    @Override
    public String visitExprParent(CalculatorParser.ExprParentContext ctx) {
        // Em sufixo, os parênteses desaparecem pois a ordem é implícita
        return visit(ctx.expr());
    }
}