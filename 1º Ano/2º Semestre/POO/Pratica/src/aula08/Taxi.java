package aula08;

public class Taxi extends Ligeiro {
    private String numeroLicenca;

    public Taxi(String matricula, String marca, String modelo, int potencia, String numeroQuadro, int capacidadeBagageira, String numeroLicenca) {
        super(matricula, marca, modelo, potencia, numeroQuadro, capacidadeBagageira);
        this.numeroLicenca = numeroLicenca;
    }
}
