import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.5-flash");

node Account {
    has balance: float = 0.0;
    has account_number: str;

    can deposit(amount: float) with BankAgent entry {
        self.balance += amount;
        print("Deposited", amount, "to account", self.account_number, ". New balance:", self.balance);
    }

    can withdraw(amount: float) with BankAgent entry {
        if self.balance >= amount {
            self.balance -= amount;
            print("Withdrew", amount, "to account", self.account_number, ". New balance:", self.balance);
        } else {
            print("Insufficient funds.");
        }
    }

    can show_balance() with BankAgent entry {
       print("Account", self.account_number, "balance:", self.balance);
    }
}

node Customer {
    has name: str;
    has account: Account;

    can show_info() with BankAgent entry {
        print("Customer:", self.name);
        visitor ++> self.account::show_balance();
    }
}

walker BankAgent {
    """Process a banking command and execute the appropriate action."""
    def process_command(command: str, customer: Customer) by llm() {
        """
        You are a helpful banking assistant. Interpret the user's command and call the correct method on the customer's account.
        Available actions: deposit, withdraw, show balance, show info.
        Example commands: 
        - "Deposit 500"
        - "Withdraw 200"
        - "Show my balance"
        - "Show my info"
        """
        if "deposit" in command.lower() {
            amount = float(command.split()[-1]);
            customer.account deposit(amount);
        } elif "withdraw" in command.lower() {
            amount = float(command.split()[-1]);
            customer.account withdraw(amount);
        } elif "balance" in command.lower() {
            customer.account show_balance();
        } elif "info" in command.lower() {
            customer show_info();
        } else {
            print("Sorry, I didn't understand your request.");
        }
    }
}

with entry {
    acc = Account(account_number="123456789", balance=1000.0);
    cust = Customer(name="Neema Mwende", account=acc);
    root ++> cust;

    agent = BankAgent();

    print("Welcome to Jac Bank (LLM Automated)!");
    while True {
        command = input("\nEnter your banking request (or type 'exit' to quit): ");
        if command.lower() == "exit" {
            print("Goodbye!");
            break;
        }
        agent process_command(command, cust);
    }
}