contract BasicIncrementer {

    address creator;
    uint iteration;

    function BasicIncrementer() public {
        creator = msg.sender; 
        iteration = 0;
    }

    function increment() {
        iteration = iteration + 1;
    }
    
    function getIteration() constant returns (uint) {
        return iteration;
    }
    
    function kill() { 
        if (msg.sender == creator)
            selfdestruct(creator);
    }
}