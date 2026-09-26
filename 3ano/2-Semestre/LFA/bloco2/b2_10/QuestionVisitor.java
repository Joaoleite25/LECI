// Generated from Question.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link QuestionParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface QuestionVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link QuestionParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(QuestionParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link QuestionParser#question}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQuestion(QuestionParser.QuestionContext ctx);
	/**
	 * Visit a parse tree produced by {@link QuestionParser#answer}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAnswer(QuestionParser.AnswerContext ctx);
	/**
	 * Visit a parse tree produced by {@link QuestionParser#id}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitId(QuestionParser.IdContext ctx);
	/**
	 * Visit a parse tree produced by {@link QuestionParser#text}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitText(QuestionParser.TextContext ctx);
	/**
	 * Visit a parse tree produced by {@link QuestionParser#score}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitScore(QuestionParser.ScoreContext ctx);
}