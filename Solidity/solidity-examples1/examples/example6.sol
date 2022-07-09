pragma solidity >0.5.00;

//the very sixth example
contract Example6 {

    mapping (address => mapping (bytes32 => uint)) public stamps;

    function store(bytes32 hash) public {
        stamps[msg.sender][hash] = block.timestamp;
    }
    
    function hashIt(string memory data) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(data));
    }
    
    function verify(address recipient, string memory data) public view returns (uint) {
        return stamps[recipient][keccak256(abi.encodePacked(data))];
    }
}
