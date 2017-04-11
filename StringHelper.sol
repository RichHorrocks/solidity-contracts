 pragma solidity ^0.4.6;

library StringHelper {

  /*
   * Change string to lowercase.
   */
  function lowercaseString(string self) returns (string) {
    bytes memory a = bytes(self);
    for (uint i = 0; i < a.length; i++) {
      if (uint8(a[i]) >= 0x41 && uint8(a[i]) <= 0x5A) {
        a[i] = byte(uint8(a[i]) + 0x20);
      }
    }

    return string(a);
  }

  /*
   * Check string is in the format: string str = "0-00:03"
   */
  function testStr(string str) constant returns (bool){
    bytes memory b = bytes(str);
    
    if (b.length != 7) {
      return false;
    }

    for (uint i; i < 7; i++){
      if (i == 1) {
        if (b[i] != 45) {
          return false;
        }
      } else if (i == 4) {
        if (b[i] != 58) {
          return false;
        }
      } else if (b[i] < 48 || b[i] > 57) {
        return false;
      }
      
      return true;
    }

}