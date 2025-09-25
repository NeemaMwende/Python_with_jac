# bank application
node Account {
    has balance: float = 0.0;
    has account_number: str;

    can deposit with BankAgent entry {
        self.balance += visitor.amount;
        print(f"Deposited {visitor.amount} to account {self.account_number}. New balance: {self.balance}");
    }

    can withdraw with BankAgent entry {
        if self.balance >= visitor.amount {
            self.balance -= visitor.amount;
            print(f"Withdrew {visitor.amount} from account {self.account_number}. New balance: {self.balance}");
        } else {
            print("Insufficient funds.");
        }
    }

    can show_balance with BankAgent entry {
        print(f"Account {self.account_number} balance: {self.balance}");
    }
}

node Customer {
    has name: str;
    has account: Account;

    can show_info with BankAgent entry {
        print(f"Customer: {self.name}");
        self.account show_balance;
    }
}

walker BankAgent {
    has amount: float = 0.0;

    can deposit_to_account with Customer entry {
        self.amount = float(input("Enter amount to deposit: "));
        self.account deposit;
    }

    can withdraw_from_account with Customer entry {
        self.amount = float(input("Enter amount to withdraw: "));
        self.account withdraw;
    }

    can check_balance with Customer entry {
        self.account show_balance;
    }
}

with entry {
    // Create a customer and account
    acc = Account(account_number="123456789", balance=1000.0);
    cust = Customer(name="Neema Mwende", account=acc);
    root ++> cust;

    agent = BankAgent() spawn root;

    print("Welcome to Jac Bank!");
    while True {
        print("\nOptions:\n1. Deposit\n2. Withdraw\n3. Check Balance\n4. Show Customer Info\n5. Exit");
        choice = input("Choose an option: ");
        if choice == "1" {
            cust deposit_to_account;
        } elif choice == "2" {
            cust withdraw_from_account;
        } elif choice == "3" {
            cust check_balance;
        } elif choice == "4" {
            cust show_info;
        } elif choice == "5" {
            print("Goodbye!");
            break;
        } else {
            print("Invalid option.");
        }
    }
}