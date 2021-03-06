struct SwiftBank {
    private var password: String = ""
    init(password: String, initialDeposit: Double) {
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
    private var balance: Double = 0 {
        didSet {
            if balance < 100 {
                displayLowBalanceMessage()
            }
        }
    }
    static let depositBonusRate = 0.01
    private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
        return deposit + (deposit * SwiftBank.depositBonusRate)
    }
    mutating func makeDeposit(ofAmount depositAmount: Double) -> Double {
        let depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount)
        print("Making a deposit of $\(depositAmount) with a bonus rate. The final amount deposited is $\(depositWithBonus)")
        self.balance += depositWithBonus
        return balance
    }
    func displayBalance(usingPassword password: String) {
        if isValid(password) {
            print("Your current balance is $\(balance)")
        } else {
            print("Error: Invalid password. Cannot retrieve balance.")
            return
        }
    }
    private func displayLowBalanceMessage() {
        print("Alert: Your balance is under $100")
    }
}

var myAccount = SwiftBank(password: "doge", initialDeposit: 500)

myAccount.makeDeposit(ofAmount: 50)

myAccount.makeWithdrawal(ofAmount: 100, usingPassword: "dogger")

displayBalance(usingPassword: "doge")