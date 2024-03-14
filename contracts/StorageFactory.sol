// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage{       // Inherits all function and variables of SimpleStorage contract.
    
    SimpleStorage[] public simpleStorageArray;

    // This function creates an array to store all our contracts.
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);        
    }

    // This function stores a number to one of the contracts in the contract array.
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Everytime, we interact with the contract, we need two things:
        // The address of the contract.
        // The Application Binary Interface (ABI).
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }

    // This function return the number stored on one of the smart contracts in the contract array,
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }

}