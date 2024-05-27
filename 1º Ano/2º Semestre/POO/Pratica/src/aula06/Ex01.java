package aula06;

import java.time.LocalDate;

public class Ex01 {

    class DateYMD {
        private int day;
        private int month;
        private int year;

        public DateYMD(int day, int month, int year) {
            this.day = day;
            this.month = month;
            this.year = year;
        }

        @Override
        public String toString() {
            return day + "/" + month + "/" + year;
        }
    }

    public class Pessoa {
        private String nome;
        private int cc;
        private DateYMD dataNasc;

        public Pessoa(String nome, int cc, DateYMD dataNasc) {
            this.nome = nome;
            this.cc = cc;
            this.dataNasc = dataNasc;
        }

        public String getName() {
            return nome;
        }

        @Override
        public String toString() {
            return "Nome: " + nome + "; CC: " + cc + "; Data de Nascimento: " + dataNasc;
        }
    }

    public class Aluno extends Pessoa {
        private int nextNMec = 100;
        private int nMec;
        private DateYMD dataInsc;

        public Aluno(String nome, int cc, DateYMD dataNasc, DateYMD dataInsc) {
            super(nome, cc, dataNasc);
            this.nMec = nextNMec++;
            this.dataInsc = dataInsc;
        }

        public Aluno(String nome, int cc, DateYMD dataNasc) {
            this(nome, cc, dataNasc,
                    new DateYMD(LocalDate.now().getDayOfMonth(), LocalDate.now().getMonthValue(), LocalDate.now().getYear()));
        }

        public int getNMec() {
            return nMec;
        }

        @Override
        public String toString() {
            return super.toString() + "; NMec: " + nMec + "; Data de Inscrição: " + dataInsc;
        }
    }

    public class Professor extends Pessoa {
        private String categoria;
        private String departamento;

        public Professor(String nome, int cc, DateYMD dataNasc, String categoria, String departamento) {
            super(nome, cc, dataNasc);
            this.categoria = categoria;
            this.departamento = departamento;
        }

        @Override
        public String toString() {
            return super.toString() + "; Categoria: " + categoria + "; Departamento: " + departamento;
        }
    }

    public class Bolseiro extends Aluno {
        private Professor orientador;
        private double bolsa;

        public Bolseiro(String nome, int cc, DateYMD dataNasc, Professor orientador, double bolsa) {
            super(nome, cc, dataNasc);
            this.orientador = orientador;
            this.bolsa = bolsa;
        }

        public double getBolsa() {
            return bolsa;
        }

        public void setBolsa(double bolsa) {
            this.bolsa = bolsa;
        }

        public Professor getOrientador() {
            return orientador;
        }

        public void setOrientador(Professor orientador) {
            this.orientador = orientador;
        }

        @Override
        public String toString() {
            return super.toString() + "; Orientador: " + orientador.getName() + "; Bolsa: " + bolsa;
        }
    }

    public class Test {
        public void main(String[] args) {
            Aluno al = new Aluno("Andreia Melo", 9855678,
                    new DateYMD(18, 7, 1990), new DateYMD(1, 9, 2018));
            Professor p1 = new Professor("Jorge Almeida", 3467225, new DateYMD(13, 3, 1967),
                    "Associado", "Informática");
            Bolseiro bls = new Bolseiro("Igor Santos", 8976543, new DateYMD(11, 5, 1985), p1,
                    900);
            bls.setBolsa(1050);
            System.out.println("Aluno: " + al.getName());
            System.out.println(al);

            System.out.println("Bolseiro: " + bls.getName() + ", NMec: "
                    + bls.getNMec() + ", Bolsa: " + bls.getBolsa() + ", Orientador: " +
                    bls.getOrientador().getName());
            System.out.println(bls);
        }
    }

}
