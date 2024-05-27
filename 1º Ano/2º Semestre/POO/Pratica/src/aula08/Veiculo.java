package aula08;

public abstract class Veiculo implements KmPercorridosInterface {
    protected String matricula;
    protected String marca;
    protected String modelo;
    protected int potencia;

    public Veiculo(String matricula, String marca, String modelo, int potencia) {
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.potencia = potencia;
    }

    public abstract void trajeto(int quilometros);
    public abstract int ultimoTrajeto();
    public abstract int distanciaTotal();

}
