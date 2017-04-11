contract ActionManagerEnabled is DougEnabled {
    // Makes it easier to check that action manager is the caller.
    function isActionManager() internal constant returns (bool) {
        if(DOUG != 0x0){
            address am = ContractProvider(DOUG).contracts("actions");
            if (msg.sender == am){
                return true;
            }
        }
        return false;
    }
}
