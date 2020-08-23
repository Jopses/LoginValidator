import XCTest
@testable import LoginValidator

class LoginValidatorTests: XCTestCase {

    let validator = LoginValidator()

    func testIsValid() {
        let testData = LoginValidatorValidTestsData()
        let output = testData.input.map { name -> Bool in
            return validator.isValid(target: name)
        }
        let expectedOutput = testData.output
        XCTAssertEqual(output, expectedOutput)
    }
    func testValidationError() {
        let testData = LoginValidatorValidErrorTestsData()
        let output = testData.input.map { data -> ValidationError? in
            _ = validator.isValid(target: data)
            return validator.lastValidationError
        }
        let expectedOutput = testData.output
        XCTAssertEqual(output, expectedOutput)
    }
}
