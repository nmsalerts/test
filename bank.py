class BankAccount:
    def __init__(self, account_number, account_holder, balance):
        self.account_number = account_number
        self.account_holder = account_holder
        self.balance = balance

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            print(f"\n₹{amount} deposited successfully. New balance: ₹{self.balance}")
        else:
            print("\nDeposit amount must be positive.")

    def withdraw(self, amount):
        if amount > 0:
            if self.balance >= amount:
                self.balance -= amount
                print(f"\n₹{amount} withdrawn successfully. Remaining balance: ₹{self.balance}")
            else:
                print("\nInsufficient balance. Withdrawal denied.")
        else:
            print("\nWithdrawal amount must be positive.")

    def display_details(self):
        print("\nAccount Details:")
        print(f"Account Number: {self.account_number}")
        print(f"Account Holder: {self.account_holder}")
        print(f"Balance: ₹{self.balance}")


def main():
    print("Welcome to the Basic Banking System")
    
    # Create a new account
    account_number = input("Enter Account Number: ")
    account_holder = input("Enter Account Holder Name: ")
    while True:
        try:
            balance = float(input("Enter Initial Balance (₹): "))
            if balance < 0:
                print("Initial balance cannot be negative.")
                continue
            break
        except ValueError:
            print("Please enter a valid number.")

    account = BankAccount(account_number, account_holder, balance)

    # Menu-driven system
    while True:
        print("\n--- Menu ---")
        print("1. Deposit Money")
        print("2. Withdraw Money")
        print("3. Display Account Details")
        print("4. Exit")
        
        choice = input("Enter your choice (1-4): ")
        
        if choice == '1':
            try:
                amount = float(input("Enter amount to deposit (₹): "))
                account.deposit(amount)
            except ValueError:
                print("Please enter a valid number.")
        elif choice == '2':
            try:
                amount = float(input("Enter amount to withdraw (₹): "))
                account.withdraw(amount)
            except ValueError:
                print("Please enter a valid number.")
        elif choice == '3':
            account.display_details()
        elif choice == '4':
            print("Exiting the program. Thank you!")
            break
        else:
            print("Invalid choice. Please select a valid option.")


if __name__ == "__main__":
    main()
