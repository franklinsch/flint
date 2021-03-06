import Foundation
import Commander
import AST
import JSTranslator
import Diagnostic
import Utils

func main() {
  command(
      Argument<String>("Test file", description: "Test file (.tflint)"),
      Flag("test runner", flag: "t", description: "Flag to run unit tests for test framework"),
      Flag("cov", flag: "c", description: "Run test suite with coverage")
  ) { sourceCode, test_run, coverage in
    let fileName = sourceCode
    let inputFiles = [URL(fileURLWithPath: fileName)]
    let sourceCode = try String(contentsOf: inputFiles[0])

    do {
      try TestRunner(testFile: inputFiles[0],
                     sourceCode: sourceCode,
                     diagnostics: DiagnosticPool(shouldVerify: false,
                                                 quiet: false,
                                                 sourceContext: SourceContext(sourceFiles: inputFiles)),
                     test_run: test_run,
                     coverage: coverage).runTests()
    } catch let err {
      print(err)
      print("Failed to run tests")
    }
  }.run()
}

func mainTest() throws {
  let fileName = Path.getFullUrl(path: "counter_ether.tflint").path
  let inputFiles = [URL(fileURLWithPath: fileName)]
  let sourceCode = try String(contentsOf: inputFiles[0])

  do {
    try TestRunner(testFile: inputFiles[0],
                   sourceCode: sourceCode,
                   diagnostics: DiagnosticPool(shouldVerify: false,
                                               quiet: false,
                                               sourceContext: SourceContext(sourceFiles: inputFiles)),
                   test_run: true,
                   coverage: true).runTests()

  } catch let err {
    print(err)
    print("Failed to run tests")
  }
}

main()
//try mainTest()
