pragma solidity ^0.4.0;

contract Patients{
    
    // string [] patient;
    string[] records;
    
    function AddRecord(string entry) public{
        records.push(entry);
    }
    
    function reset() public{
        while (records.length>0){
            records.length--;
        }
    }
    
    function TestArray() public{
        records.push("t1");
        records.push("t2");
        records.push("t3");
        records.push("t4");

    }
    
    // function getRecords() returns(string){
        
    //     //return true;
    //     string all_records =""
    //     for (uint i=0; i<records.length; i++) {
    //         all_records = all_records & records[i] & "[END]";
    //     }
    //     return all_records;
    // }
    
    function getRecords(uint record_number) public constant returns(string){
        return records[record_number-1];
        
    }
    
    function getLength() public constant returns (uint){
        return records.length;
        //return records[j];
    }
}    