// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    address public owner;
    uint public minValue = 10;

    constructor() {
        owner = msg.sender;
    }

    function setMinValue(uint _minValue) public onlyOwner {
        // Using require() to check a condition
        require(_minValue > 0, "Minimum value must be greater than zero");
        minValue = _minValue;
    }

  function assertExample(uint x, uint y) public pure returns (uint) {
        assert(x == y);
        return x + y;
    }

    function revertExample() public pure returns (bool) {
        revert("This transaction has been intentionally reverted");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
}
