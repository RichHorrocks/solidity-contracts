 pragma solidity ^0.4.6;

library StringHelper {
  function lowercaseString(string self) returns (string) {
    bytes memory a = bytes(self);
    for (uint i = 0; i < a.length; i++) {
      if (uint8(a[i]) >= 0x41 && uint8(a[i]) <= 0x5A) {
        a[i] = byte(uint8(a[i]) + 0x20);
      }
    }

    return string(a);
  }
}