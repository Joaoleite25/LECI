// Generated from PrefixCalculator.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link PrefixCalculatorParser}.
 */
public interface PrefixCalculatorListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link PrefixCalculatorParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(PrefixCalculatorParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link PrefixCalculatorParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(PrefixCalculatorParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link PrefixCalculatorParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterStat(PrefixCalculatorParser.StatContext ctx);
	/**
	 * Exit a parse tree produced by {@link PrefixCalculatorParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitStat(PrefixCalculatorParser.StatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprBinary}
	 * labeled alternative in {@link PrefixCalculatorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprBinary(PrefixCalculatorParser.ExprBinaryContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprBinary}
	 * labeled alternative in {@link PrefixCalculatorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprBinary(PrefixCalculatorParser.ExprBinaryContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link PrefixCalculatorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprUnary(PrefixCalculatorParser.ExprUnaryContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link PrefixCalculatorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprUnary(PrefixCalculatorParser.ExprUnaryContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprInteger}
	 * labeled alternative in {@link PrefixCalculatorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprInteger(PrefixCalculatorParser.ExprIntegerContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprInteger}
	 * labeled alternative in {@link PrefixCalculatorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprInteger(PrefixCalculatorParser.ExprIntegerContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link PrefixCalculatorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprParent(PrefixCalculatorParser.ExprParentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link PrefixCalculatorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprParent(PrefixCalculatorParser.ExprParentContext ctx);
}