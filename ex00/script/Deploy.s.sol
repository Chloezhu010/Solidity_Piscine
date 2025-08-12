// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {HelloEthereum} from "../src/HelloEthereum.sol";

contract Deploy is Script {
    function run() public {
        // local env vars
        uint256 privatekey = vm.envUint("PRIVATE_KEY");
        string memory rpcUrl = vm.envString("SEPOLIA_RPC_URL");
        console.log("Using rpc url: ", rpcUrl);
        console.log("Delopyer address: ", vm.addr(privatekey));

        /* start broadcast */
        vm.startBroadcast(privatekey);
        /* create new instance of the contract
            - "hello sepolia" is the initial message passed to the constructor
            - hellp var stores the deployed contract address and instance
        */
        HelloEthereum hello = new HelloEthereum("Hello Sepolia!");
        console.log("HelloEthereum deployed to:", address(hello));
        console.log("Message:", hello.message());
        /* end broadcast */
        vm.stopBroadcast();
    }
}