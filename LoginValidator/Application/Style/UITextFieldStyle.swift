import UIKit

extension StyleWrapper where Element == UITextField {
    static var primary: StyleWrapper {
        return .wrap { textField, theme in
            textField.font = theme.typography.body2
            textField.textAlignment = .left
            textField.backgroundColor = theme.colorPalette.background
            textField.tintColor = theme.colorPalette.onBackground
            textField.borderStyle = .roundedRect
            textField.keyboardType = .emailAddress
            textField.textContentType = .emailAddress
            textField.autocapitalizationType = .none
            textField.returnKeyType = .done
        }
    }
}
