// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./IERC20Rebasing.sol";

contract Contract {
    IBlast public constant BLAST =
        IBlast(0x4300000000000000000000000000000000000002); // blast-sepolia address
    IERC20Rebasing public constant USDB =
        IERC20Rebasing(0x4200000000000000000000000000000000000022); // blast-sepolia address
    IERC20Rebasing public constant WETH =
        IERC20Rebasing(0x4200000000000000000000000000000000000023); // blast-sepolia address
    address payable public governor;

    constructor(address _governor) payable {
        BLAST.configureClaimableGas(); // this sets the Gas Mode for MyContract to claimable
        BLAST.configureAutomaticYield(); // contract balance will grow automatically
        USDB.configure(YieldMode.CLAIMABLE); // configure claimable yield for USDB
        WETH.configure(YieldMode.CLAIMABLE); // configure claimable yield for WETH
        if (_governor != address(0)) {
            BLAST.configureGovernor(_governor); // only this address can claim yield
            governor = payable(_governor);
        }
    }

    function claimYield(address recipient, uint256 amount) external {
        //This function is public meaning anyone can claim the yield
        BLAST.claimYield(address(this), recipient, amount);
    }

    function claimAllYield(address recipient) external {
        //This function is public meaning anyone can claim the yield
        BLAST.claimAllYield(address(this), recipient);
    }

    function claimMyContractsGas() external {
        BLAST.claimAllGas(address(this), msg.sender);
    }
}
