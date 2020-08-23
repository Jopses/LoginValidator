import UIKit

class ValidatorScreenAssembly {
    func assemble(output: ValidatorScreenOutput? = nil) -> ValidatorViewController {
        let router = ValidatorRouter()
        let errorHandler = ErrorHandler()
        let presenter = ValidatorPresenter(router: router, errorHandler: errorHandler)
        let view = ValidatorViewController(output: presenter)
        presenter.view = view
        presenter.output = output
        router.view = view
        errorHandler.messagesView = view

        return view
    }
}
