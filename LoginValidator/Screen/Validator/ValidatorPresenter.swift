protocol ValidatorScreenOutput: AnyObject {}

protocol ValidatorScreenInput: AnyObject {}

class ValidatorPresenter {
    // MARK: - Properties

    weak var view: ValidatorViewInput?
    let router: ValidatorRouterInput
    weak var output: ValidatorScreenOutput?
    private let errorHandler: ErrorHandler
    private let loginValidator = LoginValidator()

    // MARK: - Lifecycle

    init(router: ValidatorRouterInput, errorHandler: ErrorHandler) {
        self.router = router
        self.errorHandler = errorHandler
    }

    // MARK: - Private Methods
}

// MARK: - ValidatorViewOutput

extension ValidatorPresenter: ValidatorViewOutput {
    func validationValue(_ value: String) {
        let isValid = loginValidator.isValid(target: value)
        if !isValid, let error = loginValidator.lastValidationError {
            errorHandler.handleError(error: error)
            return
        }
        errorHandler.handleMessage(message: Strings.ok)
    }
}

// MARK: - ValidatorScreenInput

extension ValidatorPresenter: ValidatorScreenInput {}
