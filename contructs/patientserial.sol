// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract myContract{

    struct Patient
    {
        uint Date;
        uint patientId;
        string name;
        uint age;
        string syndrome;
        uint serialNo;
        uint roomNo; 
        uint doctorId;
        bool paymentStatus; 
        bool special;
        bool sarved;      
    }

    struct Doctor {
        uint doctorId;
        string name;
        string digree;
        string Spaciality;
        uint dutyStartTime;
        uint dutyEndTime;
        bool Availablity;
        uint roomNo;
    }
mapping(uint =>Doctor) public doctors;
mapping(uint => Patient) public patients;
mapping(uint =>Patient) public PatientsSerial;
uint public doctorCount=0;
uint public patientCount=0;
uint public specialPatientCount=0;
uint public serialCount=0;

modifier doctorAvailablity(uint _doctorId)
{
    require(doctors[_doctorId].dutyEndTime >= block.timestamp,"Doctor's dity time is finished");
    _;
}
modifier doctorExistency(uint _doctorId)
{
    require(doctors[_doctorId].doctorId<=doctorCount && _doctorId!=0,"Doctor Id is wrong");
    _;
}
modifier patientExistency(uint _patientId)
{
    require(patients[_patientId].patientId<=patientCount,"patient ID is wrong");
    _;
}

modifier ispaid(uint _patientId)
{
    require(patients[_patientId].paymentStatus,"Patient's paymet is not clear");
    _;
}









}