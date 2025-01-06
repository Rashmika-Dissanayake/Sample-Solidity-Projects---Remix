// I'm a comment!
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

struct Person {
    uint256 favoriteNumber;
    string name;
}

contract SimpleStorage {
    uint256 myFavoriteNumber;

    // uint256[] public anArray;
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function getListOfPeople(uint256 _peopleIndex)
        public
        view
        returns (Person memory)
    {
        return listOfPeople[_peopleIndex];
    }

    function getNameToFavoriteNumber(string memory _name)
        public
        view
        returns (uint256)
    {
        return nameToFavoriteNumber[_name];
    }
}

contract SimpleStorage2 {}

contract SimpleStorage3 {}

contract SimpleStorage4 {}
