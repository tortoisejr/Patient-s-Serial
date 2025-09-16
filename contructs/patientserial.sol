// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract myContract{

    struct Serial{
        uint serialNo;
        uint patientId;
        bool sarved;
    }

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
mapping(uint =>Serial) public PatientsSerial;
uint head=1;
uint tail=1;
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

event addpatient(uint Date,
        uint patientId,
        string name,
        uint age,
        string syndrome,
        uint serialNo,
        uint roomNo,
        uint doctorId,
        bool paymentStatus, 
        bool special,
        bool sarved);

event adddoctor(uint doctorId,
        string name,
        string digree,
        string Spaciality,
        uint dutyStartTime,
        uint dutyEndTime,
        bool Availablity,
        uint roomNo);


function addSerial(uint _date,string memory  _name,uint _age,string memory _syndrome,uint _roomNo, uint _doctorId,bool _paymentStatus,bool _special) public doctorExistency(_doctorId) doctorAvailablity(_doctorId)
{
    Patient storage patient = patients[++patientCount];

    patient.Date= block.timestamp+_date;
    patient.patientId = patientCount;
    patient.name= _name;
    patient.age=_age;
    patient.syndrome=_syndrome;
    patient.serialNo=++serialCount;
    patient.roomNo=_roomNo;
    patient.doctorId=_doctorId;
    patient.paymentStatus=_paymentStatus;
    patient.special=_special;
    patient.sarved=false;

    emit addpatient(patient.Date, patient.patientId, patient.name, patient.age, patient.syndrome, patient.serialNo, patient.roomNo, patient.doctorId, patient.paymentStatus, patient.special, patient.sarved);

}






}