package Teste;

import java.io.FileNotFoundException;
import java.io.IOException;

public class ShippingTester {
    public static void main(String[] args) {
        ParcelManager pm = new ParcelManager();

        // ----------------------------------------------------------
        Parcel p1 = new Parcel("Aveiro, Portugal", "Madrid, Spain", 10);
        Parcel p2 = new Parcel("Dublin, Ireland", "Berlin, Germany", 15);
        pm.addParcel(p1);
        pm.addParcel(p2);
        // ----------------------------------------------------------

        pm.printAllParcels();

        // ----------------------------------------------------------
        System.out.println(pm.getParcel(1));
        System.out.println(pm.calculateShippingCost(1));
        System.out.println(pm.getParcel(2));
        System.out.println(pm.calculateShippingCost(2));
        System.out.println(pm.getParcel(30));
        System.out.println(pm.calculateShippingCost(30));
        System.out.println(pm.calculateShippingCost(2));
        System.out.println(pm.getParcel(30)); // não existe!
        System.out.println(pm.calculateShippingCost(30)); // não existe!
        // ----------------------------------------------------------

        try {
            pm.readFile("Pratica/src/Teste/encomendas.txt");
        } catch (FileNotFoundException e) {
            System.out.println("Erro ao ler o arquivo: " + e.getMessage());
        }
        pm.printAllParcels();

        // ----------------------------------------------------------
        System.out.println(pm.getParcel(1));
        System.out.println(pm.calculateShippingCost(1));
        System.out.println(pm.getParcel(2));
        System.out.println(pm.calculateShippingCost(2));
        System.out.println(pm.getParcel(30));
        System.out.println(pm.calculateShippingCost(30));
        // ----------------------------------------------------------

        try {
            pm.writeFile("Pratica/src/Teste/resultado.txt");
        } catch (IOException e) {
            System.out.println("Erro ao escrever no arquivo: " + e.getMessage());
        }

    }
}
