// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 


contract BCDV1011_Lab_1 { 

    address owner;

    constructor(){ 
        owner = msg.sender; 
    } 

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
 
    modifier onlyMark(uint8 _mark){
        require(_mark >= 0, "Invalid Marks");
        require(_mark <= 100, "Invalid Marks");
        _;
    }

     struct Student { 
        string name; 
        string subject; 
         uint8 mark; 
     } 


    event StudentAdded( 
        string content 
     ); 

    mapping (address => Student) students; 

    uint mapSize; 



    function  adding_values (address _address, string memory _name, string memory _subject, uint8 _mark) public onlyMark(_mark){ 
 

    Student storage student = students[_address]; 

        student.name = _name; 
        student.subject = _subject; 
        student.mark = _mark; 

        mapSize++; 
        emit StudentAdded("Student added successfully."); 


    } 




    function get_student_info (address _address) view public  onlyOwner returns (string memory, string memory, uint8){ 

         string memory _name = students[_address].name; 

        string memory _subject = students[_address].subject; 

        uint8 _mark = students[_address].mark; 
        
        return (_name, _subject, _mark); 

    } 


    function count_students() view public returns (uint) { 

         return mapSize; 

 

    } 

} 
