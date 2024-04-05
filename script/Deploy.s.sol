// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {DeployHelper} from "./DeployHelper.sol";

contract DeployScript is Script, DeployHelper {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        _deployImplementationAndProxy();
        vm.stopBroadcast();
    }
}
