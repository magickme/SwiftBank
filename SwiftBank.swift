struct SwiftBank {
    private var password: String = ""
    init(password: String, initialDeposit: Double ) {
        self.password = password
        makeDeposit(ofAmount: initialDeposit)
    }
    private func isValid(_ enteredPassword: String) -> Bool {
        if enteredPassword == password {
            return true
        } else {
            return false
        }
    }
    private var balance: Double = 0
    static let depositBonusRate = 0.01
    private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
        return deposit + (deposit * SwiftBank.depositBonusRate)
    }
    mutating func makeDeposit(ofAmount depositAmount: Double) -> Double {
        let depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount)
        print("Making a deposit of $\(depositAmount) with a bonus rate. The final amount deposited is$\(depositWithBonus)")
        balance += depositWithBonus
        return balance
    }
    func displayBalance(usingPassword password: String)
}