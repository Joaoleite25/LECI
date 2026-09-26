// Generated from SetCalc.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link SetCalcParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface SetCalcVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link SetCalcParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(SetCalcParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by the {@code statExpr}
	 * labeled alternative in {@link SetCalcParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatExpr(SetCalcParser.StatExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code statAssign}
	 * labeled alternative in {@link SetCalcParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatAssign(SetCalcParser.StatAssignContext ctx);
	/**
	 * Visit a parse tree produced by the {@code exprDifference}
	 * labeled alternative in {@link SetCalcParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprDifference(SetCalcParser.ExprDifferenceContext ctx);
	/**
	 * Visit a parse tree produced by the {@code exprSet}
	 * labeled alternative in {@link SetCalcParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprSet(SetCalcParser.ExprSetContext ctx);
	/**
	 * Visit a parse tree produced by the {@code exprVar}
	 * labeled alternative in {@link SetCalcParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprVar(SetCalcParser.ExprVarContext ctx);
	/**
	 * Visit a parse tree produced by the {@code exprUnion}
	 * labeled alternative in {@link SetCalcParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprUnion(SetCalcParser.ExprUnionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code exprParenthesis}
	 * labeled alternative in {@link SetCalcParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprParenthesis(SetCalcParser.ExprParenthesisContext ctx);
	/**
	 * Visit a parse tree produced by the {@code exprIntersection}
	 * labeled alternative in {@link SetCalcParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprIntersection(SetCalcParser.ExprIntersectionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SetCalcParser#set}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSet(SetCalcParser.SetContext ctx);
	/**
	 * Visit a parse tree produced by {@link SetCalcParser#element}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitElement(SetCalcParser.ElementContext ctx);
}