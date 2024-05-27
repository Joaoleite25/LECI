package aula06;

import java.util.ArrayList;
import java.util.Scanner;

import aula06.Ex01.DateYMD;

public class Ex02 {

    public class SistemaGestaoContactos {
        ArrayList<Contacto> listaContactos = new ArrayList<>();
        int proximoID = 1;
        Scanner scanner = new Scanner(System.in);

        public void main(String[] args) {
            int opcao;
            do {
                System.out.println("Menu:");
                System.out.println("1. Inserir contacto");
                System.out.println("2. Alterar contacto");
                System.out.println("3. Apagar contacto");
                System.out.println("4. Procurar contacto");
                System.out.println("5. Listar contactos");
                System.out.println("0. Sair");
                System.out.print("Escolha uma opção: ");
                opcao = scanner.nextInt();
                scanner.nextLine();

                switch (opcao) {
                    case 1:
                        inserirContacto();
                        break;
                    case 2:
                        alterarContacto();
                        break;
                    case 3:
                        apagarContacto();
                        break;
                    case 4:
                        procurarContacto();
                        break;
                    case 5:
                        listarContactos();
                        break;
                    case 0:
                        System.out.println("A sair...");
                        break;
                    default:
                        System.out.println("Opção inválida!");
                }
            } while (opcao != 0);
        }

        public void inserirContacto() {
            System.out.println("Inserir contacto:");

            System.out.print("Nome da pessoa: ");
            String nome = scanner.nextLine();
            System.out.print("Número de telemóvel: ");
            String numeroTelemovel = scanner.nextLine();
            System.out.print("Endereço de email: ");
            String email = scanner.nextLine();

            if (!validarNumeroTelemovel(numeroTelemovel) && !validarEmail(email)) {
                System.out.println("Número de telemóvel e endereço de email inválidos.");
                return;
            }

            Pessoa pessoa = new Pessoa(nome, 0, null);

            Contacto contacto = new Contacto(proximoID++, pessoa, numeroTelemovel, email);

            listaContactos.add(contacto);

            System.out.println("Contacto inserido com sucesso!");
        }

        public void alterarContacto() {
            System.out.println("Alterar contacto:");

            System.out.print("Introduza o ID do contacto que deseja alterar: ");
            int id = scanner.nextInt();
            scanner.nextLine();

            Contacto contacto = procurarContactoPorID(id);
            if (contacto != null) {
                System.out.println("Contacto encontrado:");
                System.out.println(contacto);

                System.out.println("O que deseja alterar?");
                System.out.println("1. Número de telemóvel");
                System.out.println("2. Endereço de email");
                System.out.print("Escolha uma opção: ");
                int opcao = scanner.nextInt();
                scanner.nextLine();

                switch (opcao) {
                    case 1:
                        System.out.print("Novo número de telemóvel: ");
                        String novoNumero = scanner.nextLine();
                        if (validarNumeroTelemovel(novoNumero)) {
                            contacto.numeroTelemovel = novoNumero;
                            System.out.println("Número de telemóvel alterado com sucesso!");
                        } else {
                            System.out.println("Número de telemóvel inválido.");
                        }
                        break;
                    case 2:
                        System.out.print("Novo endereço de email: ");
                        String novoEmail = scanner.nextLine();
                        if (validarEmail(novoEmail)) {
                            contacto.email = novoEmail;
                            System.out.println("Endereço de email alterado com sucesso!");
                        } else {
                            System.out.println("Endereço de email inválido.");
                        }
                        break;
                    default:
                        System.out.println("Opção inválida!");
                }
            } else {
                System.out.println("Contacto não encontrado.");
            }
        }

        public void apagarContacto() {
            System.out.println("Apagar contacto:");

            System.out.print("Introduza o ID do contacto que deseja apagar: ");
            int id = scanner.nextInt();
            scanner.nextLine();

            Contacto contacto = procurarContactoPorID(id);
            if (contacto != null) {
                listaContactos.remove(contacto);
                System.out.println("Contacto apagado com sucesso!");
            } else {
                System.out.println("Contacto não encontrado.");
            }
        }

        public void procurarContacto() {
            System.out.println("Procurar contacto:");
            System.out.println("1. Procurar por ID");
            System.out.println("2. Procurar por nome");
            System.out.print("Escolha uma opção: ");
            int opcao = scanner.nextInt();
            scanner.nextLine();

            switch (opcao) {
                case 1:
                    System.out.print("Introduza o ID do contacto: ");
                    int id = scanner.nextInt();
                    scanner.nextLine();
                    Contacto contactoPorID = procurarContactoPorID(id);
                    if (contactoPorID != null) {
                        System.out.println("Contacto encontrado:");
                        System.out.println(contactoPorID);
                    } else {
                        System.out.println("Contacto não encontrado.");
                    }
                    break;
                case 2:
                    System.out.print("Introduza o nome do contacto: ");
                    String nome = scanner.nextLine();
                    Contacto contactoPorNome = procurarContactoPorNome(nome);
                    if (contactoPorNome != null) {
                        System.out.println("Contacto encontrado:");
                        System.out.println(contactoPorNome);
                    } else {
                        System.out.println("Contacto não encontrado.");
                    }
                    break;
                default:
                    System.out.println("Opção inválida!");
            }
        }

        public Contacto procurarContactoPorID(int id) {
            for (Contacto contacto : listaContactos) {
                if (contacto.ID == id) {
                    return contacto;
                }
            }
            return null;
        }

        public Contacto procurarContactoPorNome(String nome) {
            for (Contacto contacto : listaContactos) {
                if (contacto.pessoa.nome.equalsIgnoreCase(nome)) {
                    return contacto;
                }
            }
            return null;
        }

        public void listarContactos() {
            System.out.println("Lista de contactos:");
            for (Contacto contacto : listaContactos) {
                System.out.println(contacto);
            }
        }

        public boolean validarNumeroTelemovel(String numero) {
            return numero.matches("^9\\d{8}$");
        }

        public boolean validarEmail(String email) {
            return email.matches("^.+@.+\\..+$");
        }
    }

    class Pessoa {
        String nome;

        public Pessoa(String nome) {
            this.nome = nome;
        }

        public Pessoa(String nome, int cc, DateYMD dataNasc) {
            this.nome = nome;
        }
    }

    class Contacto {
        int ID;
        Pessoa pessoa;
        String numeroTelemovel;
        String email;

        public Contacto(int ID, Pessoa pessoa, String numeroTelemovel, String email) {
            this.ID = ID;
            this.pessoa = pessoa;
            this.numeroTelemovel = numeroTelemovel;
            this.email = email;
        }

        @Override
        public String toString() {
            return "ID: " + ID + ", Nome: " + pessoa.nome + ", Telemóvel: " + numeroTelemovel + ", Email: " + email;
        }
    }

}
