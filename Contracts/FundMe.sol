// Get funds from users
// Withdraw funds
// Set a mnimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    // constant and immutable - using these save gas.

    uint256 public constant MINIMUM_USD = 5e18; 

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        // Allow users to send $
        // Have a minimum $ sent
        // How do we send ETH to this contract
        require(
            // getConversionRate(msg.value) >= MINIMUM_USD,
            msg.value.getConversionRate() >= MINIMUM_USD,
            "please send enough ETH"
        );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] =
            addressToAmountFunded[msg.sender] +
            msg.value;
    }

    function withdraw() public onlyOwner {
        // require(msg.sender == owner, "Should be the owner to withdraw.");

        // for loop
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        //reset the array
        funders = new address[](0);

        //withdraw the funds

        //transfer
        // payable(msg.sender).transfer(address(this).balance);

        //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        //call - recommended
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner() {
        // require(msg.sender == i_owner, "Should be the owner to withdraw.");
        if(msg.sender != i_owner) { revert NotOwner(); }
        _;
    }

    // if someone sends ETH without calling the fund function?

    // recieve and fallback

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

    // if they sent using fund, the gas cost is bit low.
}

// Enums
// Events
// Try / Catch
// Function Selectors
// abi.encode / decode
// Hashing
// Yul / Assembly