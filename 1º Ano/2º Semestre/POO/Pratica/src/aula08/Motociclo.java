package aula08;

public class Motociclo extends Veiculo {
    private String tipo; 
    private int quilometrosPercorridos;

    public Motociclo(String matricula, String marca, String modelo, int potencia, String tipo) {
        super(matricula, marca, modelo, potencia);
        this.tipo = tipo;
        this.quilometrosPercorridos = 0;
    }

    public String getMatricula() {
        return matricula;
    }

    public String getMarca() {
        return marca;
    }

    public String getModelo() {
        return modelo;
    }

    public int getPotencia() {
        return potencia;
    }
    public String getTipo() {
        return tipo;
    }
    
    public void trajeto(int quilometros) {
        this.quilometrosPercorridos += quilometros;
    }

    public int ultimoTrajeto() {
        return quilometrosPercorridos;
    }

    public int distanciaTotal() {
        return quilometrosPercorridos;
    }

    public void listar() {
        System.out.println("Informações do motociclo:");
        System.out.println("Matrícula: " + getMatricula());
        System.out.println("Marca: " + getMarca());
        System.out.println("Modelo: " + getModelo());
        System.out.println("Potência: " + getPotencia());
        System.out.println("Tipo: " + getTipo());
        System.out.println("Último trajeto: " + ultimoTrajeto() + " km");
        System.out.println("Distância total percorrida: " + distanciaTotal() + " km");
    }
}
