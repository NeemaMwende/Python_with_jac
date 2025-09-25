def handle_action(action: str, amount: float, customer: Customer) by llm() {
    """
    You are a banking assistant. Based on the action ('deposit', 'withdraw', 'balance', 'info'), 
    call the correct method on the customer's account or show info.
    - For 'deposit', deposit the given amount.
    - For 'withdraw', withdraw the given amount.
    - For 'balance', show the account balance.
    - For 'info', show the customer info.
    """
    if action == "deposit" {
        customer.account deposit(amount);
    } elif action == "withdraw" {
        customer.account withdraw(amount);
    } elif action == "balance" {
        customer.account show_balance();
    } elif action == "info" {
        customer show_info();
    } else {
        print("Unknown action.");
    }
}