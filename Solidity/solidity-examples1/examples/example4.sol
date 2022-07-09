pragma solidity >0.4.10;

//the very fourth example
contract Example4 {

    event Message(
        string msg
    );

    struct Account {
        string addr;
        uint amount; //default is 256bits
    }

    uint counter=1;
    mapping (uint => Account) accounts;
    address public owner;

    constructor() public {
        owner = msg.sender;
    }
    function create(string memory addr) public {
        accounts[counter++] = Account(addr, 42);
        owner = msg.sender;
    }

    function get(uint nr) public view returns (string memory) {
        return accounts[nr].addr;
    }
    function getAmount(uint nr) public view returns (uint) {
        return accounts[nr].amount;
    }

    function set(uint nr, string memory addr) public returns (bool) {
        if(owner == msg.sender) {
            accounts[counter++] = Account(addr, nr);
            emit Message("all set!"); //raises the event "Message"
            return true;
        } else {
            return false;
        }
    }
}
