//
//  AST.swift
//  YUL
//
//  Created by Yicheng Luo on 11/16/18.
//

import Foundation

public typealias Identifier = String

public enum Literal: CustomStringConvertible {
  case num(Int)
  case string(String)
  case bool(Bool)
  case decimal(Int, Int)
  case hex(String)

  public var description: String {
    switch self {
    case .num(let i):
      return String(i)
    case .string(let s):
      return "\"\(s)\""
    case .bool(let b):
      return b ? "1" : "0"
    case .decimal(let (n1, n2)):
      return "\(n1).\(n2)"
    case .hex(let h):
      return h
    }
  }
}

public struct Block: CustomStringConvertible {
  public var statements: [Statement]

  public init(_ statements: [Statement]) {
    self.statements = statements
  }

  public var description: String {
    let statement_description = self.statements.map({ s in
      return s.description
    }).joined(separator: "\n")

    return """
    {
      \(statement_description.indented(by: 2))
    }
    """
  }
}

// swiftlint:disable type_name
public struct If: CustomStringConvertible {
// swiftlint:enable type_name
  public let expression: Expression
  public let block: Block

  public init(_ expression: Expression, _ block: Block) {
    self.expression = expression
    self.block = block
  }

  public var description: String {
    return "if \(expression.description) \(self.block)"
  }
}

public struct Switch: CustomStringConvertible {
  public let expression: Expression
  public let cases: [(Literal, Block)]
  public let `default`: Block?

  public init(_ expression: Expression, cases: [(Literal, Block)], `default`: Block? = nil) {
    self.expression = expression
    self.cases = cases
    self.default = `default`
  }

  public init(_ expression: Expression, `default`: Block? = nil) {
    self.init(expression, cases: [], default: `default`)
  }

  public var description: String {
    let cases = self.cases.map { (lit, block) in
      return "case \(lit) \(block)"
      }.joined(separator: "\n")

    let `default` = self.default != nil ? "\ndefault \(self.default!)" : ""

    return """
    switch \(self.expression)
    \(cases)\(`default`)
    """
  }
}

public struct ForLoop: CustomStringConvertible {
  public let initialize: Block
  public let condition: Expression
  public let step: Block
  public let body: Block

  public init(_ initialize: Block, _ condition: Expression, _ step: Block, _ body: Block) {
    self.initialize = initialize
    self.condition = condition
    self.step = step
    self.body = body
  }

  public var description: String {
    return "for \(initialize) \(condition) \(step) \(body)"
  }
}

public enum Statement: CustomStringConvertible {
  case block(Block)
  case functionDefinition(FunctionDefinition)
  case `if`(If)
  case expression(Expression)
  case `switch`(Switch)
  case `for`(ForLoop)
  case `break`
  case `continue`
  case noop
  case inline(String)

  public var catchableSuccesses: [Expression] {
    switch self {
    case .if(let ifs):
      return ifs.expression.catchableSuccesses
    case .expression(let e):
      return e.catchableSuccesses
    case .switch(let sw):
      return sw.expression.catchableSuccesses
    default:
      return []
    }
  }

  public var description: String {
    switch self {
    case .block(let b):
      return b.description
    case .functionDefinition(let f):
      return f.description
    case .if(let ifs):
      return ifs.description
    case .expression(let e):
      return e.description
    case .switch(let sw):
      return sw.description
    case .`for`(let loop):
      return loop.description
    case .break:
      return "break"
    case .continue:
      return "continue"
    case .noop:
      return ""
    case .inline(let s):
      return s
    }
  }
}

public enum Type: String, CustomStringConvertible {
  case bool
  case u8
  case s8
  case u32
  case s32
  case u64
  case s64
  case u128
  case s128
  case u256
  case s256
  case any

  public var description: String {
    return self.rawValue
  }
}

public typealias TypedIdentifierList = [(Identifier, Type)]

private func render(typedIdentifierList: TypedIdentifierList) -> String {
  return typedIdentifierList.map({ (ident, type) in
    switch type {
    case .any:
      return "\(ident)"
    default:
      return "\(ident): \(type)"
    }
  }).joined(separator: ", ")
}

public struct FunctionDefinition: CustomStringConvertible {
  public let identifier: Identifier
  public let arguments: TypedIdentifierList
  public let returns: TypedIdentifierList
  public let body: Block

  public init(identifier: Identifier,
              arguments: TypedIdentifierList,
              returns: TypedIdentifierList = [],
              body: Block) {
    self.identifier = identifier
    self.arguments = arguments
    self.returns = returns
    self.body = body
  }

  public var description: String {
    let args = render(typedIdentifierList: self.arguments)

    var ret = ""
    if !self.returns.isEmpty {
      let retargs = render(typedIdentifierList: self.returns)
      ret = "-> \(retargs)"
    }

    return "\(self.identifier)(\(args)) \(ret) \(self.body)"
  }
}

public struct VariableDeclaration: CustomStringConvertible {
  public let declarations: TypedIdentifierList
  public let expression: Expression?

  public init(_ declarations: TypedIdentifierList, _ expression: Expression? = nil) {
    self.declarations = declarations
    self.expression = expression
  }

  public var catchableSuccesses: [Expression] {
    return expression?.catchableSuccesses ?? []
  }

  public var description: String {
    let decls = render(typedIdentifierList: self.declarations)
    if self.expression == nil {
      return "let \(decls)"
    }
    return "let \(decls) := \(self.expression!.description)"
  }
}

public typealias IdentifierList = [Identifier]

public struct Assignment: CustomStringConvertible {
  public let identifiers: IdentifierList
  public let expression: Expression

  public init(_ identifiers: IdentifierList, _ rhs: Expression) {
    self.identifiers = identifiers
    self.expression = rhs
  }

  public var catchableSuccesses: [Expression] {
    return expression.catchableSuccesses
  }

  public var description: String {
    let lhs = self.identifiers.joined(separator: ", ")
    return "\(lhs) := \(self.expression)"
  }
}

public indirect enum Expression: CustomStringConvertible {
  case functionCall(FunctionCall)
  case identifier(Identifier)
  case literal(Literal)
  case catchable(value: Expression, success: Expression)

  // TODO: these three should really be statements
  case variableDeclaration(VariableDeclaration)
  case assignment(Assignment)
  case noop

  case inline(String)

  public var catchableSuccesses: [Expression] {
    switch self {
    case .variableDeclaration(let decl):
      return decl.catchableSuccesses
    case .assignment(let assign):
      return assign.catchableSuccesses
    case .functionCall(let f):
      return f.catchableSuccesses
    case .catchable(_, let success):
      return [success]
    default:
      return []
    }
  }

  public var description: String {
    switch self {
    case .functionCall(let call):
      return call.description
    case .identifier(let id):
      return id
    case .literal(let l):
      return l.description
    case .variableDeclaration(let decl):
      return decl.description
    case .assignment(let assign):
      return assign.description
    case .catchable(let value, _):
      return value.description
    case .noop:
      return ""
    case .inline(let s):
      return s
    }
  }
}

public struct FunctionCall: CustomStringConvertible {
  public let name: Identifier
  public let arguments: [Expression]

  public init(_ name: Identifier, _ arguments: [Expression]) {
    self.name = name
    self.arguments = arguments
  }

  public var catchableSuccesses: [Expression] {
    return arguments.flatMap { argument in argument.catchableSuccesses }
  }

  public var description: String {
    let args = arguments.map({ arg in
      return arg.description
    }).joined(separator: ", ")
    return "\(name)(\(args))"
  }
}