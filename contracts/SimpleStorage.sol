// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0; //defining solidity compiler version

contract SimpleStorage{
    uint256 favouriteNumber;    // Default initalized to 0
    bool favouriteBool;         // Default initalized to false
    // bytes32 vals;

    struct People {
        uint256 favouriteNumber;
        string name;
    }

    // People[1] public people;     // A static array
    People[] public people;     // A dynamic array

    mapping(string => uint256) public nameToFavouriteNumber;    // HashMap

    // People public person = People({favouriteNumber: 2, name: "Prateek"});

    function store(uint256 _favoriteNumber) public {
        favouriteNumber = _favoriteNumber;
    }

    // view and pure functions does not lead to state change.
    // view functions are used to retrieve some state information from blockchain.
    // pure functions are used to perform some mathematical operations on blockchain.
    // Both view and pure functions are blue colored buttons.
    function retrieve() public view returns (uint256) {
        return favouriteNumber;
    }

    // function retrieve2(uint256 favouriteNumber) public pure {
    //     favouriteNumber + favouriteNumber;
    // }

    // memory means it will only be stored once the function call is made
    // storage means the data will persist in the memory, even after function call is over.
    // String in solidity is actually an object: An array of Bytes
    // Hence, we need to explicitly tell solidity compiler where to store this object in memory.
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        // people.push(People({favouriteNumber: _favouriteNumber, name: _name}));
        people.push(People( _favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}