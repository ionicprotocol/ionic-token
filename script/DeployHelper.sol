// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {IonicToken} from "../src/IonicToken.sol";
import {ERC1967Proxy} from "openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {ERC1967Utils} from "openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Utils.sol";

contract DeployHelper {
    IonicToken public token;
    function _deployImplementationAndProxy() internal {
        // Deploy the proxy and initialize the contract through the proxy
        address proxy = Upgrades.deployUUPSProxy(
            "IonicToken.sol",
            abi.encodeCall(IonicToken.initialize, (msg.sender))
        );
        token = IonicToken(proxy);
    }
}
