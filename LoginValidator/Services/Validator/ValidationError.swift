import Foundation

enum ValidationError: Error, LocalizedError {
    case emptyFields
    case loginLength
    case loginFormat
    case loginStart

    var errorDescription: String? {
        return localizedDescription
    }

    var localizedDescription: String {
        switch self {
        case .emptyFields:
            return Strings.pleaseFillInTheField
        case .loginLength:
            return Strings
                .mustContainFromToSymbols("\(LoginValidator.minCharacters)", "\(LoginValidator.maxCharacters)")
        case .loginFormat:
            return Strings.onlyLatinLettersNumbersMinusAndDotsAreValidForThisField
        case .loginStart:
            return Strings.loginCannotStartWithANumberDotMinus
        }
    }
}
