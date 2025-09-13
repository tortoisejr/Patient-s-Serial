// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract myContract{

    struct Patient
    {
        uint patianId;
        uint Date;
        string day;
        string name;
        uint age;
        string syndrome;
        uint serialNo;
        uint roomNo; 
        mapping (address =>bool) paymentStatus;       
        mapping(string => mapping(uint=>Doctor)) doctor;

    }

    struct Doctor {
        uint doctorId;
        string name;
        string digree;
        string Spaciality;
        uint roomNo;

    }





}