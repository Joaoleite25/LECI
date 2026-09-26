public class JavaStats extends Java8ParserBaseListener {

    @Override 
    public void enterClassDeclaration(Java8Parser.ClassDeclarationContext ctx) {
        String className = ctx.normalClassDeclaration().Identifier().getText();
        System.out.println("Classe encontrada: " + className);
    }

    @Override 
    public void enterMethodDeclarator(Java8Parser.MethodDeclaratorContext ctx) {
        String methodName = ctx.Identifier().getText();
        System.out.println("  Método encontrado: " + methodName);
    }

    @Override 
    public void enterFormalParameter(Java8Parser.FormalParameterContext ctx) {
        String type = ctx.unannType().getText();
        String name = ctx.variableDeclaratorId().getText();
        System.out.println("    Parâmetro: " + type + " " + name);
    }
}