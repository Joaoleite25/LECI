public class Fraction {
    public int num;
    public int den;

    // Construtor para frações (ex.: 2/3)
    public Fraction(int num, int den) {
        if (den == 0) {
            System.err.println("Erro: Divisão por zero!");
            System.exit(1);
        }
        // Se o denominador for negativo, passamos o sinal para o numerador
        if (den < 0) {
            num = -num;
            den = -den;
        }
        this.num = num;
        this.den = den;
    }

    // Construtor para números inteiros
    public Fraction(int num) {
        this.num = num;
        this.den = 1;
    }

    public Fraction add(Fraction f) {
        int n = this.num * f.den + this.den * f.num;
        int d = this.den * f.den;
        return new Fraction(n, d);
    }

    public Fraction sub(Fraction f) {
        int n = this.num * f.den - this.den * f.num;
        int d = this.den * f.den;
        return new Fraction(n, d);
    }

    public Fraction mult(Fraction f) {
        int n = this.num * f.num;
        int d = this.den * f.den;
        return new Fraction(n, d);
    }

    public Fraction div(Fraction f) {
        int n = this.num * f.den;
        int d = this.den * f.num;
        return new Fraction(n, d);
    }
    
    // Método privado para determinar o Máximo Divisor Comum (Algoritmo de Euclides)
    private int mdc(int a, int b) {
        a = Math.abs(a);
        b = Math.abs(b);
        if (b == 0) return a;
        return mdc(b, a % b);
    }

    public Fraction reduce() {
        int divisor = mdc(this.num, this.den);
        return new Fraction(this.num / divisor, this.den / divisor);
    }

    // Como a fração deve ser impressa no terminal
    @Override
    public String toString() {
        if (den == 1) return String.valueOf(num);
        return num + "/" + den;
    }
}
