// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract SecondTask {

    struct User {
        string name;
        uint8 age;
    }

    mapping(address => uint) balance;
    mapping(address => User) users;

    function setUserDetails(string calldata name, uint8 age) external {
        users[msg.sender] = (User(name, age));
    }

    function getUserDetail() public view returns(User memory){
        return users[msg.sender];

    }

    function deposit(uint256 amount) external {

        balance[msg.sender] += amount;

    } 

    function checkBalance() external view returns(uint _balance) {
        _balance = balance[msg.sender];
    }

}
