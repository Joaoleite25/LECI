package Teste;

import java.io.*;
import java.util.*;

public class ParcelManager {
    private Map<Integer, Parcel> parcels;
    private IShippingCostCalculator calculator;

    public boolean hasParcel(int id) {
        for (Parcel parcel : parcels.values()) {
            if (parcel.getId() == id) {
                return true;
            }
        }
        return false;
    }

    public ParcelManager() {
        parcels = new HashMap<Integer, Parcel>();
        try {
            File file = new File("encomendas.txt");
            Scanner scanner = new Scanner(file);

            if (scanner.hasNextLine()) {
                scanner.nextLine();
            }

            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] parts = line.split(";");

                int id = Integer.parseInt(parts[0].trim());
                double weight = Double.parseDouble(parts[1].trim());
                String sender = parts[2].trim();
                String destination = parts[3].trim();

                parcels.put(id, new Parcel(id, weight, sender, destination));
            }

            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("Erro ao ler o arquivo: " + e.getMessage());
        }
    }

    public ParcelManager(IShippingCostCalculator calculator) {
        this.parcels = new HashMap<>();
        this.calculator = calculator;
    }

    public void addParcel(Parcel p) {
        this.parcels.put(p.getId(), p);
    }

    public void removeParcel(int id) {
        this.parcels.remove(id);
    }

    public Parcel getParcel(int id) {
        return this.parcels.get(id);
    }

    public double calculateShippingCost(int id) {
        Parcel parcel = this.getParcel(id);
        if (parcel == null) {
            return -1;
        }
        return this.calculator.calculateShippingCost(parcel);
    }

    public void printAllParcels() {
        for (Parcel parcel : this.parcels.values()) {
            System.out.println(parcel);
        }
    }

    public void readFile(String filePath) throws FileNotFoundException {
        File file = new File(filePath);
        Scanner scanner = new Scanner(file);

        while (scanner.hasNextLine()) {
            String[] data = scanner.nextLine().split(";");
            int id = Integer.parseInt(data[0]);
            double weight = Double.parseDouble(data[1]);
            String destination = data[2];
            String sender = data[3];

            Parcel parcel = new Parcel(id, weight, destination, sender);
            this.addParcel(parcel);
        }

        scanner.close();
    }

    public void writeFile(String filePath) throws IOException {
        FileWriter writer = new FileWriter(filePath);

        for (Parcel parcel : this.parcels.values()) {
            writer.write(parcel.getSender() + ";" + parcel.getDestination() + ";" + parcel.getWeight() + ";"
                    + this.calculateShippingCost(parcel.getId()) + "\n");
        }

        writer.close();
    }
}