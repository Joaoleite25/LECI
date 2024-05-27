package aula11.ex4;

import java.util.List;

public class Company {
    private String code;
    private String name;
    private List<Flight> flights;

    public Company(String code, String name, List<Flight> flights) {
        this.code = code;
        this.name = name;
        this.flights = flights;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public List<Flight> getFlights() {
        return flights;
    }
}
