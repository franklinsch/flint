//
//  WalletTest.swift
//  WalletTest
//
//  Created by Franklin Schrans on 12/19/17.
//

import XCTest
@testable import Parser

class WalletTest: XCTestCase, ParserTest {

   var tokens: [Token] = [
      .contract, .identifier("Wallet"), .punctuation(.openBrace), .var, .identifier("owner"), .punctuation(.colon), .identifier("Address"), .var, .identifier("contents"), .punctuation(.colon), .identifier("Ether"), .punctuation(.closeBrace), .identifier("Wallet"), .punctuation(.doubleColon), .punctuation(.openBracket), .identifier("any"), .punctuation(.closeBracket), .punctuation(.openBrace), .public, .mutating, .func, .identifier("deposit"), .punctuation(.openBracket), .identifier("ether"), .punctuation(.colon), .identifier("Ether"), .punctuation(.closeBracket), .punctuation(.openBrace), .identifier("state"), .binaryOperator(.dot), .identifier("contents"), .binaryOperator(.equal), .identifier("state"), .binaryOperator(.dot), .identifier("contents"), .binaryOperator(.plus), .identifier("money"), .punctuation(.semicolon), .punctuation(.closeBrace), .punctuation(.closeBrace), .identifier("Wallet"), .punctuation(.doubleColon), .punctuation(.openBracket), .identifier("owner"), .punctuation(.closeBracket), .punctuation(.openBrace), .public, .mutating, .func, .identifier("withdraw"), .punctuation(.openBracket), .identifier("ether"), .punctuation(.colon), .identifier("Ether"), .punctuation(.closeBracket), .punctuation(.openBrace), .identifier("state"), .binaryOperator(.dot), .identifier("contents"), .binaryOperator(.equal), .identifier("state"), .binaryOperator(.dot), .identifier("contents"), .binaryOperator(.minus), .identifier("money"), .punctuation(.semicolon), .identifier("state"), .binaryOperator(.dot), .identifier("contents"), .binaryOperator(.equal), .identifier("state"), .binaryOperator(.dot), .identifier("contents"), .punctuation(.semicolon), .punctuation(.closeBrace), .public, .mutating, .func, .identifier("getContents"), .punctuation(.openBracket), .punctuation(.closeBracket), .punctuation(.arrow), .identifier("Ether"), .punctuation(.openBrace), .return, .identifier("state"), .binaryOperator(.dot), .identifier("contents"), .punctuation(.semicolon), .punctuation(.closeBrace), .punctuation(.closeBrace)
   ]

   var expectedAST: TopLevelModule = TopLevelModule(declarations: [.contractDeclaration(ContractDeclaration(identifier: Identifier(name: "Wallet"), variableDeclarations: [VariableDeclaration(identifier: Identifier(name: "owner"), type: Type(name: "Address")), VariableDeclaration(identifier: Identifier(name: "contents"), type: Type(name: "Ether"))])), .contractBehaviorDeclaration(ContractBehaviorDeclaration(contractIdentifier: Identifier(name: "Wallet"), callerCapabilities: [CallerCapability(name: "any")], functionDeclarations: [FunctionDeclaration(modifiers: [.public, .mutating], identifier: Identifier(name: "deposit"), parameters: [Parameter(identifier: Identifier(name: "ether"), type: Type(name: "Ether"))], resultType: nil, body: [Statement.expression(Expression.binaryExpression(BinaryExpression(lhs: Expression.binaryExpression(BinaryExpression(lhs: Expression.identifier(Identifier(name: "state")), op: .dot, rhs: Expression.identifier(Identifier(name: "contents")))), op: .equal, rhs: Expression.binaryExpression(BinaryExpression(lhs: Expression.binaryExpression(BinaryExpression(lhs: Expression.identifier(Identifier(name: "state")), op: .dot, rhs: Expression.identifier(Identifier(name: "contents")))), op: .plus, rhs: Expression.identifier(Identifier(name: "money")))))))])])), .contractBehaviorDeclaration(ContractBehaviorDeclaration(contractIdentifier: Identifier(name: "Wallet"), callerCapabilities: [CallerCapability(name: "owner")], functionDeclarations: [FunctionDeclaration(modifiers: [.public, .mutating], identifier: Identifier(name: "withdraw"), parameters: [Parameter(identifier: Identifier(name: "ether"), type: Type(name: "Ether"))], resultType: nil, body: [Statement.expression(Expression.binaryExpression(BinaryExpression(lhs: Expression.binaryExpression(BinaryExpression(lhs: Expression.identifier(Identifier(name: "state")), op: .dot, rhs: Expression.identifier(Identifier(name: "contents")))), op: .equal, rhs: Expression.binaryExpression(BinaryExpression(lhs: Expression.binaryExpression(BinaryExpression(lhs: Expression.identifier(Identifier(name: "state")), op: .dot, rhs: Expression.identifier(Identifier(name: "contents")))), op: .minus, rhs: Expression.identifier(Identifier(name: "money"))))))), Statement.expression(Expression.binaryExpression(BinaryExpression(lhs: Expression.binaryExpression(BinaryExpression(lhs: Expression.identifier(Identifier(name: "state")), op: .dot, rhs: Expression.identifier(Identifier(name: "contents")))), op: .equal, rhs: Expression.binaryExpression(BinaryExpression(lhs: Expression.identifier(Identifier(name: "state")), op: .dot, rhs: Expression.identifier(Identifier(name: "contents")))))))]), FunctionDeclaration(modifiers: [.public, .mutating], identifier: Identifier(name: "getContents"), parameters: [], resultType: Optional(Type(name: "Ether")), body: [Statement.returnStatement(ReturnStatement(expression: Expression.binaryExpression(BinaryExpression(lhs: Expression.identifier(Identifier(name: "state")), op: .dot, rhs: Expression.identifier(Identifier(name: "contents"))))))])]))])

   func testWallet() {
      test()
   }
}
