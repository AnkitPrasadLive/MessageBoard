// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/MessageBoard.sol";

contract MessageBoardTest is Test {
    MessageBoard public board;

    address USER = address(0xBEEF);

    function setUp() public {
        // Deploy the contract before each test
        board = new MessageBoard("Hello blockchain!");
    }

    function testInitialMessage() public {
        // The initial message should match the constructor input
        string memory msgOnChain = board.getMessage();
        assertEq(msgOnChain, "Hello blockchain!");
    }

    function testSetMessage() public {
        // Simulate a different user sending a transaction
        vm.prank(USER);
        board.setMessage("gm wagmi!");

        // Verify message was updated
        string memory msgOnChain = board.getMessage();
        assertEq(msgOnChain, "gm wagmi!");
    }

    function testEmitEvent() public {
        // Expect an event to be emitted when message changes
        vm.expectEmit(true, false, false, true);
        emit MessageBoard.messageUpdated(address(this), "Hello blockchain!", "updated!");

        board.setMessage("updated!");
    }

    function testOwnerIsDeployer() public {
        assertEq(board.owner(), address(this));
    }

    function testOnlyUpdatesWhenCalled() public {
        // Deploy a fresh board
        MessageBoard newBoard = new MessageBoard("start");
        // Call setMessage
        newBoard.setMessage("next");
        assertEq(newBoard.getMessage(), "next");
    }
}
