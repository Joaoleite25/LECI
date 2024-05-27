package aula09;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.TreeSet;


public class Ex01 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String pessoa;
        ArrayList<Integer> c1 = new ArrayList<>();
        
        for (int i = 10; i <= 100; i += 10)
            c1.add(i);
        
        System.out.println("Size: " + c1.size());
        
        for (int i = 0; i < c1.size(); i++)
            System.out.println("Elemento: " + c1.get(i));
        
        System.out.println("c1 contains 50: " + c1.contains(50));
        
        System.out.println("Index of 50 in c1: " + c1.indexOf(50));
        
        c1.add(50);
        System.out.println("Last index of 50 in c1: " + c1.lastIndexOf(50));
        
        c1.set(0, 5);
        System.out.println("Elemento na posição 0 de c1 alterado para 5: " + c1);
        
        ArrayList<Integer> subList = new ArrayList<>(c1.subList(1, 4));
        System.out.println("Sublista de c1: " + subList);
        
        ArrayList<String> c2 = new ArrayList<>();
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");
        System.out.println(c2);
        
        Collections.sort(c2);
        System.out.println("c2 ordenado: " + c2);
        
        c2.remove("Frio");
        c2.remove(0);
        System.out.println("c2 após remoção: " + c2);

        Set<Pessoa> c3 = new HashSet<>();

        do {
            System.out.println("Nome da pessoa(para acabar 0): ");
            pessoa = sc.nextLine();
            if (pessoa.equals("0")) {
                break;
            }
            if (c3.add(new Pessoa(pessoa)))
                System.out.println("Pessoa adicionada com sucesso!");
            else
                System.out.println("Pessoa já existe na coleção.");
        } while (!pessoa.equals("0"));

        System.out.println("Elementos em c3:");
        Iterator<Pessoa> iterator = c3.iterator();
        while (iterator.hasNext()) {
            Pessoa p = iterator.next();
            System.out.println(p.getNome());
        }

        Set<Date> c4 = new TreeSet<>();

        c4.add(new Date());
        c4.add(new Date(123456789));
        c4.add(new Date(System.currentTimeMillis() - 100000));
        c4.add(new Date(System.currentTimeMillis() + 100000));
        c4.add(new Date(0));

        System.out.println("Elementos em c4:");
        for (Date date : c4) {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            System.out.println(sdf.format(date));
        }

        sc.close();
    }
}

class Pessoa {
    private String nome;

    public Pessoa(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Pessoa pessoa = (Pessoa) obj;
        return nome.equals(pessoa.nome);
    }

    @Override
    public int hashCode() {
        return nome.hashCode();
    }
}