contract FundManager {
    // We still want an owner.
    address owner;

    // This holds a reference to the current bank contract.
    address bank;

    // Constructor
    function FundManager() {
        owner = msg.sender;
        bank = new Bank();
        Bank(bank).setOwner(address(this));
    }

    // Add a new bank address to the contract.
    function setBank(address newBank) constant returns (bool res) {
        if (msg.sender != owner){
            return false;
        }
        
        bool result = Bank(newBank).setOwner(address(this));
        // If we couldn't set ourself as owner, we will not add the bank.
        if (!result) {
            return false;
        }

        bank = newBank;
        return true;
    }

    // We're responsible for this now that we're the owner of the banks.
    function selfdestructBank(address addr) {
        if (msg.sender != owner){
            return;
        }
        Bank(addr).remove();
    }

    // Set the permissions for a user.
    function setPermission(address user, uint perm) constant returns (bool res) {
        if (msg.sender != owner) {
            return false;
        }
        perms[user] = perm;
        return true;
    }

    // Attempt to deposit the given 'amount' of Ether to the account.
    function deposit() returns (bool res) {
        if (msg.value == 0){
            return false;
        }

        if (bank == 0x0) {
            // If the user sent money, we should return it if we can't deposit.
            msg.sender.send(msg.value);
            return false;
        }

        if (perms[msg.sender] != 1){
            return false;
        }

        // Use the interface to call on the bank contract. 
        //We pass msg.value along as well.
        bool success = Bank(bank).deposit.value(msg.value)(msg.sender);

        // If the transaction failed, return the Ether to the caller.
        if (!success) {
            msg.sender.send(msg.value);
        }

        return success;
    }

    // Attempt to withdraw the given 'amount' of Ether from the account.
    function withdraw(uint amount) returns (bool res) {
        if ( bank == 0x0 ) {
            return false;
        }

        if(perms[msg.sender] != 1){
            return false;
        }
        
        // Use the interface to call on the bank contract.
        bool success = Bank(bank).withdraw(msg.sender, amount);

        // If the transaction succeeded, pass the Ether on to the caller.
        if (success) {
            msg.sender.send(amount);
        }
        return success;
    }
}