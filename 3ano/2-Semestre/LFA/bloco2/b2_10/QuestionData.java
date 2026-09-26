import java.util.ArrayList;
import java.util.List;

public class QuestionData {
    public String id;
    public String text;
    public List<Answer> answers = new ArrayList<>();

    public static class Answer {
        public String text;
        public int score;

        public Answer(String text, int score) {
            this.text = text;
            this.score = score;
        }
    }
}