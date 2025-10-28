// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Complaints {
    struct Complaint {
        uint256 id;
        string name;
        string complaint;
        uint256 timestamp;
        address submitter;
    }
    
    Complaint[] public complaints;
    address public admin;
    
    constructor() {
        admin = msg.sender;
    }
    
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this");
        _;
    }

    function addComplaint(string memory _name, string memory _complaint) public {
        complaints.push(Complaint({
            id: complaints.length,
            name: _name,
            complaint: _complaint,
            timestamp: block.timestamp,
            submitter: msg.sender
        }));
    }
    
    function getComplaintByName(string memory _name) public view returns (string memory, string memory) {
        for (uint i = 0; i < complaints.length; i++) {
            if (keccak256(abi.encodePacked(complaints[i].name)) == keccak256(abi.encodePacked(_name))) {
                return (complaints[i].name, complaints[i].complaint);
            }
        }
        revert("Complaint not found");
    }
    
    function getAllComplaints() public view returns (Complaint[] memory) {
        return complaints;
    }
    
    function getTotalComplaints() public view returns (uint) {
        return complaints.length;
    }
    
    function getComplaintById(uint256 _id) public view returns (Complaint memory) {
        require(_id < complaints.length, "Invalid complaint ID");
        return complaints[_id];
    }
}