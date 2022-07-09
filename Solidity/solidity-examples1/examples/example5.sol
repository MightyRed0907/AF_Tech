pragma solidity >0.4.10;

//the very fifth example
contract Example5 {

    event Message(
        string msg
    );

    mapping (address => uint) accounts; //maps an address to an integer
    
    function getContractBalance() public view returns (uint256){
        return address(this).balance;    
    }

    function deposit() public payable { //payable means that you can send ether to the contract (depositing in the accounts array mantained by the smart contract)
        accounts[msg.sender] += msg.value;
        emit Message("deposit!");
    }
	function balance() public view returns (uint) { //return the balance of your account
        return accounts[msg.sender];
	}
    function withdraw(uint amount) public returns (bool){ //withdraw funds from your account
        if(accounts[msg.sender] >= amount) {
            accounts[msg.sender]-= amount;
            msg.sender.transfer(amount); //transfer the amount from the smart contract to the sender of the msg                
            emit Message("withdraw!");
            return true;
        }
        emit Message("no withdraw!");
        return false;
    }
}
