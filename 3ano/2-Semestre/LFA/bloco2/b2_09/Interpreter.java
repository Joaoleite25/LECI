import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Interpreter extends FractionalBaseVisitor<Fraction> {
    private Map<String, Fraction> memory = new HashMap<>();
    private Scanner sc = new Scanner(System.in);

    // print expr ;
    @Override
    public Fraction visitStatPrint(FractionalParser.StatPrintContext ctx) {
        Fraction res = visit(ctx.expr());
        if (res != null) {
            System.out.println(res);
        }
        return res;
    }

    // expr -> ID ;
    @Override
    public Fraction visitStatAssign(FractionalParser.StatAssignContext ctx) {
        Fraction val = visit(ctx.expr());
        String id = ctx.ID().getText();
        memory.put(id, val);
        return val;
    }

    // Operações de Soma e Subtração
    @Override
public Fraction visitExprAddSub(FractionalParser.ExprAddSubContext ctx) {
    Fraction left = visit(ctx.expr(0));
    Fraction right = visit(ctx.expr(1));
    
    if (left == null || right == null) {
        System.err.println("Erro: Operação aritmética com valor nulo.");
        return new Fraction(0, 1);
    }

    return ctx.op.getText().equals("+") ? left.add(right) : left.subtract(right);
}

    // Operações de Multiplicação (*) e Divisão de Frações (:)
    @Override
    public Fraction visitExprMulDiv(FractionalParser.ExprMulDivContext ctx) {
        Fraction left = visit(ctx.expr(0));
        Fraction right = visit(ctx.expr(1));
        String op = ctx.op.getText();
        return op.equals("*") ? left.multiply(right) : left.divide(right);
    }

    // Operador Unário (- ou +)
    @Override
    public Fraction visitExprUnary(FractionalParser.ExprUnaryContext ctx) {
        Fraction res = visit(ctx.expr());
        if (ctx.op.getText().equals("-")) {
            return new Fraction(-res.getNum(), res.getDen());
        }
        return res;
    }

    // Variáveis
    @Override
    public Fraction visitExprId(FractionalParser.ExprIdContext ctx) {
        String id = ctx.ID().getText();
        if (memory.containsKey(id)) return memory.get(id);
        System.err.println("Erro: variável '" + id + "' não definida.");
        return new Fraction(0, 1);
    }

    // Literais (1/4, 2, -3/2)
    @Override
    public Fraction visitExprFraction(FractionalParser.ExprFractionContext ctx) {
        int n = Integer.parseInt(ctx.fraction().num.getText());
        if (ctx.fraction().sign != null) n = -n;
        int d = (ctx.fraction().den != null) ? Integer.parseInt(ctx.fraction().den.getText()) : 1;
        return new Fraction(n, d);
    }

    @Override
    public Fraction visitExprParent(FractionalParser.ExprParentContext ctx) {
        return visit(ctx.expr());
    }

    @Override
    public Fraction visitExprReduce(FractionalParser.ExprReduceContext ctx) {
        Fraction f = visit(ctx.expr());
        return (f != null) ? f.reduce() : null;
    }

// 1. Implementar a Potência (Regra #ExprPower)
@Override
public Fraction visitExprPower(FractionalParser.ExprPowerContext ctx) {
    Fraction base = visit(ctx.expr(0));
    Fraction expFrac = visit(ctx.expr(1));
    
    if (base == null || expFrac == null) return null;

    // Nota 1: Expoentes são inteiros. 
    // Se expFrac for 3/1, o int exp será 3.
    int exp = expFrac.getNum() / expFrac.getDen();

    if (exp >= 0) {
        return new Fraction(
            (int) Math.pow(base.getNum(), exp),
            (int) Math.pow(base.getDen(), exp)
        );
    } else {
        // Expoente negativo: inverte a fração e usa expoente positivo
        // (1/2)^-3 vira (2/1)^3
        int absExp = Math.abs(exp);
        return new Fraction(
            (int) Math.pow(base.getDen(), absExp),
            (int) Math.pow(base.getNum(), absExp)
        );
    }
}

// 2. Implementar o Read (Regra #ExprRead)
@Override
public Fraction visitExprRead(FractionalParser.ExprReadContext ctx) {
    String prompt = ctx.String().getText().replace("\"", "");
    System.out.print(prompt + ": ");
    
    if (sc.hasNextLine()) {
        String input = sc.nextLine().trim();
        // Lógica para converter "1/2" ou "5" numa Fraction
        return parseFraction(input);
    }
    return new Fraction(0, 1);
}

// Método auxiliar para processar a String do utilizador
private Fraction parseFraction(String s) {
    if (s.contains("/")) {
        String[] parts = s.split("/");
        return new Fraction(Integer.parseInt(parts[0].trim()), Integer.parseInt(parts[1].trim()));
    }
    return new Fraction(Integer.parseInt(s.trim()), 1);
}
}