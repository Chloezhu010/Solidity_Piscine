// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract HelloEthereum {
    // public string
    string public message;

    // constructor to set initial message
    constructor(string memory _initmessage) {
        message = _initmessage;
    }
    
    // function to update message
    function setMessage(string calldata _newMessage) public {
        message = _newMessage;
    }
}