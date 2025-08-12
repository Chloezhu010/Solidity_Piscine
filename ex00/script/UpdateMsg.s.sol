// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {HelloEthereum} from "../src/HelloEthereum.sol";

contract UpdateMsg is Script {
    function run() public {
        // local env vars
        uint256 privatekey = vm.envUint("PRIVATE_KEY");
        string memory rpcUrl = vm.envString("SEPOLIA_RPC_URL");
        address contractAddress = vm.envAddress("CONTRACT_ADDRESS");
        console.log("Using rpc url: ", rpcUrl);
        console.log("Contract address: ", contractAddress);
        
        HelloEthereum hello = HelloEthereum(contractAddress); // cast to HelloEthereum type

        // read current message
        string memory currentMessage = hello.message();
        console.log("Current message: ", currentMessage);

        vm.startBroadcast(privatekey); // without pk can only work on local anvil, not on sepolia
        // update the message
        hello.setMessage("Hello Foundry!");
        // read the new msg
        console.log("New message: ", hello.message());
        vm.stopBroadcast();
    }
}