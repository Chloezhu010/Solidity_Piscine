// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/MyToken.sol";
import {console} from "forge-std/console.sol";

contract MyTokenTest is Test {
    MyToken token;
    address owner;
    address alice;
    address bob;
    address charlie;

    // initial 1000 tokens
    uint256 constant INITIAL_SUPPLY = 1000 * 10**18;

    function setUp() public {
        // setup address
        owner = address(this);
        alice = address(0x1);
        bob = address(0x2);
        charlie = address(0x3);

        // create new instance, with name, symbol, init supply
        token = new MyToken("MyToken", "MTK", INITIAL_SUPPLY);

        // label address for better trace output
        vm.label(owner, "Owner");
        vm.label(alice, "Alice");
        vm.label(bob, "Bob");
        vm.label(charlie, "Charlie");
    }

    // ========= Basic Tests ===========
    function testInitialSupply() public view {
        assertEq(token.totalSupply(), INITIAL_SUPPLY);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY);
    }

    function testName() public view {
        assertEq(token.name(), "MyToken");
        assertEq(token.symbol(), "MTK");
        assertEq(token.decimals(), 18);
    }

    // ========= Transfer Tests ===========
    function testTransfer() public {
        uint256 amount = 10 *10*18;
        bool success = token.transfer(alice, amount);
        
        assertTrue(success);
        assertEq(token.balanceOf(alice), amount);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY - amount);
    }

    function testTransferEmitsEvent() public {
        uint256 amount = 10 *10*18;

        vm.expectEmit(true, true, false, true); // tell foundry start watching for events
        emit IERC20.Transfer(owner, alice, amount); // declare what event expected
        token.transfer(alice, amount); // execute the function that emits event
    }

    function test_RevertWhen_InsufficientBalance() public {
        uint256 amount = 1 *10*18;
        vm.prank(alice);
        vm.expectRevert();
        token.transfer(bob, amount);
    }
    
    function testTransferToZeroAddress() public {
        vm.expectRevert();
        token.transfer(address(0), 1);
    }
    
    // ============ Approve & Allowance Tests ============
    
    function testApprove() public {
        uint256 amount = 100 * 10**18;

        bool approve = token.approve(alice, amount);
        assertTrue(approve);
        assertEq(token.allowance(owner, alice), amount);
    }
    
    function testApproveEmitsEvent() public {
        uint256 amount = 100 * 10**18;
        
        vm.expectEmit(true, true, false, true);
        emit IERC20.Approval(owner, alice, amount);
        token.approve(alice, amount);
    }
    
    // ============ TransferFrom Tests ============
    
    function testTransferFrom() public {
        uint256 amount = 100 * 10**18;
        
        token.approve(alice, amount);
        vm.prank(alice);
        bool success = token.transferFrom(owner, bob, amount);
        assertTrue(success);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY - amount);
        assertEq(token.allowance(owner, alice), 0);
    }
    
    function test_TransferFromInsufficientAllowance() public {
        uint256 amount = 100 * 10**18;
        
        token.approve(alice, amount);
        vm.prank(alice);
        vm.expectRevert();
        token.transferFrom(owner, alice, amount + 1);
    }
    
    function test_TransferFromInsufficientBalance() public {
        vm.prank(alice);
        token.approve(bob, 100);
        vm.expectRevert();
        vm.prank(bob);
        token.transferFrom(alice, charlie, 1);
    }
    
    // ============ Mint Tests ============
    
    function testMint() public {
        uint256 amount = 1000 * 10**18;
        
        uint256 totalSupply = token.totalSupply();
        token.mint(alice, amount);
        assertEq(token.balanceOf(alice), amount);
        assertEq(token.totalSupply(), totalSupply + amount);
    }
    
    function test_MintNotOwner() public {
        vm.prank(alice);
        vm.expectRevert();
        token.mint(alice, 10);
    }
    
    function testMintZeroAddress() public {
        vm.expectRevert(MyToken.ZeroAddress.selector);
        token.mint(address(0), 10);
    }
    
    function testMintZeroAmount() public {
        vm.expectRevert(MyToken.ZeroAmount.selector);
        token.mint(alice, 0);
    }
    
    // ============ Burn Tests ============
    
    function testBurn() public {
        uint256 amount = 100 * 10**18;

        uint256 total_supply = token.totalSupply();
        token.burn(amount);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY - amount);
        assertEq(token.totalSupply(), total_supply - amount);
    }
    
    function testBurnInsufficientBalance() public {
        uint256 total_supply = token.totalSupply();
        vm.expectRevert(
            abi.encodeWithSelector(
                MyToken.InsufficientBalance.selector,
                total_supply + 1,
                total_supply
            )
        );
        token.burn(total_supply + 1);
    }
    
    function testBurnFrom() public {
        uint256 amount = 100 * 10**18;
        
        token.transfer(alice, amount);
        vm.prank(alice);
        token.approve(owner, amount);
        token.burnFrom(alice, amount);
        assertEq(token.balanceOf(alice), 0);
        assertEq(token.allowance(alice, owner), 0);
    }
    
    // ============ Fuzz Tests ============
    
    function testFuzzTransfer(address to, uint256 amount) public {
        vm.assume(to != address(0));
        vm.assume(amount <= INITIAL_SUPPLY);
        bool success = token.transfer(to, amount);
        assertTrue(success);
        assertEq(token.balanceOf(to), amount);
    }
    
    function testFuzzMint(address to, uint256 amount) public {
        vm.assume(to != address(0));
        vm.assume(amount > 0);

        uint256 total_supply = token.totalSupply();
        vm.assume(amount <= type(uint256).max - total_supply); // prevent overflow

        token.mint(to, amount);
        assertEq(token.totalSupply(), total_supply + amount);
    }
    
    function testFuzzApprove(address spender, uint256 amount) public {
        vm.assume(spender != address(0));
        bool success = token.approve(spender, amount);
        assertTrue(success);
        assertEq(token.allowance(owner, spender), amount);
    }
}