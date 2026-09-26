import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Interpreter extends StrLangBaseVisitor<String> {

   private Map<String, String> variables = new HashMap<>();
   private Scanner sc = new Scanner(System.in);

   @Override public String visitProgram(StrLangParser.ProgramContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitStatPrint(StrLangParser.StatPrintContext ctx) {
      if (ctx.expr() != null) {
         String res = visit(ctx.expr());
         if (res != null) {
            System.out.println(res);
         }
      }
      return null;
   }

   @Override public String visitStatAssign(StrLangParser.StatAssignContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitAssignment(StrLangParser.AssignmentContext ctx) {
      String id = ctx.ID().getText();
      String expr = visit(ctx.expr());

      if (id == null || expr == null) return null;

      variables.put(id, expr);
      return null;
   }

   @Override public String visitExprAdd(StrLangParser.ExprAddContext ctx) {
      String left = visit(ctx.expr(0));
      String right = visit(ctx.expr(1));

      if (left == null || right == null) return null;

      return left + right;
   }

   @Override public String visitExprSub(StrLangParser.ExprSubContext ctx) {
      String left = visit(ctx.expr(0));
      String right = visit(ctx.expr(1));

      if (left == null || right == null) return null;

      return left.replace(right, "");
   }

   @Override public String visitExprTrim(StrLangParser.ExprTrimContext ctx) {
      String expr = visit(ctx.expr());

      if (expr == null) return null;

      return expr.trim();
   }

   @Override public String visitExprInput(StrLangParser.ExprInputContext ctx) {
      String prompt = visit(ctx.expr());

      System.out.print(prompt);

      if (sc.hasNextLine()) {
         return sc.nextLine();
      }

      return "";
   }

   @Override public String visitExprParentesis(StrLangParser.ExprParentesisContext ctx) {
      return visit(ctx.expr());
   }

   @Override public String visitExprSubs(StrLangParser.ExprSubsContext ctx) {
      String first = visit(ctx.expr(0));
      String second = visit(ctx.expr(1));
      String third = visit(ctx.expr(2));

      if (first == null || second == null || third == null) return null;

      return first.replace(second, third);
   }

   @Override public String visitExprString(StrLangParser.ExprStringContext ctx) {
      String string = ctx.STRING().getText();
      return string.substring(1, string.length() - 1);
   }

   @Override public String visitExprId(StrLangParser.ExprIdContext ctx) {
      String id = ctx.ID().getText();

      if (id == null) return null;

      if (!variables.containsKey(id)) {
         System.err.println("Erro: variavel nao definida! ");
         return null;
      }

      return variables.get(id);
   }
}
