
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// import test framework and my contract
import {Test, console2} from "forge-std/Test.sol";
import {HelloEthereum} from "../src/HelloEthereum.sol";

// create test contract inheriting from Test
contract HelloEthereumTest is Test {
    // declare contract instances and test var
    HelloEthereum public hello;
    address public user1 = address(0x1);
    address public user2 = address(0x2);

    // setup function: run before each test
    function setUp() public {
        hello = new HelloEthereum("Hello, World!"); // deploy fresh contract instance for each test
    }

    // ====== Constructor tests ======
    function test_ConstructorSetInitialMessage() public view {
        // test constructor sets the initial message correctly
        string memory expected = "Hello, World!";
        string memory actual = hello.message();
        assertEq(actual, expected, "Initial message should be set correctly");
    }
}
