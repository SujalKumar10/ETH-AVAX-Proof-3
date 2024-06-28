# Berry Token (BRY)

Berry Token (BRY) is a simple ERC20 token implemented using OpenZeppelin's ERC20 library. This smart contract allows the owner to mint new tokens and any token holder to burn their tokens. Additionally, it supports burning tokens from an approved address.

## Features

- Token name: Berry
- Token symbol: BRY
- Minting function restricted to the contract owner.
- Burning function for token holders.
- Burning from an address with allowance.

## Functions

1. **Constructor**: Initializes the contract, sets the deployer as the owner, and mints 1000 BRY tokens to the owner.
   ```bash
    constructor() ERC20("Berry", "BRY") {
        owner = msg.sender;
        _mint(msg.sender,1000);
    }

2. **mint**: Mints new tokens to the specified address.
   ```bash
   function mint(address toAddress) public payable onlyOwner

3. **burn**: Burns a specified amount of the caller's tokens.Requires the amount to be greater than 0.:
   ```bash
   function burn(uint Amount) public

4. **burnFrom**: Burns a specified amount of tokens from the specified address.
   ```bash
   function burnFrom(address fromAddress, uint256 Amount) public

## Variable

1. **owner**: Contains the address of the owner.
   ```solidity
    address private owner;

## Modifier

1. **onlyOwner**: Only let the owner to access that function.
   ```solidity
    modifier onlyOwner(){
        require(owner == msg.sender, "Function is reserved for owner");
        _;
    }
## License

 This project is licensed under the MIT License
