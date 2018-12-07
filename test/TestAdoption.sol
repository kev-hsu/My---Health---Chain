pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Patients.sol";

contract TestAdoption {
   // The address of the adoption contract to be tested
    Patients patients = Patients(DeployedAddresses.Patients());

    // Testing the getLength() function
    function test_GetLength() public {
        uint returnedLength = patients.getLength();

        Assert.equal(returnedLength, expectedLength_empty, "Length of the expected length should match what is returned.");
    }

      // Testing the testArray() function
    function test_testArray() public {
        patients.TestArray(); 
        uint returnedLength = patients.getLength();

        Assert.equal(returnedLength, expectedLength_array, "Length of the expected length should match what is returned.");
    }

    // Testing the test_getRecords() function
    function test_getRecords3() public {
        uint testval = 3;
        string memory returnedString = patients.getRecords(testval);

        Assert.equal(returnedString, expected_t3, "String3 should match what is returned.");
    }
    
    // Testing the test_getRecords() function
    function test_getRecords1() public {
        uint testval = 1;
        string memory returnedString = patients.getRecords(testval);

        Assert.equal(returnedString, expected_t1, "String1 should match what is returned.");
    }
    
    // Testing the test_addRecords() function
    function test_addRecords() public {
        string memory test_input = "a new test string";
        uint testval = 5;
        patients.AddRecord(test_input);
        string memory returnedString = patients.getRecords(testval);

        Assert.equal(returnedString, test_input, "Input + output strings should match.");
    }

    // Testing the reset() function
    function test_reset() public {
        patients.reset();
        uint returnedLength = patients.getLength();

        Assert.equal(returnedLength, expectedLength_empty, "After reset return length should match empty.");
    }

   // The length for testing
    uint expectedLength_empty = 0;
    uint expectedLength_array = 4;
    string expected_t3 = "t3";
    string expected_t1 = "t1";

}