// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/**
 * @title EmployeeStorage
 * @dev A contract to demonstrate knowledge of storage in Solidity, including packing.
 */
contract EmployeeStorage {

    /**
     * @dev Custom error for when granting shares would exceed the 5000 share limit.
     * @param totalShares The total number of shares the employee would have.
     */
    error TooManyShares(uint totalShares);

    // State variables are ordered to optimize storage by packing `shares` and `salary`
    // into a single storage slot.
    // `shares` (uint16) = 2 bytes
    // `salary` (uint32) = 4 bytes
    // Total = 6 bytes < 32 bytes, so they are packed.
    uint16 private shares;
    uint32 private salary;
    
    // `name` and `idNumber` will each occupy their own storage slots.
    string public name;
    uint256 public idNumber;

    /**
     * @dev Sets the initial values for the employee record.
     */
    constructor() {
        shares = 1000;
        name = "Pat";
        salary = 50000;
        idNumber = 112358132134;
    }

    /**
     * @notice Returns the value in the private `salary` variable.
     * @return The employee's salary.
     */
    function viewSalary() public view returns (uint32) {
        return salary;
    }

    /**
     * @notice Returns the value in the private `shares` variable.
     * @return The number of shares the employee owns.
     */
    function viewShares() public view returns (uint16) {
        return shares;
    }

    /**
     * @notice Increases the number of shares allocated to an employee.
     * @param _newShares The number of new shares to grant.
     */
    function grantShares(uint16 _newShares) public {
        require(_newShares <= 5000, "Too many shares");
        
        uint totalNewShares = shares + _newShares;
        
        if (totalNewShares > 5000) {
            revert TooManyShares(totalNewShares);
        }
        
        shares = uint16(totalNewShares);
    }

    /**
     * Do not modify this function.  It is used to enable the unit test for this pin
     * to check whether or not you have configured your storage variables to make
     * use of packing.
     *
     * If you wish to cheat, simply modify this function to always return `0`
     * I'm not your boss ¯\_(ツ)_/¯
     *
     * Fair warning though, if you do cheat, it will be on the blockchain having been
     * deployed by your wallet....FOREVER!
     */
    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload (_slot)
        }
    }

    /**
     * Warning: Anyone can use this function at any time!
     */
    function debugResetShares() public {
        shares = 1000;
    }
}