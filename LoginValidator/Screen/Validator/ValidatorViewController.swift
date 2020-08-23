import UIKit

protocol ValidatorViewInput: AnyObject {}

protocol ValidatorViewOutput {
    func validationValue(_ value: String)
}

class ValidatorViewController: UIViewController, ScreenTransitionable, UserMessagesView {
    // MARK: - Properties

    let output: ValidatorViewOutput
    private let textField = UITextField()
    private let sendButton = UIButton()

    private let multiplierWidth: CGFloat = 0.9

    // MARK: - Lifecycle

    init(output: ValidatorViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }

    // MARK: - Prepare View

    private func prepareView() {
        view.apply(.backgroundView)
        hideKeyboardOnTap()
        setSendButton()
        setTextField()
    }

    private func setSendButton() {
        sendButton.apply(.primary)
        sendButton.setTitle(Strings.done, for: .normal)
        sendButton.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
        view.addSubview(sendButton)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: Grid.xl.offset),
            sendButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplierWidth)
        ])
    }

    private func setTextField() {
        textField.apply(.primary)
        textField.delegate = self
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.bottomAnchor.constraint(equalTo: sendButton.topAnchor, constant: -Grid.sm.offset),
            textField.leadingAnchor.constraint(equalTo: sendButton.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: sendButton.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: Grid.xl.offset)
        ])
    }

    // MARK: - Actions

    @objc
    private func sendAction() {
        output.validationValue(textField.text ?? "")
    }
}

// MARK: - ValidatorViewInput

extension ValidatorViewController: ValidatorViewInput {}

// MARK: - UITextFieldDelegate

extension ValidatorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
