// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    uint256 private _maxSupply;

    struct Item {
        string name;
        uint256 price;
    }

    mapping(string => Item) private _items;

    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed burner, uint256 amount);
    event Buy(address indexed buyer, string item, uint256 price);

    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply,
        uint256 maxSupply
    ) ERC20(name, symbol) {
        require(initialSupply <= maxSupply, "Initial supply must be less than or equal to max supply");
        _mint(msg.sender, initialSupply);
        _maxSupply = maxSupply;

        _items["Cable"] = Item("Cable", 20);
        _items["Battery"] = Item("Battery", 150);
        _items["Phone"] = Item("Phone", 250);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= _maxSupply, "Exceeds maximum supply");
        _mint(to, amount);
        emit Mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }

    function transfer(address to, uint256 value) public override returns (bool) {
        require(totalSupply() + value <= _maxSupply, "Exceeds maximum supply");
        return super.transfer(to, value);
    }

    function buy(string memory itemName) public {
        Item memory item = _items[itemName];
        require(bytes(item.name).length > 0, "Item not found");
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance");
        assert(msg.sender != owner());   

        if (keccak256(abi.encodePacked(itemName)) == keccak256(abi.encodePacked("Cable"))) {
            burn(item.price);
        } else if (keccak256(abi.encodePacked(itemName)) == keccak256(abi.encodePacked("Battery"))) {
            burn(item.price);
        } else if (keccak256(abi.encodePacked(itemName)) == keccak256(abi.encodePacked("Phone"))) {
            burn(item.price);
        } else {
            revert("Invalid item");
        }

        emit Buy(msg.sender, itemName, item.price);
    }
}
