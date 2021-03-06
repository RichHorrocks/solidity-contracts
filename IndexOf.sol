pragma solidity ^0.4.6;

contract IndexOf {

    address creator;

    function IndexOf() {
        creator = msg.sender;
    }
    
    int whatwastheval = -10; 
    
    function indexOf(string _a, string _b) returns (int) {
        bytes memory a = bytes(_a);  
        bytes memory b = bytes(_b);
       
        if (a.length < 1 || b.length < 1 || (b.length > a.length)) {
            whatwastheval = -1;
            return -1;
        } else if (a.length > (2**128 -1)) {
            whatwastheval = -1;
            return -1;                                  
        } else {
            uint subindex = 0;
            for (uint i = 0; i < a.length; i ++) {
                if (a[i] == b[0]) {
                    subindex = 1;
                    while (subindex < b.length && 
                           (i + subindex) < a.length && 
                           a[i + subindex] == b[subindex]) {
                        subindex++;
                    }
                    
                    if (subindex == b.length) { 
                        whatwastheval = int(i);
                        return int(i);
                    }
                }
            }
            
            whatwastheval = -1;
            return -1;
        }   
    }
    
    function whatWasTheVal() constant returns (int) {
        return whatwastheval;
    }
    
    function kill() { 
        if (msg.sender == creator) {
            selfdestruct(creator);
        }
    }
}