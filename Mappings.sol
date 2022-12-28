// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract SecondTask {

    mapping(address => uint) balance;

    function deposit(uint256 amount) external {

        balance[msg.sender] += amount;

    } 

    function checkBalance() external view returns(uint _balance) {
        _balance = balance[msg.sender];
    }

}
