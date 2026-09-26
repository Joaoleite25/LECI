import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

public class Interpreter extends CalculatorBaseVisitor<Long> {

    // 1. Processa cada linha (stat) e imprime o resultado
    @Override
    public Long visitStat(CalculatorParser.StatContext ctx) {
        if (ctx.expr() != null) {
            Long res = visit(ctx.expr()); // Calcula a expressão
            System.out.println(res);      // Imprime o resultado final da linha
            return res;
        }
        return null;
    }

    // 2. Converte o texto "123" para o número 123
    @Override
    public Long visitExprInteger(CalculatorParser.ExprIntegerContext ctx) {
        return Long.parseLong(ctx.Integer().getText());
    }

    // 3. Resolve o que está dentro de parênteses
    @Override
    public Long visitExprParent(CalculatorParser.ExprParentContext ctx) {
        return visit(ctx.expr());
    }

    // 4. Lógica de Multiplicação e Divisão
    @Override
    public Long visitExprMultDivMod(CalculatorParser.ExprMultDivModContext ctx) {
        Long left = visit(ctx.expr(0));
        Long right = visit(ctx.expr(1));
        String op = ctx.op.getText();

        if (op.equals("*")) return left * right;
        if (right == 0) throw new ArithmeticException("Erro: Divisão por zero!");
        return left / right;
    }

    // 5. Lógica de Soma e Subtração
    @Override
    public Long visitExprAddSub(CalculatorParser.ExprAddSubContext ctx) {
        Long left = visit(ctx.expr(0));
        Long right = visit(ctx.expr(1));
        String op = ctx.op.getText();

        return op.equals("+") ? left + right : left - right;
    }

    @Override
public Long visitExprUnary(CalculatorParser.ExprUnaryContext ctx) {
    // 1. Resolve o valor da expressão à direita do sinal
    Long value = visit(ctx.expr());
    String op = ctx.op.getText();

    // 2. Aplica o sinal
    if (op.equals("-")) {
        return -value;
    }
    return value; // Se for '+', o valor não muda
}
}