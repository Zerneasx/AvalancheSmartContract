# Simple Bank Wallet

## Overview
This repository contains a simple Solidity smart contract named SimpleWallet. The contract serves as a basic wallet, allowing deposits and withdrawals, with ownership control to ensure secure operations. It includes examples of using modifiers, assertions, and revert statements.

## Contract Details

### State Variables

- `balance`: The current balance of the wallet.

### Constructor

- Initializes the contract by setting the deployer's address as the owner.

### Functions

#### `deposit(uint256 amount) public payable`

- Allows anyone to deposit funds into the wallet.
- Demonstrates the use of `assert` to ensure the new balance is a specific value (in this case, 1000).

#### `withdraw(uint256 amount) public onlyOwner`

- Allows the owner to withdraw funds from the wallet.
- Uses the `onlyOwner` modifier to restrict access to the owner.
- Requires the withdrawal amount to be greater than zero and checks for sufficient funds.
- Intentionally reverts the transaction with a custom error message if the withdrawal amount is less than or equal to 250.

## Usage

Deploy the contract to an Ethereum-compatible blockchain using a tool like Remix or Truffle.

## Author
Donato, Zeno
Email: 202011124@fit.edu.ph
```
