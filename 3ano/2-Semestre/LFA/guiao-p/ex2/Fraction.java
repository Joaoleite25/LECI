public class Fraction {
    public int num;
    public int den;

    public Fraction(int num, int den) {
        if (den == 0) {
            throw new ArithmeticException("Divisão por 0");
        }
        this.num = num;
        this.den = den;
        Simplificar();
    }
    
    public Fraction(int n) {
        this(n, 1);
    }

    private void Simplificar() {
        int gdc = mdc(Math.abs(num), Math.abs(den));
        this.num /= gdc;
        this.den /= gdc;
        if (this.den < 0) {
            this.num = -this.num;
            this.den = -this.den;
        }
    }

    private int mdc(int a, int b) {
        return b == 0 ? a : mdc(b, a % b);
    }

    public static Fraction Soma(Fraction a, Fraction b) {
        return new Fraction(a.num * b.den + b.num * a.den, a.den * b.den);
    }

    public static Fraction Subtrair(Fraction a, Fraction b) {
        return new Fraction(a.num * b.den - b.num * a.den, a.den * b.den);
    }

    public static Fraction Multiplicar(Fraction a, Fraction b) {
        return new Fraction(a.num * b.num, a.den * b.den);
    }

    public static Fraction Dividir(Fraction a, Fraction b) {
        return new Fraction(a.num * b.den, a.den * b.num);
    }

    public int num() {return this.num;}
    public int den() {return this.den;}
    

    @Override
    public String toString() {
        if (den == 1) return String.valueOf(num);
        return num + "/" + den;
    }

}