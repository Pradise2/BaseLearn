// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/**
 * @title ControlStructures
 * @dev A contract to demonstrate knowledge of control structures in Solidity.
 */
contract ControlStructures {

    /**
     * @dev A custom error to indicate that an operation was attempted after hours.
     * @param _time The time at which the operation was attempted.
     */
    error AfterHours(uint _time);

    /**
     * @notice Implements the FizzBuzz logic.
     * @param _number The number to check.
     * @return A string memory representing "Fizz", "Buzz", "FizzBuzz", or "Splat".
     */
    function fizzBuzz(uint _number) public pure returns (string memory) {
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } else if (_number % 3 == 0) {
            return "Fizz";
        } else if (_number % 5 == 0) {
            return "Buzz";
        } else {
            return "Splat";
        }
    }

    /**
     * @notice Determines the time of day and handles various time-based conditions.
     * @param _time The time to check, in 24-hour format (e.g., 1300 for 1:00 PM).
     * @return A string memory representing the time of day.
     */
    function doNotDisturb(uint _time) public pure returns (string memory) {
        if (_time >= 2400) {
            assert(false); // This will trigger a panic
        }
        if (_time > 2200 || _time < 800) {
            revert AfterHours(_time);
        }
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        }
        if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        }
        if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        }
        if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        }
        // This part of the code should be unreachable if the logic is correct.
        // Adding a fallback return to satisfy the compiler.
        return "";
    }
}