// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/MessageBoard.sol";

contract DeployScript is Script {
    function run() external {
        vm.startBroadcast();
        new MessageBoard("Hello zkSync!");
        vm.stopBroadcast();
    }
}
