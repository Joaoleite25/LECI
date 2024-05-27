package aula05;

import java.util.Scanner;

class DateYMD {
    private int dia;
    private int mes;
    private int ano;

    public DateYMD(int dia, int mes, int ano) {
        if (valido(dia, mes, ano)) {
            this.dia = dia;
            this.mes = mes;
            this.ano = ano;
        } else {
            throw new IllegalArgumentException("Data inválida!");
        }
    }

    public static boolean mesValido(int mes) {
        return mes >= 1 && mes <= 12;
    }

    public static int diasNoMes(int mes, int ano) {
        int[] diasNoMes = {31, bissexto(ano) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        return diasNoMes[mes - 1];
    }

    public static boolean bissexto(int ano) {
        return (ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0);
    }

    public static boolean valido(int dia, int mes, int ano) {
        if (!mesValido(mes)) return false;
        return dia >= 1 && dia <= diasNoMes(mes, ano);
    }

    public void set(int dia, int mes, int ano) {
        if (valido(dia, mes, ano)) {
            this.dia = dia;
            this.mes = mes;
            this.ano = ano;
        } else {
            throw new IllegalArgumentException("Data inválida!");
        }
    }

    public int getDia() {
        return dia;
    }

    public int getMes() {
        return mes;
    }

    public int getAno() {
        return ano;
    }

    public void incrementar() {
        dia++;
        if (dia > diasNoMes(mes, ano)) {
            dia = 1;
            mes++;
            if (mes > 12) {
                mes = 1;
                ano++;
            }
        }
    }

    public void decrementar() {
        dia--;
        if (dia < 1) {
            mes--;
            if (mes < 1) {
                mes = 12;
                ano--;
            }
            dia = diasNoMes(mes, ano);
        }
    }

    @Override
    public String toString() {
        return String.format("%04d-%02d-%02d", ano, mes, dia);
    }
}

public class Ex01 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        DateYMD data = null;

        while (true) {
            System.out.println("Operações de Data:");
            System.out.println("1 - criar nova data");
            System.out.println("2 - mostrar data atual");
            System.out.println("3 - incrementar data");
            System.out.println("4 - decrementar data");
            System.out.println("0 - sair");

            int escolha = scanner.nextInt();

            switch (escolha) {
                case 1:
                    System.out.println("Informe dia, mês e ano:");
                    int dia = scanner.nextInt();
                    int mes = scanner.nextInt();
                    int ano = scanner.nextInt();
                    try {
                        data = new DateYMD(dia, mes, ano);
                        System.out.println("Data definida com sucesso!");
                    } catch (IllegalArgumentException e) {
                        System.out.println("Data inválida! Por favor, informe uma data válida.");
                    }
                    break;
                case 2:
                    if (data != null)
                        System.out.println("Data atual: " + data);
                    else
                        System.out.println("Nenhuma data definida ainda!");
                    break;
                case 3:
                    if (data != null) {
                        data.incrementar();
                        System.out.println("Data incrementada: " + data);
                    } else {
                        System.out.println("Nenhuma data definida ainda!");
                    }
                    break;
                case 4:
                    if (data != null) {
                        data.decrementar();
                        System.out.println("Data decrementada: " + data);
                    } else {
                        System.out.println("Nenhuma data definida ainda!");
                    }
                    break;
                case 0:
                    System.out.println("Encerrando o programa...");
                    scanner.close();
                    System.exit(0);
                    break;
                default:
                    System.out.println("Escolha inválida! Por favor, escolha uma opção válida.");
            }
        }
    }
}
