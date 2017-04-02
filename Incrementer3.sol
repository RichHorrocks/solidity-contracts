contract Incrementer3 {

    address creator;
    int iteration;
    string whathappened;
    int customvalue;

    function Incrementer3() {
        creator = msg.sender;
        iteration = 0;
        whathappened = "constructor executed";
    }

    function increment(int howmuch, int _customvalue) {
        customvalue = _customvalue;
        if (howmuch == 0) {
            iteration = iteration + 1;
            whathappened = "howmuch was zero. Incremented by 1. customvalue also set.";
        } else {
            iteration = iteration + howmuch;
            whathappened = "howmuch was nonzero. Incremented by its value. customvalue also set.";
        }

        return;
    }
    
    function getCustomValue() constant returns (int) {
        return customvalue;
    }
    
    function getWhatHappened() constant returns (string) {
        return whathappened;
    }
    
    function getIteration() constant returns (int) {
        return iteration;
    }
    
    function kill() { 
        if (msg.sender == creator)
            selfdestruct(creator);  // kills this contract and sends remaining funds back to creator
    }
    
}