# MyToken

## Overview

This repository contains a Solidity smart contract named MyToken. The contract is an ERC-20 token that extends the OpenZeppelin ERC-20 implementation and includes additional functionality for minting, burning, and buying items. It also incorporates an ownership model.

## Contract Details
### State Variables

- `_maxSupply`: The maximum supply limit for the token.

### Struct

- `Item`: A structure representing an item with a name and price.

### Mapping

- `_items`: A mapping associating item names with their details.

### Events

- `Mint(address indexed to, uint256 amount)`: Triggered when new tokens are minted.
- `Burn(address indexed burner, uint256 amount)`: Triggered when tokens are burned.
- `Buy(address indexed buyer, string item, uint256 price)`: Triggered when an item is bought.

### Constructor

- Initializes the token with a name, symbol, initial supply, and maximum supply.
- Predefines prices for three items: "Cable", "Battery", and "Phone".

### Functions

#### `mint(address to, uint256 amount) public onlyOwner`

- Allows the owner to mint new tokens.
- Emits a `Mint` event.

#### `burn(uint256 amount) public`

- Allows any address to burn a specified amount of tokens.
- Emits a `Burn` event.

#### `transfer(address to, uint256 value) public override returns (bool)`

- Overrides the transfer function from ERC20 to add transfer functionality with supply limit checks.

#### `buy(string memory itemName) public`

- Allows users to buy items with their tokens.
- Emits a `Buy` event.
- Handles item-specific burning and checks for item validity.

## Usage

Deploy the contract to an Ethereum-compatible blockchain using a tool like Remix or Truffle.

## Author
Donato, Zeno Gilrence G.
202011124@fit.edu.ph
