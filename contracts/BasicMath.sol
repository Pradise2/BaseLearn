// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicMath {
    
    function adder(uint _a, uint _b) public pure returns (uint, bool) {
        unchecked {
            uint sum = _a + _b;
            if (sum < _a) {
                // Overflow occurred
                return (0, true);
            }
            return (sum, false);
        }
    }

    function subtractor(uint _a, uint _b) public pure returns (uint, bool) {
        if (_b > _a) {
            // Underflow occurred
            return (0, true);
        }
        return (_a - _b, false);
    }
}
