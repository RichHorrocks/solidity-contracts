contract Bank is Validee {

  mapping(address => uint) balance;

  // Endow an address with coins.
  function endow(address addr, uint amount) returns (bool) {
    if (!validate()){
      return false;
    }
    balance[addr] += amount;
    return true;
  }

  // Charge an account 'amount' number of coins.
  function charge(address addr, uint amount) returns (bool){
    if (balance[addr] < amount){
      return false;
    }
    if (!validate()){
      return false;
    }
    balance[addr] -= amount;
    return true;
  }

}