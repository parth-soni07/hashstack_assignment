// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "./ReentrancyGuardUpgradeable.sol";

contract ContractA is Initializable, OwnableUpgradeable, ReentrancyGuardUpgradeable {
    uint256 private _value;

    function initialize() public initializer {
        __Ownable_init(msg.sender);
        __ReentrancyGuard_init();
        _value = 1;
    }

    function setValue(uint256 _increaseBy) public onlyOwner nonReentrant {
        _value += _increaseBy;
    }

    function getValue() public view onlyOwner returns (uint256) {
        return _value;
    }
}