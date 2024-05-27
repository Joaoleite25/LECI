package Teste;

public class Parcel {
    private static int nextId = 0;
    private int id;
    private double weight;
    private String destination;
    private String sender;

    public Parcel( String destination, String sender, double weight) {
        this.id = nextId++;
        this.weight = weight;
        this.destination = destination;
        this.sender = sender;
    }

    public Parcel(int id, double weight, String destination, String sender) {
        this.id = id;
        this.weight = weight;
        this.destination = destination;
        this.sender = sender;
        if (id >= nextId) {
            nextId = id + 1;
        }
    }

    public int getId() {
        return id;
    }

    public double getWeight() {
        return weight;
    }

    public String getDestination() {
        return destination;
    }

    public String getSender() {
        return sender;
    }

    @Override
    public String toString() {
        return "Parcel{id=" + id + ", weight=" + weight + ", destination='" + destination + "', sender='" + sender + "'}";
    }
}