package aula07;

abstract class Forma {
    protected String cor;

    public Forma(String cor) {
        this.cor = cor;
    }

    public abstract double perimetro();
    public abstract double area();
}

class Circulo extends Forma {
    private double raio;

    public Circulo(double raio, String cor) {
        super(cor);
        this.raio = raio;
    }

    public double perimetro() {
        return 2 * Math.PI * raio;
    }

    public double area() {
        return Math.PI * Math.pow(raio, 2);
    }
}

class Triangulo extends Forma {
    private double l1, l2, l3;

    public Triangulo(double l1, double l2, double l3, String cor) {
        super(cor);
        this.l1 = l1;
        this.l2 = l2;
        this.l3 = l3;
    }

    public double perimetro() {
        return l1 + l2 + l3;
    }

    public double area() {
        double s = (l1 + l2 + l3) / 2;
        return Math.sqrt(s * (s - l1) * (s - l2) * (s - l3));
    }
}

class Retangulo extends Forma {
    private double comprimento, altura;

    public Retangulo(double comprimento, double altura, String cor) {
        super(cor);
        this.comprimento = comprimento;
        this.altura = altura;
    }

    public double perimetro() {
        return 2 * (comprimento + altura);
    }

    public double area() {
        return comprimento * altura;
    }
}