contract TwoDimensionArray {

    address creator;
    uint8 arraylength = 10;
    uint8[10][10] integers;

    function TwoDimensionArray() {
        creator = msg.sender;
        uint8 x = 0;
        uint8 y = 0;
        while (y < arraylength) {
            x = 0;
            while(x < arraylength) {
                integers[x][y] = arraylength * y + x; // row 0: 0, 1   row 1: 2, 3
                x++;
            }
            y++;
        }
    }
    
    function getValue(uint8 x, uint8 y) constant returns (uint8) {
        return integers[x][y];
    }
    
    function kill() { 
        if (msg.sender == creator) {
            selfdestruct(creator);
        }
    }
}