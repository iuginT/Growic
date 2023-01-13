// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract A {
    address immutable owner;
    uint256 FEE;

    constructor(uint256 _fee) {
        owner = msg.sender;
        FEE = _fee;
    }
}

contract B is A {

    address Owner;

    constructor() A(20) {
        Owner = msg.sender;
    }



}
