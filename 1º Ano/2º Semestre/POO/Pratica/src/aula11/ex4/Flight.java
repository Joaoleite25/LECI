package aula11.ex4;

public class Flight {
    private String code;
    private String origin;
    private Time departure;
    private Time delay;
    private Company company;

    public Flight(String code, String origin, Time departure, Time delay, Company company) {
        this.code = code;
        this.origin = origin;
        this.departure = departure;
        this.delay = delay;
        this.company = company;
    }

    public String getCode() {
        return code;
    }

    public String getOrigin() {
        return origin;
    }

    public Time getDeparture() {
        return departure;
    }

    public Time getDelay() {
        return delay;
    }

    public Company getCompany() {
        return company;
    }
}
