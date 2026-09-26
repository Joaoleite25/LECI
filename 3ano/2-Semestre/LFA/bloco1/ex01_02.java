import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class b1_2 {
   private static Scanner a;
   private static Map a;

   public static void main(String[] var0) {
      Scanner var1;
      for(; a.hasNextLine(); var1.close()) {
         String var2 = a.nextLine();
         if ((var1 = new Scanner(var2)).hasNext()) {
            PrintStream var10000 = System.out;
            double var10001 = a(var2, var1, 0);
            var10000.println("result = " + var10001);
         }
      }

   }

   private static double a(String var0, Scanner var1, int var2) {
      if (!a && var1 == null) {
         throw new AssertionError();
      } else {
         double var3 = 0.0;
         double var6 = 0.0;
         if (var2 >= 2) {
            System.err.printf("ERROR: invalid expression (\"%s\")\n", var0);
            System.exit(1);
         }

         if (!var1.hasNext()) {
            System.err.printf("ERROR: invalid expression (\"%s\")\n", var0);
            System.exit(1);
         }

         String var5;
         if (b(var5 = var1.next())) {
            if (a.containsKey(var5)) {
               var6 = (Double)a.get(var5);
            } else if (!var1.hasNext("[=]")) {
               System.err.printf("ERROR: variable \"" + var5 + "\" not defined (\"%s\")\n", var0);
               System.exit(1);
            }
         } else if (a(var5)) {
            var6 = Double.parseDouble(var5);
         } else {
            System.err.printf("ERROR: invalid number \"%s\" (\"%s\")\n", var5, var0);
            System.exit(1);
         }

         if (var1.hasNext()) {
            String var8;
            if ((var8 = var1.next()).equals("=")) {
               if (var2 > 0 || !b(var5)) {
                  System.err.printf("ERROR: invalid assignment (\"%s\")\n", var0);
                  System.exit(1);
               }

               var3 = a(var0, var1, var2);
               a.put(var5, var3);
            } else {
               double var9 = a(var0, var1, var2 + 1);
               switch (var8) {
                  case "+":
                     var3 = var6 + var9;
                     break;
                  case "-":
                     var3 = var6 - var9;
                     break;
                  case "*":
                     var3 = var6 * var9;
                     break;
                  case "/":
                     if (var9 == 0.0) {
                        System.err.printf("ERROR: divide by zero (\"%s\")\n", var0);
                        System.exit(1);
                     }

                     var3 = var6 / var9;
                  case "=":
                     break;
                  default:
                     System.err.printf("ERROR: invalid operator \"%s\" (\"%s\")\n", var8, var0);
                     System.exit(1);
               }
            }
         } else {
            var3 = var6;
         }

         return var3;
      }
   }

   private static boolean a(String var0) {
      Scanner var2;
      boolean var1 = (var2 = new Scanner(var0)).hasNextDouble();
      var2.close();
      return var1;
   }

   private static boolean b(String var0) {
      if (!a && var0 == null) {
         throw new AssertionError();
      } else {
         boolean var1 = var0.length() > 0 && Character.isLetter(var0.charAt(0));

         for(int var2 = 1; var1 && var2 < var0.length(); ++var2) {
            var1 = Character.isLetterOrDigit(var0.charAt(var2));
         }

         return var1;
      }
   }

   static {
      a = new Scanner(System.in);
      a = new HashMap();
   }
}
