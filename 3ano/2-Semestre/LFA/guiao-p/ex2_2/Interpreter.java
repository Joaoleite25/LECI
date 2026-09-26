import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Interpreter extends FracLangBaseVisitor<Integer[]> {
   
   private static HashMap<String, Integer[]> memoria = new HashMap<>();
   private static Scanner sc = new Scanner(System.in);

   @Override public Integer[] visitProgram(FracLangParser.ProgramContext ctx) {
      Integer[] res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Integer[] visitDisplay(FracLangParser.DisplayContext ctx) {
      Integer[] res = visit(ctx.expr());
      if (res!=null) {
         System.out.println(res[0] + "/" + res[1]);
      }
      return res;
   }

   @Override public Integer[] visitGuarda(FracLangParser.GuardaContext ctx) {
      String id = ctx.ID().getText();
      Integer[] f = visit(ctx.expr());
      memoria.put(id, f);
      return f;
   }

   @Override public Integer[] visitRead(FracLangParser.ReadContext ctx) {
      System.out.print(ctx.String().getText() + ": ");
      String i = sc.nextLine();
      Integer[] input = StringToInt(i.split("/"));
      return input;
   }

   @Override public Integer[] visitParent(FracLangParser.ParentContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Integer[] visitMulDiv(FracLangParser.MulDivContext ctx) {
      Integer[] a = visit(ctx.e1).clone();
      Integer[] b = visit(ctx.e2).clone();

      if (ctx.op.getText().equals("*")) {
         return new Integer[] {a[0] * b[0], a[1] * b[1]};
      }
      return new Integer[] {a[0] * b[1], a[1] * b[0]};
   }

   @Override public Integer[] visitPosNeg(FracLangParser.PosNegContext ctx) {
      Integer[] f = visit(ctx.expr()).clone();
      if (ctx.op.getText().equals("-")) {
         f[0] = -f[0];
      }
      return f;
   }

   @Override public Integer[] visitFraction(FracLangParser.FractionContext ctx) {
      return StringToInt(ctx.Fraction().getText().split("/"));
   }

   @Override public Integer[] visitID(FracLangParser.IDContext ctx) {
      String id = ctx.ID().getText();
      if (memoria.containsKey(id)) {
         return memoria.get(id);
      }
      System.out.println("ID nao definido");
      return new Integer[] {0, 1};
   }

   @Override public Integer[] visitString(FracLangParser.StringContext ctx) {
      return visit(ctx.String());
   }

   @Override public Integer[] visitReduce(FracLangParser.ReduceContext ctx) {
      Integer[] f = visit(ctx.expr()).clone();
      int mdc = mdc(f[0], f[1]);
      if (mdc > 1) {
         f[0] /= mdc;
         f[1] /= mdc;
      }
      return f;
   }

   private int mdc(int a, int b) {
      if (b == 0) {
         return a;
      }
      return mdc(b, a%b);
   }

   @Override public Integer[] visitSomSub(FracLangParser.SomSubContext ctx) {
      Integer[] a = visit(ctx.e1).clone();
      Integer[] b = visit(ctx.e2).clone();

      if (ctx.op.getText().equals("+")) {
         return new Integer[] {a[0] * b[1] + b[0] * a[1], a[1] * b[1]};
      }
      return new Integer[] {a[0] * b[1] - b[0] * a[1], a[1] * b[0]};
   }

   private Integer[] StringToInt(String[] s) {
      String[] input = s;
      Integer[] f = {1,1};
      for (int i = 0; i < input.length; i++) {
         f[i] = Integer.parseInt(input[i]);
      }
      
      return f;
   }
}
