pragma solidity ^0.4.6;

/*
 * Simple List Using Array
 *
 * Strengths
 *   Reliably chronological order
 *   Provides a count
 *   Random access by Row Number (not Id)
 *
 * Weaknesses
 *   No random access by Id
 *   No assurance of uniqueness
 *   No check for duplicates
 *   Uncontrolled growth of the list
 */

contract simpleList {

  struct EntityStruct {
    address entityAddress;
    uint entityData;
    // more fields
  }

  EntityStruct[] public entityStructs;

  function newEntity(address entityAddress, 
                     uint entityData) public returns(uint rowNumber) {
    EntityStruct memory newEntity;
    newEntity.entityAddress = entityAddress;
    newEntity.entityData    = entityData;
    return entityStructs.push(newEntity) - 1;
  }

  function getEntityCount() public constant returns(uint entityCount) {
    return entityStructs.length;
  }
}