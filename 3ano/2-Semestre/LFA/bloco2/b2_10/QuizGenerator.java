import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.util.*;
import java.util.stream.Collectors;

public class QuizGenerator {
    public static void main(String[] args) throws Exception {
        if (args.length < 3) {
            System.out.println("Uso: java QuizGenerator <ficheiro> <padrao_id> <n_alineas>");
            return;
        }

        String fileName = args[0];
        String pattern = args[1];
        int numLines = Integer.parseInt(args[2]);

        // 1. Setup do ANTLR
        CharStream input = CharStreams.fromFileName(fileName);
        QuestionLexer lexer = new QuestionLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        QuestionParser parser = new QuestionParser(tokens);
        ParseTree tree = parser.program();

        // 2. Extrair dados
        CustomVisitor visitor = new CustomVisitor();
        visitor.visit(tree);

        // 3. Filtrar perguntas que contenham o padrão no ID
        List<QuestionData> filtered = visitor.questions.stream()
                .filter(q -> q.id.contains(pattern))
                .collect(Collectors.toList());

        if (filtered.isEmpty()) {
            System.out.println("Nenhuma pergunta encontrada com o padrão: " + pattern);
            return;
        }

        // 4. Selecionar uma pergunta aleatória
        Random rand = new Random();
        QuestionData selected = filtered.get(rand.nextInt(filtered.size()));

        // 5. Sortear e limitar as respostas
        List<QuestionData.Answer> answers = new ArrayList<>(selected.answers);
        Collections.shuffle(answers);
        int limit = Math.min(numLines, answers.size());

        // 6. Output formatado
        System.out.println("- " + selected.text);
        for (int i = 0; i < limit; i++) {
            char letter = (char) ('a' + i);
            System.out.println("  " + letter + ") " + answers.get(i).text + ";");
        }
    }
}