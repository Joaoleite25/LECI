// Generated from Fractional.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link FractionalParser}.
 */
public interface FractionalListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link FractionalParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(FractionalParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link FractionalParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(FractionalParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by the {@code StatExpr}
	 * labeled alternative in {@link FractionalParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterStatExpr(FractionalParser.StatExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code StatExpr}
	 * labeled alternative in {@link FractionalParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitStatExpr(FractionalParser.StatExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code StatPrint}
	 * labeled alternative in {@link FractionalParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterStatPrint(FractionalParser.StatPrintContext ctx);
	/**
	 * Exit a parse tree produced by the {@code StatPrint}
	 * labeled alternative in {@link FractionalParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitStatPrint(FractionalParser.StatPrintContext ctx);
	/**
	 * Enter a parse tree produced by the {@code StatAssign}
	 * labeled alternative in {@link FractionalParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterStatAssign(FractionalParser.StatAssignContext ctx);
	/**
	 * Exit a parse tree produced by the {@code StatAssign}
	 * labeled alternative in {@link FractionalParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitStatAssign(FractionalParser.StatAssignContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprAddSub(FractionalParser.ExprAddSubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprAddSub(FractionalParser.ExprAddSubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprRead}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprRead(FractionalParser.ExprReadContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprRead}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprRead(FractionalParser.ExprReadContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprMulDiv}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprMulDiv(FractionalParser.ExprMulDivContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprMulDiv}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprMulDiv(FractionalParser.ExprMulDivContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprParent(FractionalParser.ExprParentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprParent}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprParent(FractionalParser.ExprParentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprUnary(FractionalParser.ExprUnaryContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprUnary}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprUnary(FractionalParser.ExprUnaryContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprPower}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprPower(FractionalParser.ExprPowerContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprPower}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprPower(FractionalParser.ExprPowerContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprReduce}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprReduce(FractionalParser.ExprReduceContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprReduce}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprReduce(FractionalParser.ExprReduceContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprId}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprId(FractionalParser.ExprIdContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprId}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprId(FractionalParser.ExprIdContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprFraction}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprFraction(FractionalParser.ExprFractionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprFraction}
	 * labeled alternative in {@link FractionalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprFraction(FractionalParser.ExprFractionContext ctx);
	/**
	 * Enter a parse tree produced by {@link FractionalParser#fraction}.
	 * @param ctx the parse tree
	 */
	void enterFraction(FractionalParser.FractionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FractionalParser#fraction}.
	 * @param ctx the parse tree
	 */
	void exitFraction(FractionalParser.FractionContext ctx);
}