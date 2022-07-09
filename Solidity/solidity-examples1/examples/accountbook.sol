pragma solidity ^0.4.10;

//CAS 2018 Smart Contract Example
contract Accountbook {

    function strConcat(string _a, string _b, string _c, string _d, string _e) internal pure returns (string){
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        bytes memory _be = bytes(_e);
        string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
        bytes memory babcde = bytes(abcde);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
        for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
        for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
        for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
        for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
        return string(babcde);
    }

    function strConcat(string _a, string _b, string _c, string _d) internal pure returns (string) {
        return strConcat(_a, _b, _c, _d, "");
    }

    function strConcat(string _a, string _b, string _c) internal pure returns (string) {
        return strConcat(_a, _b, _c, "", "");
    }

    function strConcat(string _a, string _b) internal pure returns (string) {
        return strConcat(_a, _b, "", "", "");
    }

    address owner;
    mapping (uint => string) accounts;
    uint accountCount = 0;
    
    function teste() internal {
        owner = msg.sender;
    }
    function register(string end) public returns (uint) {
        accounts[accountCount] = end;
        accountCount++;
        return accountCount-1;

    }
    function getAccountCount() public view returns (uint) {
        return accountCount;
    }
   function getAllAccounts() public view returns (string)
    {
        uint i = 0;
        string memory retorno;
        for (i = 0; i < accountCount; i++)
        {
            retorno = strConcat(retorno,",",accounts[i]);
        }
        return retorno;
    }
    function getAccount(uint n) public constant returns (string) {
        return accounts[n];
    }
}