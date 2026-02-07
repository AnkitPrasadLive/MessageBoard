// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MessageBoard {
    string public message;
    address public owner;

    event messageUpdated(
        address indexed who,
        string oldMessage,
        string newMessage
    );

    constructor(string memory _initial) {
        owner = msg.sender;
        message = _initial;
    }

    function setMessage(string calldata _m) external {
        string memory old = message;
        message = _m;
        emit messageUpdated(msg.sender, old, _m);
    }

    function getMessage() external view returns (string memory) {
        return message;
    }
}
