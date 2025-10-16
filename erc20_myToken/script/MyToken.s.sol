// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";
import {console} from "forge-std/console.sol";

contract MyTokenScript is Script {
    MyToken public token;
    string public constant TOKEN_NAME = "MyToken";
    string public constant TOKEN_SYMBOL = "MTK";
    uint256 public constant INITIAL_SUPPLY = 1_000_000 * 10**18; // 1 million tokens with 18 decimal

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        token = new MyToken(TOKEN_NAME, TOKEN_SYMBOL, INITIAL_SUPPLY);

        vm.stopBroadcast();

        // log deployment
        console.log("=======================");
        console.log("MyToken deployed to: ", address(token));
        console.log("Token name: ", token.name());
        console.log("Token symbol: ", token.symbol());
        console.log("Total supply: ", token.totalSupply());
        console.log("Deployer/ Owner: ", token.owner());
    }
}

/*
forge script script/DeployMyToken.s.sol:DeployMyToken \
    --rpc-url $SEPOLIA_RPC_URL \
    --private-key $PRIVATE_KEY \
    --broadcast \
    --verify \
    -vvvv
*/