pragma solidity ^0.4.6;

/*
 * Mapped Structs with Delete-enabled Index
 *
 * Strengths
 *   Random access by unique Id or row number
 *   Assurance of Id uniqueness
 *   Enclose arrays, mapping and structs within each "record"
 *   Count the records
 *   Enumerate the ids
 *   Logically control the size of the active list with delete function
 * 
 * Weaknesses
 *   Marginally increased code complexity
 *   Marginally higher storage costs
 *   Key list is inherently unordered
 */

contract mappedWithUnorderedIndexAndDelete {

  struct EntityStruct {
    uint entityData;
    uint listPointer;
  }

  mapping(address => EntityStruct) public entityStructs;
  address[] public entityList;

  function isEntity(address entityAddress) public constant returns(bool isIndeed) {
    if(entityList.length == 0) return false;
    return (entityList[entityStructs[entityAddress].listPointer] == entityAddress);
  }

  function getEntityCount() public constant returns(uint entityCount) {
    return entityList.length;
  }

  function newEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(isEntity(entityAddress)) throw;
    entityStructs[entityAddress].entityData = entityData;
    entityStructs[entityAddress].listPointer = entityList.push(entityAddress) - 1;
    return true;
  }

  function updateEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(!isEntity(entityAddress)) throw;
    entityStructs[entityAddress].entityData = entityData;
    return true;
  }

  function deleteEntity(address entityAddress) public returns(bool success) {
    if(!isEntity(entityAddress)) throw;
    uint rowToDelete = entityStructs[entityAddress].listPointer;
    address keyToMove   = entityList[entityList.length-1];
    entityList[rowToDelete] = keyToMove;
    entityStructs[keyToMove].listPointer = rowToDelete;
    entityList.length--;
    return true;
  }
}