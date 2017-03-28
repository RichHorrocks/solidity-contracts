contract CreatorBalanceChecker {

    address creator;
    uint creatorbalance;

    function CreatorBalanceChecker() public {
        creator = msg.sender;
        creatorbalance = creator.balance;
    }

    function getContractAddress() constant returns (address) {
        return this;
    }

    function getCreatorBalance() constant returns (uint) {
        return creatorbalance;
    }
    
    function getCreatorDotBalance() constant returns (uint) {
        return creator.balance;
    }
    
    function kill() { 
        if (msg.sender == creator)
            selfdestruct(creator);
    }
}