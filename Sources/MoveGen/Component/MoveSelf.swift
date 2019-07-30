//
//  MoveSelf.swift
//  MoveGen
//
//  Created by Hails, Daniel R on 29/08/2018.
//
import Lexer
import MoveIR
/// Generates code for a "self" expression.
struct MoveSelf {
  var selfToken: Token
  var asLValue: Bool

  func rendered(functionContext: FunctionContext) -> MoveIR.Expression {
    guard case .self = selfToken.kind else {
      fatalError("Unexpected token \(selfToken.kind)")
    }

    return .identifier(functionContext.isInStructFunction ? "_flintSelf" : (asLValue ? "0" : ""))
  }
}
