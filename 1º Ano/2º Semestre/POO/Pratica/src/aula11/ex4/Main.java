package aula11.ex4;

public class Main {
    public static void main(String[] args) {
        FlightManager fm = new FlightManager();

        fm.loadCompanies("companhias.txt");
        fm.loadFlights("voos.txt");

        fm.buildTable();
        System.out.println(fm.getTable());

        fm.buildDelaysTable();
        System.out.println(fm.getDelaysTable());

        fm.buildFlightsNTable();
        System.out.println(fm.getFlightsNTable());

        fm.storeTable("Infopublico.txt");
    }
}