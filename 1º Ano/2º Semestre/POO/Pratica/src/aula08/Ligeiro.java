package aula08; 

public class Ligeiro extends Veiculo {
    private String numeroQuadro;
    private int capacidadeBagageira;

    public Ligeiro(String matricula, String marca, String modelo, int potencia, String numeroQuadro, int capacidadeBagageira) {
        super(matricula, marca, modelo, potencia);
        this.numeroQuadro = numeroQuadro;
        this.capacidadeBagageira = capacidadeBagageira;
    }
}
