@testable import LoginValidator

struct LoginValidatorValidErrorTestsData {
    // MARK: - Test Input

    let input: [String] = [
        "",
        "lo",
        "bug_login",
        "-login",
        "my.login-100",
        "login@email.ok"
    ]

    // MARK: - Test Output

    let output: [ValidationError?] = [
        .emptyFields,
        .loginLength,
        .loginFormat,
        .loginStart,
        nil,
        nil
    ]
}
