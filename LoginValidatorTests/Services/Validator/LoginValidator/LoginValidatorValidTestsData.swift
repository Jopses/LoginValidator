@testable import LoginValidator

struct LoginValidatorValidTestsData {
    // MARK: - Test Input

    let input: [String] = [
        "",
        "lo",
        "ABCDEFGHIJQLMNOPQRSTUVWXYZABCDEFGHIJQLMNOPQRSTUVWXYZ",
        "bug_login",
        "-login",
        "my.login-100",
        "login@email.ok"
    ]

    // MARK: - Test Output

    let output: [Bool] = [
        false,
        false,
        false,
        false,
        false,
        true,
        true
    ]
}
