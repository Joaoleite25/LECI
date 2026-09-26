import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Interpreter extends FracLangBaseVisitor<Fraction> {

   private HashMap<String, Fraction> memoria = new HashMap<>();

   @Override public Fraction visitProgram(FracLangParser.ProgramContext ctx) {
      Fraction res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Fraction visitDisplay(FracLangParser.DisplayContext ctx) {
      Fraction res = visit(ctx.expr());
      if (res != null) {
         System.out.println(res.toString());
      }
      return res;
   }

   @Override public Fraction visitMenIgual(FracLangParser.MenIgualContext ctx) {
      String id = ctx.ID().getText();
      Fraction val = visit(ctx.expr());
      memoria.put(id,val);
      return val;
   }

   @Override public Fraction visitDiv(FracLangParser.DivContext ctx) {
      Fraction a = visit(ctx.expr(0));
      Fraction b = visit(ctx.expr(1));
      return Fraction.Dividir(a,b);
   }

   @Override public Fraction visitSub(FracLangParser.SubContext ctx) {
      Fraction a = visit(ctx.expr(0));
      Fraction b = visit(ctx.expr(1));
      return Fraction.Subtrair(a,b);
   }

   @Override public Fraction visitNumber(FracLangParser.NumberContext ctx) {
      int num = Integer.parseInt(ctx.Number().getText());
      return new Fraction(num);
   }

   @Override public Fraction visitMult(FracLangParser.MultContext ctx) {
      Fraction a = visit(ctx.expr(0));
      Fraction b = visit(ctx.expr(1));
      return Fraction.Multiplicar(a,b);
   }

   @Override public Fraction visitParent(FracLangParser.ParentContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Fraction visitSoma(FracLangParser.SomaContext ctx) {
      Fraction a = visit(ctx.expr(0));
      Fraction b = visit(ctx.expr(1));
      return Fraction.Soma(a,b);
   }

   @Override public Fraction visitID(FracLangParser.IDContext ctx) {
      String id = ctx.ID().getText();
      if (!memoria.containsKey(id)) {
         System.out.println("Erro: de Id");
         return new Fraction(0);
      }
      return memoria.get(id);
   }

   @Override public Fraction visitNegativo(FracLangParser.NegativoContext ctx) {
      Fraction a = visit(ctx.expr());
      return new Fraction(-a.num(), a.den());
   }

   

   private Scanner sc = new Scanner(System.in);

   @Override public Fraction visitRead(FracLangParser.ReadContext ctx) {
      String prompt = ctx.String().getText();
      prompt = prompt.substring(1, prompt.length() - 1);
      
      System.out.print(prompt + ": ");
      
      if (sc.hasNextLine()) {
         String input = sc.nextLine();
         if (input.contains("/")) {
               String[] partes = input.split("/");
               int n = Integer.parseInt(partes[0].trim());
               int d = Integer.parseInt(partes[1].trim());
               return new Fraction(n, d);
         }
         return new Fraction(Integer.parseInt(input.trim()));
      }
      return new Fraction(0);
   }

   @Override 
   public Fraction visitReduce(FracLangParser.ReduceContext ctx) {
      return visit(ctx.expr()); 
   }

}
