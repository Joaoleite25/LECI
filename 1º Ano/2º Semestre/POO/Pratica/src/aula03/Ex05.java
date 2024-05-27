package aula03;

import java.util.Scanner;

public class Ex05 {
    public static void main(String[] args) {
        String data;
        int dia, ano, m;
        Scanner scanner = new Scanner(System.in);

        data = leitura(scanner);
        dia = dia(scanner);

        m = Integer.parseInt(data.split("/")[0]);
        ano = Integer.parseInt(data.split("/")[1]);

        imprimir(m, ano, dia);

        scanner.close();
    }

    public static String leitura(Scanner scanner) {
        String data;
        
        do {
            System.out.print("Data (mm/yyyy): ");
            data = scanner.next();
        } while (!validarData(data));
        

        return data;
    }

    public static int dia(Scanner scanner) {
        int dia;
        do {
            System.out.print("Dia: ");
            dia = scanner.nextInt();
        } while (dia < 0 || dia > 7);
        return dia;
    }

    public static boolean validarData(String data) {
        if (data.matches("^(0[1-9]|1[0-2])/(19|20)\\d{2}$")) {
            return true;
        } else {
            return false;
        }
    }

    public static void imprimir(int m, int ano, int dia) {
        String mes;
        int dias, i, c = 0;

        switch (m) {
            case 1:
                mes = "January";
                dias = 31;
                break;
            case 2:
                mes = "February";
                dias = calcdias(ano);
                break;
            case 3:
                mes = "March";
                dias = 31;
                break;
            case 4:
                mes = "April";
                dias = 30;
                break;
            case 5:
                mes = "May";
                dias = 31;
                break;
            case 6:
                mes = "June";
                dias = 30;
                break;
            case 7:
                mes = "July";
                dias = 31;
                break;
            case 8:
                mes = "August";
                dias = 31;
                break;
            case 9:
                mes = "September";
                dias = 30;
                break;
            case 10:
                mes = "October";
                dias = 31;
                break;
            case 11:
                mes = "November";
                dias = 30;
                break;
            default:
                mes = "December";
                dias = 31;
                break;
        }

        System.out.printf("%10s %5s", mes, ano);
        System.out.println();
        System.out.printf("%4s %3s %3s %3s %3s %3s %3s", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa");
        System.out.println();

        for (int j = 1; j < dia; j++) {
            System.out.printf("%4s", " ");
            c++;
        } 

        for (i = 1; i <= dias; i++) {
            if (c == 7) {
                System.out.println();
                c = 0;
            }
            System.out.printf("%4s", i);
            c ++;
            
        }

    }

    public static int calcdias(int ano) {
        if (ano % 4 == 0 && (ano % 100 != 0 || ano % 400 == 0)) {
            return 29;
        }
        else {
            return 28;
        }
    }
}
