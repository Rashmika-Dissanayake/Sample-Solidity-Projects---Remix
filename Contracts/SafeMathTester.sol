// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// pragma solidity 0.6.0;

// checked, unchecked, overflow

contract SafeMathTester {
    uint8 public bigNumber = 255;

    function add() public {
        bigNumber = bigNumber + 1;
        // unchecked {bigNumber = bigNumber + 1;}
    }

    // using uncecked keyword makes gas efficient
    // if we are sure it is not going to exceed limits it's good to use unchecked keyword.
}
