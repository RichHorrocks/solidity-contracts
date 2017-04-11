contract Bank {
    // We want an owner that is allowed to selfdestruct.
    address owner;

    // Don't make this public. This means no accessor is created.
    mapping (address => uint) balances;

    // Constructor
    function Bank() {
        
    }

    function setOwner(address newOwner) returns (bool res) {
        // IMPORTANT: We don't want to allow the user to be reassigned, 
        // except maybe by the current owner.
        if (owner != 0x0 && msg.sender != owner) {
            return false;
        }
        owner = newOwner;
        return true;
    }


    // This will take the value of the transaction and add to the senders account.
    function deposit(address customer) returns (bool result) {
        if (msg.value == 0 ) {
            return false;
        }
        balances[customer] += msg.value;
        return true;
    }

    // Attempt to withdraw the given 'amount' of Ether from the account.
    function withdraw(address customer, uint amount) returns (bool result) {
        // Skip if someone tries to withdraw 0 or if they don't have 
        // enough Ether to make the withdrawal.
        if (balances[customer] < amount || amount == 0) {
            return false;        
        }
        balances[custerm] -= amount;
        msg.sender.send(amount);
        return true;
    }

    function remove() {
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }
}