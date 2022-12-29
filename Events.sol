
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract SecondTask {

    struct User {
        string name;
        uint8 age;
    }

    error AmountToSmall();

    event FundsDeposited(address user, uint256 amount);
    event ProfileUpdated(address user);


    address payable owner;
    uint256 private Fee;

    mapping(address => uint) balance;
    mapping(address => User) users;

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    modifier alreadyDeposit() {
        require(balance[msg.sender] > 0);
        _;
    }

    modifier value(uint256 _amount) {
        if(_amount < Fee){
            revert AmountToSmall();
            
        }
        _;
    }

    constructor(uint256 _fee) {
        owner = payable(msg.sender); // not sure about the owner so I made sure to set him here
        Fee = _fee;
    }

    function setUserDetails(string calldata name, uint8 age) external {
        users[msg.sender] = (User(name, age));
        emit ProfileUpdated(msg.sender);
    }

    function getUserDetail() public view returns(User memory){
        return users[msg.sender];

    }

    function deposit(uint256 amount) external {

        balance[msg.sender] += amount;
        emit FundsDeposited(msg.sender, amount);
    } 

    function withdraw() external onlyOwner {
        (bool success, ) = payable(owner).call{value: address(this).balance}('');
        require(success);
    }

    function addFund(uint256 _amount) external alreadyDeposit value(_amount) {
            balance[msg.sender] += _amount;
    }

    function checkBalance() external view returns(uint _balance) {
        _balance = balance[msg.sender];
    }

}
