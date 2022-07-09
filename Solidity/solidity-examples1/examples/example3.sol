pragma solidity >0.4.10;

//the very third example
contract Example3 {
    struct Account {
        string addr;
        uint amount; //default is 256bits
    } //creates a structure

    uint counter=1;
    mapping (uint => Account) accounts;
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }

    function create(string memory addr) public { //creates the first object in the array and set your address as the owner
        accounts[counter++] = Account(addr, 42);
        owner = msg.sender;
    }

    function get(uint nr) public view returns (string memory) { //returns the address of the position "nr"
        return accounts[nr].addr;
    }
    
    function getAmount(uint nr) public view returns (uint) { //returns the amount saved for the position "nr"
        return accounts[nr].amount;
    }

    function set(uint nr, string memory addr) public returns (bool) { //sets an amount for an address (only possible if the sender of the msg is the owner)
        if(owner == msg.sender) {
            accounts[counter++] = Account(addr, nr);
            return true;
        } else {
            return false;
        }
    }
}
