import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.5-flash");

node Account {
    has balance: float = 0.0;
    has account_number: str;

    can deposit(amount: float) with BankAgent entry {
        self.balance += amount;
        print("Deposited " + str(amount) + ". New balance: " + str(self.balance));
    }

    can withdraw(amount: float) with BankAgent entry {
        if self.balance >= amount {
            self.balance -= amount;
            print("Withdrew " + str(amount) + ". New balance: " + str(self.balance));
        } else {
            print("Insufficient funds.");
        }
    }

    can show_balance() with BankAgent entry {
        print("Account balance: " + str(self.balance));
    }
}

node Customer {
    has name: str;
    has account: Account;

    can show_info() with BankAgent entry {
        print("Customer: " + self.name);
        visitor ++> self.account::show_balance();
    }
}

walker BankAgent {
    def handle_action(action: str, amount: float, customer: Customer) by llm();
}

with entry {
    print("Welcome to Jac Bank!");
    user_name = input("Enter your name: ");
    acc = Account(account_number="123456789", balance=0.0);
    cust = Customer(name=user_name, account=acc);
    root ++> cust;
    agent = BankAgent();

    while True {
        print("\nChoose an action: deposit, withdraw, balance, info, exit");
        action = input("Action: ").lower();
        if action == "exit" {
            print("Goodbye!");
            break;
        }
        amount = 0.0;
        if action == "deposit" or action == "withdraw" {
            amount = float(input("Enter amount: "));
        }
        agent handle_action(action, amount, cust);
    }
}