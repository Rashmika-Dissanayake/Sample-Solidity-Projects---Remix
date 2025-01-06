// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// import "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    // uint256 public favNum;
    // type visibility name;
    // SimpleStorage public simpleStorage;
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(
        uint256 _simpleStorageIndex,
        uint256 _newSimpleStorageNumeber
    ) public {
        // Address
        // ABI
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[
        //     _simpleStorageIndex
        // ];
        // mySimpleStorage.store(_newSimpleStorageNumeber);
        listOfSimpleStorageContracts[_simpleStorageIndex].store(
            _newSimpleStorageNumeber
        );
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[
        //     _simpleStorageIndex
        // ];
        // return mySimpleStorage.retrieve();
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}
