// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {DeployHelper} from "./DeployHelper.sol";

contract DeployMode is Script, DeployHelper {
    function setUp() public {}

    function run() public {
        address multisig = 0x6EAC39BBe26f0d6Ab8DF0f974734D2228d4Da226;
        vm.startBroadcast();
        _deployImplementationAndProxy(multisig);
        vm.stopBroadcast();
    }
}
