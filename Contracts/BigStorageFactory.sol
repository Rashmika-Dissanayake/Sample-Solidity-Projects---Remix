// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage, Person} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function bsfStore(
        uint256 _simpleStorageIndex,
        uint256 _newSimpleStorageNumeber
    ) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].store(
            _newSimpleStorageNumeber
        );
    }

    function bsfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }

    function bsfAddPerson(uint256 _simpleStorageIndex, string memory _name, uint256 _favoriteNumber) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].addPerson(
            _name, _favoriteNumber
        );
    }

    function bsfGetListOfPeople(uint256 _simpleStorageIndex, uint256 _peopleIndex) public view returns(Person memory){
        return listOfSimpleStorageContracts[_simpleStorageIndex].getListOfPeople(_peopleIndex);
    }

    function bsfGetNameToFavoriteNumber(uint256 _simpleStorageIndex, string memory _name) public view returns(uint256){
        return listOfSimpleStorageContracts[_simpleStorageIndex].getNameToFavoriteNumber(_name);
    }
}
