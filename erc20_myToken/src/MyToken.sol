// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// implement ERC20 with mint/burn

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    // customer error (gas efficient)
    error ZeroAddress();
    error ZeroAmount();
    error InsufficientBalance(uint256 requested, uint256 available);
    error InsufficientAllowance(uint256 requested, uint256 available);

    // constructor 
    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) ERC20(name, symbol) Ownable(msg.sender){
        _mint(msg.sender, initialSupply);
    }

    // mint new tokens (only owner)
    function mint(address to, uint256 amount) public onlyOwner {
        if (to == address(0)) {
            revert ZeroAddress();
        }
        if (amount == 0){
            revert ZeroAmount();
        }
        _mint(to, amount);
    }

    // burn tokens from caller's balance
    function burn(uint256 amount) public {
        if (amount == 0){
            revert ZeroAmount();
        }
        if (balanceOf(msg.sender) < amount){
            revert InsufficientBalance(amount, balanceOf(msg.sender));
        }
        _burn(msg.sender, amount);
    }

    // burn token from another account (requires allowance)
    // reverse of transferFrom
    function burnFrom(address from, uint256 amount) public {
        if (amount == 0){
            revert ZeroAmount();
        }
        if (balanceOf(from) < amount) {
            revert InsufficientBalance(amount, balanceOf(from));
        }
        uint256 currentAllowance = allowance(from, msg.sender);
        if (currentAllowance < amount) {
            revert InsufficientAllowance(amount, currentAllowance);
        }
        _approve(from, msg.sender, currentAllowance - amount);
        _burn(from, amount);
    }
}