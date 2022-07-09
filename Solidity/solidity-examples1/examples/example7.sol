pragma solidity >0.4.10;

//the very seventh example
contract Example7 {

    address owner;
    mapping (address => uint) accounts;

    constructor() public {
        owner = msg.sender;
    }

    function mint(address recipient, uint value) public {
        if(msg.sender == owner) {
            accounts[recipient] += value;
        }
    }

    function transfer(address to, uint value)  public{
        if(accounts[msg.sender] >= value) {
            accounts[msg.sender] -= value;
            accounts[to] += value;
        }
    }

    function balance(address addr) public view returns (uint) {
        return accounts[addr];
    }
}
