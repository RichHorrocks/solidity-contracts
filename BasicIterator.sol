contract BasicIterator {

    address creator;
    uint8[10] integers;

    function BasicIterator() {
        creator = msg.sender;
        uint8 x = 0;
        while (x < integers.length) {
            integers[x] = x;
            x++;
        }
    }
    
    function getSum() constant returns (uint) {
        uint8 sum = 0;
        uint8 x = 0;
        while (x < integers.length) {
            sum = sum + integers[x];
            x++;
        }
        return sum;
    }
    
    function kill() { 
        if (msg.sender == creator) {
            selfdestruct(creator);
        }
    }
}