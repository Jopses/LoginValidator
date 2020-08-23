import Foundation

class LoginValidator: Validator {
    // MARK: - Properties

    static let minCharacters = 3
    static let maxCharacters = 32

    private(set) var lastValidationError: ValidationError?

    // MARK: - Validation

    func isValid(target: String) -> Bool {
        if target.isEmpty {
            lastValidationError = .emptyFields
            return false
        } else if check(target, type: .email) {
            lastValidationError = nil
            return true
        } else if target.count < LoginValidator.minCharacters ||
            target.count > LoginValidator.maxCharacters {
            lastValidationError = .loginLength
            return false
        } else if !check(target, type: .format) {
            lastValidationError = .loginFormat
            return false
        } else if check(target, type: .start) {
            lastValidationError = .loginStart
            return false
        } else {
            lastValidationError = nil
            return true
        }
    }

    func check(_ target: String, type: LoginCheckType) -> Bool {
        var regexp = ""
        switch type {
        case .email:
            regexp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .format:
            regexp = "[A-Za-z0-9-.]+"
        case .start:
            regexp = "^[0-9\\-\\.].*"
        }
        let predicate = NSPredicate(format: "SELF MATCHES %@", regexp)
        return predicate.evaluate(with: target)
    }
}
