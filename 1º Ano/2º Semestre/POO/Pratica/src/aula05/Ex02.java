package aula05;

import java.util.Scanner;

class DateYMD {
    private int dia;
    private int mes;
    private int ano;

    public DateYMD(int dia, int mes, int ano) {
        if (isValid(dia, mes, ano)) {
            this.dia = dia;
            this.mes = mes;
            this.ano = ano;
        } else {
            throw new IllegalArgumentException("Data inválida!");
        }
    }

    public static boolean isValid(int dia, int mes, int ano) {
        if (!mesValido(mes)) return false;
        return dia >= 1 && dia <= diasNoMes(mes, ano);
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

    public int getDia() {
        return dia;
    }

    public int getMes() {
        return mes;
    }

    public int getAno() {
        return ano;
    }

    @Override
    public String toString() {
        return String.format("%04d-%02d-%02d", ano, mes, dia);
    }
}

class Ex02 {
    private int[][] eventos; // Matriz para armazenar eventos para cada dia do ano
    private int ano;
    private int primeiroDiaSemanaAno; // 1 para domingo, 2 para segunda-feira, ..., 7 para sábado

    public Ex02(int ano, int primeiroDiaSemanaAno) {
        this.ano = ano;
        this.primeiroDiaSemanaAno = primeiroDiaSemanaAno;
        eventos = new int[12][];
        for (int i = 0; i < 12; i++) {
            eventos[i] = new int[DateYMD.diasNoMes(i + 1, ano)];
        }
    }

    public int ano() {
        return ano;
    }

    public int primeiroDiaSemanaAno() {
        return primeiroDiaSemanaAno;
    }

    public int primeiroDiaSemanaMes(int mes) {
        int totalDias = 0;
        for (int i = 1; i < mes; i++) {
            totalDias += DateYMD.diasNoMes(i, ano);
        }
        return (primeiroDiaSemanaAno + totalDias) % 7;
    }

    public void adicionarEvento(DateYMD data) {
        eventos[data.getMes() - 1][data.getDia() - 1] = 1;
    }

    public void removerEvento(DateYMD data) {
        eventos[data.getMes() - 1][data.getDia() - 1] = 0;
    }

    public void imprimirMes(int mes) {
        System.out.println("Do Se Te Qu Qu Se Sa");
        int primeiroDiaSemana = primeiroDiaSemanaMes(mes);
        int diasNoMes = DateYMD.diasNoMes(mes, ano);
        int diaAtual = 1;

        for (int i = 0; i < 6; i++) {
            for (int j = 1; j <= 7; j++) {
                if (i == 0 && j < primeiroDiaSemana) {
                    System.out.print("   ");
                } else {
                    if (diaAtual <= diasNoMes) {
                        System.out.print(diaAtual < 10 ? " " + diaAtual : diaAtual);
                        if (eventos[mes - 1][diaAtual - 1] == 1) {
                            System.out.print("*");
                        } else {
                            System.out.print(" ");
                        }
                    } else {
                        System.out.print("   ");
                    }
                    diaAtual++;
                }
                System.out.print(" ");
            }
            System.out.println();
            if (diaAtual > diasNoMes) break;
        }
    }

    public void imprimirCalendario() {
        for (int i = 1; i <= 12; i++) {
            System.out.println();
            System.out.println(nomeMes(i) + " " + ano);
            imprimirMes(i);
        }
    }

    private String nomeMes(int mes) {
        switch (mes) {
            case 1:
                return "Janeiro";
            case 2:
                return "Fevereiro";
            case 3:
                return "Março";
            case 4:
                return "Abril";
            case 5:
                return "Maio";
            case 6:
                return "Junho";
            case 7:
                return "Julho";
            case 8:
                return "Agosto";
            case 9:
                return "Setembro";
            case 10:
                return "Outubro";
            case 11:
                return "Novembro";
            case 12:
                return "Dezembro";
            default:
                return "";
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Ex02 calendario = null;

        while (true) {
            System.out.println("Operações de Calendário:");
            System.out.println("1 - criar novo calendário");
            System.out.println("2 - imprimir mês do calendário");
            System.out.println("3 - imprimir calendário completo");
            System.out.println("0 - sair");

            int escolha = scanner.nextInt();

            switch (escolha) {
                case 1:
                    System.out.println("Ano: ");
                    int ano = scanner.nextInt();
                    System.out.println("Primeiro dia da semana do ano (1 para domingo, 2 para segunda-feira, ..., 7 para sábado): ");
                    int primeiroDiaSemana = scanner.nextInt();
                    calendario = new Ex02(ano, primeiroDiaSemana);
                    System.out.println("Calendário criado para o ano " + ano);
                    break;
                case 2:
                    if (calendario != null) {
                        System.out.println("Informe o mês para imprimir:");
                        int mesParaImprimir = scanner.nextInt();
                        calendario.imprimirMes(mesParaImprimir);
                    } else {
                        System.out.println("Por favor, crie um calendário primeiro.");
                    }
                    break;
                case 3:
                    if (calendario != null) {
                        calendario.imprimirCalendario();
                    } else {
                        System.out.println("Por favor, crie um calendário primeiro.");
                    }
                    break;
                case 0:
                    System.out.println("Encerrando o programa...");
                    scanner.close();
                    System.exit(0);
                    break;
                default:
                    System.out.println("Escolha inválida! Por favor, informe uma opção válida.");
            }
        }
    }
}
