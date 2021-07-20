// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PassCulture {
    address private owner;

    struct User {
        bool exists;
        uint8 balance;
    }

    struct Admin {
        bool exists;
    }

    struct Prestataire {
        bool exists;
        uint8 balance;
    }

    mapping(address=>User) userMapping;
    mapping(address=>Admin) adminMapping;
    mapping(address=>User) prestataireMapping;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    modifier onlyAdmin(address adminAddress) {
        require(adminMapping[adminAddress].exists == true, "Only admin");
        _;
    }

    modifier userNotExisting(address userAddress) {
        require(userMapping[userAddress].exists == false, "User already exists");
        _;
    }

    modifier userExisting(address userAddress) {
        require(userMapping[userAddress].exists == true);
        _;
    }

    modifier adminNotExisting(address adminAddress) {
        require(adminMapping[adminAddress].exists == false);
        _;
    }

    modifier prestataireNotExisting(address prestataireAddress) {
        require(adminMapping[prestataireAddress].exists == false);
        _;
    }

    modifier prestataireExisting(address prestataireAddress) {
        require(adminMapping[prestataireAddress].exists == true);
        _;
    }

    modifier balanceSufficent(address userAddress, uint8 amount) {
        require(userMapping[userAddress].balance >= amount);
        _;
    }

    function addAdmin(address newAdmin) public onlyOwner adminNotExisting(newAdmin) {
        userMapping[newAdmin].exists = true;
    }

    function addUser(address newUser) public onlyAdmin(msg.sender) userNotExisting(newUser) {
        userMapping[newUser].exists = true;
        userMapping[newUser].balance = 100;
    }

    function addPrestataire(address newPrestataire) public onlyAdmin(msg.sender) prestataireNotExisting(newPrestataire) {
        prestataireMapping[newPrestataire].exists = true;
        prestataireMapping[newPrestataire].balance = 0;
    }

    function transfer (address prestataireAddress, uint8 amount) public userExisting(msg.sender) balanceSufficent(msg.sender, amount) returns(uint8) {
        userMapping[msg.sender].balance -= amount;
        prestataireMapping[prestataireAddress].balance += amount;
        return userMapping[msg.sender].balance;
    }
}
