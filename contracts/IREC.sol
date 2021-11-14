// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/Dexaran/ERC223-token-standard/blob/development/token/ERC223/IERC223.sol";
import "https://github.com/Dexaran/ERC223-token-standard/blob/development/token/ERC223/IERC223Recipient.sol";
import "https://github.com/Dexaran/ERC223-token-standard/blob/development/utils/Address.sol";

/**
 * @title Reference implementation of the ERC223 standard token.
 */
contract IREC is IERC223 {

    string  private _name;
    string  private _symbol;
    uint8   private _decimals;
    uint256 private _totalSupply;
    address private _contractOwner;
    
    mapping(address => bool)   private _issuers; // List of IREC issuers.
    mapping(address => uint256) public balances; // List of user balances.
    
    modifier onlyOwner {
        require(msg.sender == _contractOwner, "Only contract owner can execute");
        _;
    }
    
    modifier onlyIssuer {
        require(_issuers[msg.sender], "Only issuers can execute");
        _;
    }

    /**
     * @dev Sets the values for {name} and {symbol}, initializes {decimals} with
     * a default value of 18.
     *
     * To select a different value for {decimals}, use {_setupDecimals}.
     *
     * All three of these values are immutable: they can only be set once during
     * construction.
     */
     
    constructor(string memory new_name, string memory new_symbol, uint8 new_decimals)
    {
        _name     = new_name;
        _symbol   = new_symbol;
        _decimals = new_decimals;
        
        _contractOwner = msg.sender;
    }
    
    function standard() public pure override returns (string memory) {
        return "erc223";
    }
    
    function name() public view override returns (string memory)     {
        return _name;
    }

    function symbol() public view override returns (string memory) {
        return _symbol;
    }
    
    function decimals() public view override returns (uint8) {
        return _decimals;
    }
    
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }
    
    function contractOwner() public view returns (address) {
        return _contractOwner;
    }
    
    function setIssuer(address _issuer, bool _canIssue) public onlyOwner {
        _issuers[_issuer] = _canIssue;
    }
    
    function mint(address _to, uint _amount) public onlyIssuer {
        balances[_to] += _amount;
        _totalSupply += _amount;
    }
    
    function balanceOf(address _owner) public view override returns (uint256) {
        return balances[_owner];
    }
    
    function transfer(address _to, uint _value, bytes calldata _data) public override returns (bool success) {
        // Standard function transfer similar to ERC20 transfer with no _data .
        // Added due to backwards compatibility reasons .
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        if(Address.isContract(_to)) {
            IERC223Recipient(_to).tokenReceived(msg.sender, _value, _data);
        }
        emit Transfer(msg.sender, _to, _value);
        emit TransferData(_data);
        return true;
    }
    
    function transfer(address _to, uint _value) public override returns (bool success) {
        bytes memory _empty = hex"00000000";
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        if(Address.isContract(_to)) {
            IERC223Recipient(_to).tokenReceived(msg.sender, _value, _empty);
        }
        emit Transfer(msg.sender, _to, _value);
        emit TransferData(_empty);
        return true;
    }
    
    function burn(uint _amount) public {
        balances[msg.sender] -= _amount;
        _totalSupply -= _amount;
    }
}
