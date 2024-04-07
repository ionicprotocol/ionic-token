// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IonicToken} from "../src/IonicToken.sol";
import {DeployHelper} from "../script/DeployHelper.sol";
import {SigUtils} from "./SigUtils.sol";

contract IonicTokenTest is Test, DeployHelper {
    address owner;
    uint256 ownerPk;
    SigUtils internal sigUtils;
    function setUp() public {
        (owner, ownerPk) = makeAddrAndKey("alice");
        vm.startPrank(owner);
        _deployImplementationAndProxy();
        vm.stopPrank();

        sigUtils = new SigUtils(token.DOMAIN_SEPARATOR());
    }

    function test_supply() public view {
        assertEq(token.totalSupply(), 1_000_000_000 ether);
        assertEq(token.balanceOf(owner), 1_000_000_000 ether);
    }

    function test_transfer() public {
        address to = address(96);
        vm.prank(owner);
        token.transfer(to, 100 ether);
        assertEq(token.balanceOf(owner), 999_999_900 ether);
        assertEq(token.balanceOf(to), 100 ether);
    }

    function test_permit() public {
        address spender = address(96);
        uint256 value = 100 ether;

        SigUtils.Permit memory permit = SigUtils.Permit({
            owner: owner,
            spender: spender,
            value: value,
            nonce: token.nonces(owner),
            deadline: 1 days
        });

        bytes32 digest = sigUtils.getTypedDataHash(permit);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(ownerPk, digest);

        token.permit(
            permit.owner,
            permit.spender,
            permit.value,
            permit.deadline,
            v,
            r,
            s
        );

        vm.startPrank(spender);
        token.transferFrom(owner, spender, value);
        assertEq(token.balanceOf(owner), 1_000_000_000 ether - value);
        assertEq(token.balanceOf(spender), value);
    }
}
