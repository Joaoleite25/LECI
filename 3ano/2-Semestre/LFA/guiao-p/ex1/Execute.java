import java.util.HashMap;
import java.util.Scanner;

public class Execute extends StrLangBaseVisitor<String> {
    
    private HashMap<String, String> memoria = new HashMap<>();
    private Scanner sc = new Scanner(System.in);

    @Override
    public String visitPrint(StrLangParser.PrintContext ctx) {
        String x = visit(ctx.expr());
        System.out.println(x);
        return x;
    }

    @Override
    public String visitString(StrLangParser.StringContext ctx) {
        String s = ctx.String().getText();
        return s.substring(1, s.length() - 1);
    }

    @Override
    public String visitId(StrLangParser.IdContext ctx) {
        String i = ctx.ID().getText();
        if (memoria.containsKey(i)) {
            return memoria.get(i);
        }
        return i + " não está definido";
    }

    @Override
    public String visitAssign(StrLangParser.AssignContext ctx) {
        String id = ctx.ID().getText();
        String s = visit(ctx.expr());
        memoria.put(id,s);
        return s;
    }

    @Override
    public String visitInput(StrLangParser.InputContext ctx) { 
        System.out.print(visit(ctx.expr()));

        if (sc.hasNextLine()){
            return sc.nextLine();
        }
        
        return "";
    }

    @Override
    public String visitAdd(StrLangParser.AddContext ctx) {
        String a = visit(ctx.expr(0));
        String b = visit(ctx.expr(1));

        if (a == null || b == null) return null;

        return a + b;
    }

    @Override
    public String visitSub(StrLangParser.SubContext ctx) {
        String a = visit(ctx.expr(0));
        String b = visit(ctx.expr(1));

        if (a == null || b == null) return null;

        return a.replace(b, ""); 
    }

    @Override
    public String visitTrim(StrLangParser.TrimContext ctx) {
        String x = visit(ctx.expr());

        if (x == null) return null;

        return x.trim(); 
    }

    @Override
    public String visitSubst(StrLangParser.SubstContext ctx) {
        String a = visit(ctx.expr(0));
        String b = visit(ctx.expr(1));
        String c = visit(ctx.expr(2));

        if (a == null || b == null || c == null) return null;

        return a.replace(b, c); 
    }

    @Override
    public String visitParent(StrLangParser.ParentContext ctx) {
        return visit(ctx.expr());
    }

}