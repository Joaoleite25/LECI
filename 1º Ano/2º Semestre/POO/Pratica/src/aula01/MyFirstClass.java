package aula01;
public class MyFirstClass {
    public static void main(String[] args) {
        System.out.println("Hello VS Code!");
        int sum = 0;
        for (int i = 1; i <= 100; i++) {
            sum += i;
        }
        System.out.println(sum);

        int[] lista = new int[5];
        for (int i = 0; i < lista.length; i++) {
            System.out.println(lista[i]);
        }
    }
}