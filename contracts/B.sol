// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/AccessControl.sol";

contract ContractB is AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant SUPER_ADMIN_ROLE = keccak256("SUPER_ADMIN_ROLE");

    constructor(){
        _grantRole(SUPER_ADMIN_ROLE, msg.sender);
        _setRoleAdmin(ADMIN_ROLE, SUPER_ADMIN_ROLE);
    }

    function addAdmin(address newAdmin) public onlyRole(SUPER_ADMIN_ROLE) {
        grantRole(ADMIN_ROLE, newAdmin);
    }

    function removeAdmin(address admin) public onlyRole(SUPER_ADMIN_ROLE) {
        revokeRole(ADMIN_ROLE, admin);
    }

    function transferAdminRole(address oldAdmin, address newAdmin) public onlyRole(SUPER_ADMIN_ROLE) {
        revokeRole(ADMIN_ROLE, oldAdmin);
        grantRole(ADMIN_ROLE, newAdmin);
    }

    function renounceAdminRole() public {
        renounceRole(ADMIN_ROLE, msg.sender);
    }
}