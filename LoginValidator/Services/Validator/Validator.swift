protocol Validator {
    associatedtype Target

    func isValid(target: Target) -> Bool
}
