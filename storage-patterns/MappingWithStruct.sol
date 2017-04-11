pragma solidity ^0.4.6;

/*
 * Mapping with Struct
 *
 * Strengths
 *   Random access by unique Id
 *   Assurance of Id Uniqueness
 *   Enclose arrays, mappings, structs within each "record"
 * 
 * Weaknesses
 *   Unable to enumerate the keys
 *   Unable to count the keys
 *   Needs a manual check to distinguish a default from an explicitly "all 0" record
 */

contract mappingWithStruct {

  struct EntityStruct {
    uint entityData;
    bool isEntity;
  }

  mapping (address => EntityStruct) public entityStructs;

  function isEntity(address entityAddress) public constant returns(bool isIndeed) {
    return entityStructs[entityAddress].isEntity;
  }

  function newEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(isEntity(entityAddress)) throw; 
    entityStructs[entityAddress].entityData = entityData;
    entityStructs[entityAddress].isEntity = true;
    return true;
  }

  function deleteEntity(address entityAddress) public returns(bool success) {
    if(!isEntity(entityAddress)) throw;
    entityStructs[entityAddress].isEntity = false;
    return true;
  }

  function updateEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(!isEntity(entityAddress)) throw;
    entityStructs[entityAddress].entityData = entityData;
    return true;
  }
}