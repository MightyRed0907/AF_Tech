pragma solidity >0.4.10;


//the very 8th example
//this contract implements proof of ownership :) or at least it tries
contract Example8 {

    address owner;
    
    event Stored(
    );

    struct Document {
        address ownerAddress;
        string name;
        uint256 timestamp;
        uint256 modified;
    }
    mapping (bytes32 => Document) public documents; //every file hashed will belong to a address using the data type 32 bytes, size of a sha256 hash. 
    mapping (uint => bytes32) public hashList; //every file hashed will belong to a address using the data type 32 bytes, size of a sha256 hash. 
    uint public documentCount = 0;

    constructor() public {
        owner = msg.sender;
    }

    function amIMaster() public view returns (string memory) {
        if (msg.sender == owner) {
            return "Yes, master";
        }
        return "No";
    }
    function getBalance() public view returns (uint) {
        return msg.sender.balance;
    }

    function amIOwner(string memory file) public view returns (bool) {
        bytes32 fileHash = keccak256(abi.encodePacked(file));

        if (msg.sender == documents[fileHash].ownerAddress) {
            return true;
        }
        return false;
    }
    function getHash(string memory file) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(file));
    }

    function changeOwner(string memory file,address newOwner) public returns (bool) {
        if (amIOwner(file)) {
             bytes32 fileHash = keccak256(abi.encodePacked(file));
             documents[fileHash].ownerAddress = newOwner;
             documents[fileHash].modified = now;
             emit Stored();
             return true;
        }
        return false;
    }

    function store(string memory file,string memory name) public returns (bytes32) {
        bytes32 fileHash = keccak256(abi.encodePacked(file));
        if (documents[fileHash].ownerAddress == 0x0000000000000000000000000000000000000000) {
            documents[fileHash].ownerAddress = msg.sender;  //can save
            documents[fileHash].name = name;
            documents[fileHash].timestamp = now;
            hashList[documentCount] = fileHash;
            documentCount += 1;
            emit Stored();
            return fileHash;
        }
    }

    function getDocumentCount() public view returns (uint) {
        return documentCount;
    }

    function getDocument(uint index) public view returns (bytes32 fileHash, address ownerAddress, string memory name, uint256 timestamp) {
        require(index > documentCount);

        fileHash = hashList[index];
        ownerAddress = documents[fileHash].ownerAddress;
        name = documents[fileHash].name;
        timestamp = documents[fileHash].timestamp;

    }

    function hasOwner(string memory file) public view returns (address) {
        return documents[keccak256(abi.encodePacked(file))].ownerAddress;
    }
}
