import XCTest
@testable import LoginValidator

class ValidatorScreenAssemblyTests: XCTestCase {

    // MARK: - Properties

    private var viewController: ValidatorViewController!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        viewController = ValidatorScreenAssembly().assemble()
    }

    // MARK: - Tests

    func testViewOutput() {
        let isPresenter = viewController.output is ValidatorPresenter
        XCTAssertTrue(isPresenter, "viewController.output is not ValidatorPresenter")
    }

    func testViewInput() {
        guard let presenter = viewController.output as? ValidatorPresenter else {
            XCTFail("Cannot assign viewController.output as ValidatorPresenter")
            return
        }

        let isViewController = presenter.view is ValidatorViewController
        XCTAssertTrue(isViewController, "presenter.view is not ValidatorViewController")
    }

    func testRouterInput() {
        guard let presenter = viewController.output as? ValidatorPresenter else {
            XCTFail("Cannot assign viewController.output as ValidatorPresenter")
            return
        }

        let isRouter = presenter.router is ValidatorRouter
        XCTAssertTrue(isRouter, "presenter.router is not ValidatorRouter")
    }

    func testScreenTransitionable() {
        guard let presenter = viewController.output as? ValidatorPresenter else {
            XCTFail("Cannot assign viewController.output as ValidatorPresenter")
            return
        }
        guard let router = presenter.router as? ValidatorRouter else {
            XCTFail("Cannot assign presenter.router as ValidatorRouter")
            return
        }

        let isViewController = router.view is ValidatorViewController
        XCTAssertTrue(isViewController, "router.view is not ValidatorViewController")
    }
}
