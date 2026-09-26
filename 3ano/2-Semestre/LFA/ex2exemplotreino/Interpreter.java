import java.util.HashMap;
import java.util.Scanner;

public class Interpreter extends FracLangBaseVisitor<Fraction> {

   private HashMap<String, Fraction> memory = new HashMap<>();
   private Scanner scanner = new Scanner(System.in);

   @Override 
   public Fraction visitProgram(FracLangParser.ProgramContext ctx) {
      Fraction res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override 
   public Fraction visitStat(FracLangParser.StatContext ctx) {
      if (ctx == null) return null;

      // Em caso de atribuição com ID
      if (ctx.ID() != null) {
         String id = ctx.ID().getText();
         Fraction val = visit(ctx.expr());
         if (val != null) {
            memory.put(id, val);
         }
         return val;
      // Se não tem ID, é uma instrução de impressão: 'display' expr ';'
      } else {
         Fraction val = visit(ctx.expr());
         if (val != null) {
            System.out.println(val.toString());
         }
         return val;
      }
   }

   @Override 
   public Fraction visitExprFraction(FracLangParser.ExprFractionContext ctx) {
      if (ctx == null) return null;

      int num = Integer.parseInt(ctx.NUMBER(0).getText());
      int den = Integer.parseInt(ctx.NUMBER(1).getText());
      return new Fraction(num, den);
   }

   @Override 
   public Fraction visitExprInteger(FracLangParser.ExprIntegerContext ctx) {
      if (ctx == null) return null;

      int num = Integer.parseInt(ctx.NUMBER().getText());
      return new Fraction(num);
   }

   @Override 
   public Fraction visitExprId(FracLangParser.ExprIdContext ctx) {
      if (ctx == null) return null;

      String id = ctx.ID().getText();
      if (memory.containsKey(id)) {
         return memory.get(id);
      }
      System.err.println("Erro Semântico: Variável " + id + " não definida!");
      return null;
   }

   @Override 
   public Fraction visitExprParens(FracLangParser.ExprParensContext ctx) {
      return visit(ctx.expr());
   }

   @Override 
   public Fraction visitExprUnary(FracLangParser.ExprUnaryContext ctx) {
      if (ctx == null || ctx.expr() == null) return null;

      Fraction val = visit(ctx.expr());
      if (val != null) {
         String op = ctx.op.getText();
         if (op.equals("-")) {
            return new Fraction(-val.num, val.den);
         }
         return val;
      }
      return null;
   }

   @Override 
   public Fraction visitExprMultDiv(FracLangParser.ExprMultDivContext ctx) {
      if (ctx == null || ctx.expr() == null) return null;

      Fraction left = visit(ctx.expr(0));
      Fraction right = visit(ctx.expr(1));
      
      if (left == null || right == null) return null;

      String op = ctx.op.getText();
      if (op.equals("*")) {
         return left.mult(right);
      } else {
         return left.div(right);
      }
   }

   @Override 
   public Fraction visitExprAddSub(FracLangParser.ExprAddSubContext ctx) {
      if (ctx == null || ctx.expr() == null) return null;

      Fraction left = visit(ctx.expr(0));
      Fraction right = visit(ctx.expr(1));

      if (left == null || right == null) return null;

      String op = ctx.op.getText();
      if (op.equals("+")) {
         return left.add(right);
      } else {
         return left.sub(right);
      }
   }

   @Override 
   public Fraction visitExprRead(FracLangParser.ExprReadContext ctx) {
      if (ctx == null) return null;

      // Apanha o texto ("x: ") e retira as aspas da primeira e última posição
      String prompt = ctx.STRING().getText();
      System.out.print(prompt.substring(1, prompt.length() - 1) + ": ");

      // Fica à espera que o utilizador escreva
      String input = scanner.nextLine().trim();

      // Verifica se o utilizador escreveu uma fração (com /) ou um número inteiro
      try {
         if(input.contains("/")) {
            String parts[] = input.split("/");
            int num = Integer.parseInt(parts[0]);
            int den = Integer.parseInt(parts[1]);
            return new Fraction(num, den);
         } else {
            int num = Integer.parseInt(input);
            return new Fraction(num, 1);
         }
      } catch (Exception e) {
         System.err.println("Erro: Formato Inválido!");
         return null;
      }
   }

   @Override 
   public Fraction visitExprReduce(FracLangParser.ExprReduceContext ctx) {
      if (ctx == null || ctx.expr() == null) return null;

      Fraction val = visit(ctx.expr());
      if (val != null) {
         return val.reduce();
      }
      return null;
   }
}
