# AVAX Smart Contract

## Overview
This repository contains a simple Solidity smart contract named ExampleContract. The contract showcases basic functionality, including state variables, a constructor, functions with modifiers, and examples of `require`, `assert`, and `revert` statements.

## Contract Details

### State Variables

- `owner`: The address of the contract owner.
- `minValue`: A public variable representing the minimum value, initially set to 10.

### Constructor

- Initializes the contract by setting the deployer's address as the owner.

### Functions

#### `setMinValue(uint _minValue) public onlyOwner`

- Allows the owner to set the minimum value.
- Uses the `onlyOwner` modifier to restrict access to the owner.
- Uses `require` to check if the provided minimum value is greater than zero.

#### `assertExample(uint x, uint y) public pure returns (uint)`

- Demonstrates the use of `assert` to check if two values are equal.
- Returns the sum of `x` and `y` if the assertion passes.

#### `revertExample() public pure returns (bool)`

- Illustrates a function intentionally reverting a transaction with a custom error message.

### Modifier

#### `onlyOwner`

- Restricts access to functions, allowing only the owner to call them.

## Usage

Deploy the contract to an Ethereum-compatible blockchain using a tool like Remix or Truffle.

## Author
Donato, Zeno 202011124@fit.edu.ph
