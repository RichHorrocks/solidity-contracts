contract Incrementer2 {

    address creator;
    int iteration;
    string whathappened;

    function Incrementer2() {
        creator = msg.sender;
        iteration = 0;
        whathappened = "constructor executed";
    }

    function increment(int howmuch) 
    {
        if (howmuch == 0) {
            iteration = iteration + 1;
            whathappened = "howmuch was zero. Incremented by 1.";
        } else {
            iteration = iteration + howmuch;
            whathappened = "howmuch was nonzero. Incremented by its value.";
        }

        return;
    }
    
    function getWhatHappened() constant returns (string) {
        return whathappened;
    }
    
    function getIteration() constant returns (int) {
        return iteration;
    }

    function kill() { 
        if (msg.sender == creator)
            selfdestruct(creator);
    }
}