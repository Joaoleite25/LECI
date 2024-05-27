package aula08;

public class Mercadorias extends Veiculo {
    private int peso;
    private int cargaMaxima;

    public Mercadorias(String matricula, String marca, String modelo, int potencia, int peso, int cargaMaxima) {
        super(matricula, marca, modelo, potencia);
        this.peso = peso;
        this.cargaMaxima = cargaMaxima;
    }
}
