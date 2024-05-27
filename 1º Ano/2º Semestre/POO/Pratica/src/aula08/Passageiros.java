package aula08;

public class Passageiros extends Veiculo {
    private int peso;
    private int numeroMaximoPassageiros;

    public Passageiros(String matricula, String marca, String modelo, int potencia, int peso, int numeroMaximoPassageiros) {
        super(matricula, marca, modelo, potencia);
        this.peso = peso;
        this.numeroMaximoPassageiros = numeroMaximoPassageiros;
    }
}
