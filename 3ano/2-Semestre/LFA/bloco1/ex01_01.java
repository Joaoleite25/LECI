import java.util.Scanner;

public class  b1_1 {

    private static Scanner sc = new Scanner(System.in);
    
    public  b1_1() {
        
        /* 1º Número */
        if (!System.nextdouble()) {
            System.out.println("ERROR: First is not a number!");
            sc.close();
            return;
        }
        double num1 = sc.nextDouble();

        /* Operando */
        if (!System.next("[+-*/]")) {
            System.out.println("ERROR: This is not an operation!")
            sc.close();
            return;
        }
        string op = System.next();

        /* 2º Número */
        if (!System.nextdouble()) {
            System.out.println("ERROR: Second is not a number!");
            sc.close();
            return;
        }
        double num2 = sc.nextDouble();

        /* Verificar se não há mais nada */
        if (System.next()) {
            System.out.println("ERROR: Should have finnish!")
            sc.close();
            return;
        }
        sc.close();

        /* Operação */
        switch(op):
            case "+":
                System.out.println(num1 + num2);
                return;
            case "-":
                System.out.println(num1 - num2);
                return;
            case "*":
                System.out.println(num1 * num2);
                return;
            case "/":
                if (num2 == 0) {
                    System.out.println("ERROR: Divide by 0!";
                    return;
                }
                System.out.println(num1 / num2);
                return;
    }

}