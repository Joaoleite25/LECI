import java.util.*;

public class SetVisitor extends SetCalcBaseVisitor<Set<String>> {
    private Map<String, Set<String>> memory = new HashMap<>();

    @Override
    public Set<String> visitStatExpr(SetCalcParser.StatExprContext ctx) {
        Set<String> result = visit(ctx.expr());
        System.out.println("result: " + formatSet(result));
        return result;
    }

    @Override
    public Set<String> visitStatAssign(SetCalcParser.StatAssignContext ctx) {
        String id = ctx.VAR().getText();
        Set<String> value = visit(ctx.expr());
        memory.put(id, value);
        System.out.println("result: " + formatSet(value));
        return value;
    }

    @Override
    public Set<String> visitExprUnion(SetCalcParser.ExprUnionContext ctx) {
        Set<String> left = visit(ctx.expr(0));
        Set<String> right = visit(ctx.expr(1));
        Set<String> res = new HashSet<>(left);
        res.addAll(right);
        return res;
    }

    @Override
    public Set<String> visitExprIntersection(SetCalcParser.ExprIntersectionContext ctx) {
        Set<String> left = visit(ctx.expr(0));
        Set<String> right = visit(ctx.expr(1));
        Set<String> res = new HashSet<>(left);
        res.retainAll(right);
        return res;
    }

    @Override
    public Set<String> visitExprDifference(SetCalcParser.ExprDifferenceContext ctx) {
        Set<String> left = visit(ctx.expr(0));
        Set<String> right = visit(ctx.expr(1));
        Set<String> res = new HashSet<>(left);
        res.removeAll(right);
        return res;
    }

    @Override
    public Set<String> visitExprSet(SetCalcParser.ExprSetContext ctx) {
        Set<String> res = new HashSet<>();
        for (SetCalcParser.ElementContext ectx : ctx.set().element()) {
            res.add(ectx.getText());
        }
        return res;
    }

    @Override
    public Set<String> visitExprVar(SetCalcParser.ExprVarContext ctx) {
        String id = ctx.VAR().getText();
        return memory.getOrDefault(id, new HashSet<>());
    }

    @Override
    public Set<String> visitExprParenthesis(SetCalcParser.ExprParenthesisContext ctx) {
        return visit(ctx.expr());
    }

    private String formatSet(Set<String> set) {
        return "{" + String.join(", ", set) + "}";
    }
}