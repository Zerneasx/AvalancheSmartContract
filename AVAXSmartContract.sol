// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function deposit(uint256 amount) public payable {
        uint256 newBalance = balance + amount;
        assert(newBalance == 1000); 
        balance = newBalance;
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(amount > 0, "The amount must be greater than 0");
        require(balance >= amount, "Insufficient funds");
        if (amount <= 250) {
            revert("Revert condition: amount should not be less than or equal to 250");
        }

        uint256 newBalance = balance - amount;
        assert(newBalance <= balance); 
        balance = newBalance;
    }
}
