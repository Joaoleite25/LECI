package aula08;

public class Empresa {
    private String nome;
    private String codigoPostal;
    private String email;
    private List<Veiculo> viaturas;

    public Empresa(String nome, String codigoPostal, String email) {
        this.nome = nome;
        this.codigoPostal = codigoPostal;
        this.email = email;
        this.viaturas = new ArrayList<>();
    }

    public void addViatura(Veiculo viatura) {
        this.viaturas.add(viatura);
    }

    public List<Veiculo> getViaturas() {
        return this.viaturas;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Empresa [nome=" + nome + ", codigoPostal=" + codigoPostal + ", email=" + email + "]";
    }
}
