package aula07;

import java.util.Scanner;

public class Ex01 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String acabar = "S";

        do {
            menu(scanner);
            System.out.print("Se pretende continuar digite (S)im: ");
            acabar = scanner.next();
        } while (acabar.equals("S") || acabar.equals("Sim"));

        scanner.close();
    }

    public static void menu(Scanner scanner) {

        System.out.println("Menu:");
        System.out.println("1.Circulo");
        System.out.println("2.Triangulo");
        System.out.println("3.Retangulo");
        System.out.println();
        System.out.print("Escolha: ");
        int x = scanner.nextInt();

        switch (x) {
            case 1:
                double raio = Ex1_Circle.leitura(scanner);
                System.out.println("Area do circulo: " + Ex1_Circle.calcarea(raio));
                System.out.println("Perímetro do circulo: " + Ex1_Circle.calcper(raio));
                System.out.println();
                break;
            case 2:
                double l1 = Ex1_Triangle.leitura(scanner), l2 = Ex1_Triangle.leitura(scanner),
                        l3 = Ex1_Triangle.leitura(scanner);
                System.out.println("Area do triangulo: " + Ex1_Triangle.calcarea(l1, l2, l3));
                System.out.println("Perímetro do triangulo: " + Ex1_Triangle.calcper(l1, l2, l3));
                System.out.println();
                break;
            case 3:
                String cump = "Cumprimento", alt = "Altura";
                double c = Ex1_Rectangle.leitura(scanner, cump), h = Ex1_Rectangle.leitura(scanner, alt);
                System.out.println("Area do retangulo: " + Ex1_Rectangle.calcarea(c, h));
                System.out.println("Perimetro do retangulo: " + Ex1_Rectangle.calcper(c, h));
                System.out.println();
                break;
            default:
                System.out.println("Numero Inválido!");
                System.out.println();
                menu(scanner);
                break;
        }
    }
}