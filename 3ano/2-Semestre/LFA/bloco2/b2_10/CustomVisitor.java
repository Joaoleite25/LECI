import java.util.ArrayList;
import java.util.List;

public class CustomVisitor extends QuestionBaseVisitor<Object> {
    public List<QuestionData> questions = new ArrayList<>();

    @Override
    public Object visitQuestion(QuestionParser.QuestionContext ctx) {
        QuestionData q = new QuestionData();
        
        // 1. Extrair ID e Texto da Pergunta (Limpando aspas e novas linhas)
        q.id = ctx.id().getText();
        q.text = ctx.text().getText().replace("\"", "").replace("\n", " ").trim();
        
        // 2. Percorrer as respostas
        for (QuestionParser.AnswerContext actx : ctx.answer()) {
            // Extrair texto da resposta
            String text = actx.text().getText().replace("\"", "").replace("\n", " ").trim();
            // Extrair pontuação
            int score = Integer.parseInt(actx.score().getText());
            
            q.answers.add(new QuestionData.Answer(text, score));
        }
        
        questions.add(q);
        return null;
    }
}