import XCTest
@testable import LoginValidator

class ValidatorPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: ValidatorPresenter!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        let router = ValidatorRouterMock()
        let view = ValidatorViewControllerMock()
        let output = ValidatorScreenOutputMock()
        let errorHandler = ErrorHandler()
        presenter = ValidatorPresenter(router: router, errorHandler: errorHandler)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}
