// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SimpleStorage {
    uint256 favouriteNumber; 

    //New object
    struct People {
        string name;
        uint256 favouriteNumber;
    }

    //Dynamic array of people, use number to fix array
    People[] public people;
    mapping(string => uint256) public nameToFavouriteNumber;

    //two ways to store data: Memory/storage. (Memory:Only stored for duration of function, Storage: Data persists)
    function addPerson(string memory _name, uint256 _favouriteNumber) public{
        //Push same as js (append)
        people.push(People( _name, _favouriteNumber));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    function store(uint256 _favouriteNumber) public{
        favouriteNumber = _favouriteNumber;
    }

    // view(No transaction fees as no state change)
    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }

    //pure (No transaction fees, used for math)
    function simpleAddition(uint256 _favouriteNumber) public pure returns(uint256){
        return _favouriteNumber + _favouriteNumber;
    }
}