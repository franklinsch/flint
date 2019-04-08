import AST
import Foundation

enum BoogieError {
  // Failure (line number, error string)

  case assertionFailure(Int, String)
  case preConditionFailure(Int, String)
  case callPreConditionFailure(Int, String)
  case postConditionFailure(Int, String)
  case modifiesFailure(Int, String)
  case loopInvariantEntryFailure(Int, String)
  case loopInvariantMaintenanceFailure(Int, String)
}

struct VerifierMappingKey: Hashable {
  let file: String
  let flintLine: Int

  var hashValue: Int {
    return file.hashValue + flintLine ^ 2
  }
}

public struct IdentifierNormaliser {
  public init() {}

  func translateGlobalIdentifierName(_ name: String, tld owningTld: String) -> String {
    return "\(name)_\(owningTld)"
  }

  func generateStateVariable(_ contractName: String) -> String {
    return translateGlobalIdentifierName("stateVariable", tld: contractName)
  }

  func generateStructInstanceVariable(structName: String) -> String {
    return translateGlobalIdentifierName("nextInstance", tld: structName)
  }

  func getShadowArraySizePrefix(depth: Int) -> String {
    return "size_\(depth)_"
  }

  func getShadowDictionaryKeysPrefix(depth: Int) -> String {
    return "keys_\(depth)_"
  }

  func getFunctionName(function: ContractBehaviorMember, tld: String) -> String {
    var functionName: String
    let parameterTypes: [RawType]
    switch function {
    case .functionDeclaration(let functionDeclaration):
      functionName = functionDeclaration.signature.identifier.name
      parameterTypes = functionDeclaration.signature.parameters.map({ $0.type.rawType })
    case .specialDeclaration(let specialDeclaration):
      functionName = specialDeclaration.signature.specialToken.description
      parameterTypes = specialDeclaration.signature.parameters.map({ $0.type.rawType })
    case .functionSignatureDeclaration(let functionSignatureDeclaration):
      functionName = functionSignatureDeclaration.identifier.name
      parameterTypes = functionSignatureDeclaration.parameters.map({ $0.type.rawType })
    case .specialSignatureDeclaration(let specialSignatureDeclaration):
      functionName = specialSignatureDeclaration.specialToken.description
      parameterTypes = specialSignatureDeclaration.parameters.map({ $0.type.rawType })
    }

    let flattenType = flattenTypes(types: parameterTypes)
    return translateGlobalIdentifierName(functionName + flattenType, tld: tld)
  }

  func flattenTypes(types: [RawType]) -> String {
    if types.count == 0 {
      return ""
    }
    var types = types
    let type = types.remove(at: 0)
    switch type {
    case .arrayType(let elemType):
      return "$\(flattenTypes(types: [elemType]))$"
    case .dictionaryType(let keyType, let valueType):
      return "@\(flattenTypes(types: [keyType]))@$@\(flattenTypes(types: [valueType]))@"
    default:
      return type.name + flattenTypes(types: types)
    }
  }
}
