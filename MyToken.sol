// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Token_ is ERC20 {

    address private owner;

    event Mint(address indexed toAddress, uint Amount);

    constructor() ERC20("Berry", "BRY") {
        owner = msg.sender;
        _mint(msg.sender,1000);
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "Function is reserved for owner");
        _;
    }

    function mint(address toAddress) public payable  onlyOwner{
        require(msg.value > 0,"Inproper Input");
         _mint(toAddress, msg.value);
        emit Mint(toAddress, msg.value);
    }

    function burn(uint Amount) public {
        require( Amount > 0,"Inproper Input");
        _burn(msg.sender, Amount);
    }

    function burnFrom(address fromAddress, uint256 Amount) public {
        require( Amount > 0,"Inproper Input");
        address spender = _msgSender();
        _spendAllowance(fromAddress, spender, Amount);
        _burn(fromAddress, Amount);
    }
}
