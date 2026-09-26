public class Fraction {
    private int num, den;

    public Fraction(int n, int d) {
        if (d == 0) throw new ArithmeticException("Denominador zero!");
        // Normalizar: denominador sempre positivo
        if (d < 0) { n = -n; d = -d; }
        
        // Simplificar logo na criação (opcional, mas recomendado)
        int common = gcd(Math.abs(n), Math.abs(d));
        this.num = n / common;
        this.den = d / common;
    }

    public int getNum() { return num; }
    public int getDen() { return den; }

    public static Fraction parse(String s) {
        s = s.trim();
        if (!s.contains("/")) return new Fraction(Integer.parseInt(s), 1);
        String[] parts = s.split("/");
        return new Fraction(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]));
    }

    public Fraction add(Fraction other) {
        return new Fraction(this.num * other.den + other.num * this.den, this.den * other.den);
    }

    public Fraction subtract(Fraction other) {
        return new Fraction(this.num * other.den - other.num * this.den, this.den * other.den);
    }

    public Fraction multiply(Fraction other) {
        return new Fraction(this.num * other.num, this.den * other.den);
    }

    public Fraction divide(Fraction other) {
        return new Fraction(this.num * other.den, this.den * other.num);
    }

    public Fraction pow(int exp) {
        return new Fraction((int)Math.pow(num, exp), (int)Math.pow(den, exp));
    }

    public Fraction reduce() {
        // Já reduzimos no construtor, mas mantemos para a regra 'reduce'
        int common = gcd(Math.abs(num), Math.abs(den));
        return new Fraction(num / common, den / common);
    }

    private int gcd(int a, int b) {
        return b == 0 ? a : gcd(b, a % b);
    }

    @Override
    public String toString() {
        if (num == 0) return "0";
        return (den == 1) ? String.valueOf(num) : num + "/" + den;
    }
}