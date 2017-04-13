pragma solidity ^0.4.6;

/*
 * Mapped Structs with Index
 *
 * Strengths
 *   Random access by unique Id or row number
 *   Assurance of Id uniqueness
 *   Enclose arrays, mappings and structs within each "record"
 *   List maintains order of declaration
 *   Count the records
 *   Enumerate the Ids
 *   "Soft" delete an item by setting a boolean
 *
 * Weaknesses
 *   Uncontrolled growth of the list
 */

contract MappedStructsWithIndex {

  struct EntityStruct {
    uint entityData;
    bool isEntity;
  }

  mapping(address => EntityStruct) public entityStructs;
  address[] public entityList;

  function isEntity(address entityAddress) public constant returns(bool isIndeed) {
      return entityStructs[entityAddress].isEntity;
  }

  function getEntityCount() public constant returns(uint entityCount) {
    return entityList.length;
  }

  function newEntity(address entityAddress, uint entityData) public returns(uint rowNumber) {
    if(isEntity(entityAddress)) throw;
    entityStructs[entityAddress].entityData = entityData;
    entityStructs[entityAddress].isEntity = true;
    return entityList.push(entityAddress) - 1;
  }

  function updateEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(!isEntity(entityAddress)) throw;
    entityStructs[entityAddress].entityData    = entityData;
    return true;
  }
}