package aula02;

import java.util.Scanner;

public class Ex6 {
    public static void main(String[] args) {
        int t, h, m, s;
        Scanner sc = new Scanner(System.in);
        System.out.print("Tempo(s): ");
        t = sc.nextInt();
        s = t % 60;
        m = (t / 60) % 60;
        h = t / (60 * 60);

        System.out.print(h + ":" + m + ":" + s);
        
        sc.close();
    }
}
