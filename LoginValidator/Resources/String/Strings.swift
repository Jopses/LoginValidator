import Foundation
// swiftlint:disable identifier_name
enum Strings {
    private static let hostingBundle = Bundle.main

    static let error = NSLocalizedString("error", bundle: hostingBundle, comment: "")
    static let ok = NSLocalizedString("ok", bundle: hostingBundle, comment: "")
    static let cancel = NSLocalizedString("cancel", bundle: hostingBundle, comment: "")
    static let done = NSLocalizedString("done", bundle: hostingBundle, comment: "")

    static let pleaseFillInTheField =
        NSLocalizedString("pleaseFillInTheField", bundle: hostingBundle, comment: "")
    static let onlyLatinLettersNumbersMinusAndDotsAreValidForThisField =
        NSLocalizedString("onlyLatinLettersNumbersMinusAndDotsAreValidForThisField",
                          bundle: hostingBundle, comment: "")
    static let loginCannotStartWithANumberDotMinus =
        NSLocalizedString("loginCannotStartWithANumberDotMinus", bundle: hostingBundle, comment: "")
    static func mustContainFromToSymbols(_ value1: String, _ value2: String) -> String {
        return String(format: NSLocalizedString("mustContainFromToSymbols", comment: ""), value1, value2)
    }
}
// swiftlint:enabled identifier_name
