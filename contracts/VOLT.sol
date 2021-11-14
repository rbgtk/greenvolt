// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Burnable.sol";

import "https://github.com/Dexaran/ERC223-token-standard/blob/development/token/ERC223/IERC223.sol";
import "https://github.com/Dexaran/ERC223-token-standard/blob/development/token/ERC223/IERC223Recipient.sol";
import "https://github.com/Dexaran/ERC223-token-standard/blob/development/utils/Address.sol";

import "./IREC.sol";

contract VOLT is IERC223Recipient, ERC20Burnable {
    
    address private constant _IREC_ADDRESS = 0x684da8C1028805B519af20d11E1780B84800d65c;
    
    uint toburn = 0;
    uint totalburned = 0;
    
    mapping(address => uint) burned;
    
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}
    
    function tokenReceived(address _from, uint _value, bytes memory _data) public override virtual {
        _mint(_from, 1000000 ether * _value);
    }
    
    function burn(uint amount) public override {
        _burn(msg.sender, amount);
        
        burned[msg.sender] += amount;
        
        toburn += amount;
        totalburned += amount;
        
        while (toburn >= 1000000) {
            toburn -= 1000000;
            IREC(_IREC_ADDRESS).burn(1);
        }
    }
    
    
}
