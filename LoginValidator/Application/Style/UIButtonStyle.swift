import UIKit

extension StyleWrapper where Element == UIButton {
    static var primary: StyleWrapper {
        return .wrap { button, theme in
            button.clipsToBounds = true
            button.layer.cornerRadius = Grid.xs.offset
            button.backgroundColor = theme.colorPalette.primary
            button.setTitleColor(theme.colorPalette.onPrimary, for: .normal)
            button.titleLabel?.font = theme.typography.button
        }
    }
}
