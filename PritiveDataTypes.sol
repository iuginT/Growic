// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DataTypes {

/*
    
    Signed integers
    Unsigned integers
    Boolean
    Addresses
    Enums
    Bytes
*/
   
    // Signed integers

    int8 a;   // this can store a integer number with a value within -128 - 127, 
             //it's pretty unusual to use negative numbers in Solidity therefore this type is not use very often. 
            
    //Unsigned integers

    uint256 b; //this type is used very often in Solidity, before version 0.8 this could cause underflow or overflow but now this issue is fixed within the languade itself. 
                // this can store a value up to 2^256 - 1

    //Boolean

    bool c = true;  // this types can store if smth is true or false. it can be user to check a statement or in any other case where we would need to check if something is true or not. 
                    // default value is set to false
                    

    //    Addresses    

    address owner;  // Holds a 20 byte value (size of an Ethereum address)  
    address payable _owner //same as before but with the additional members transfer and send.  However when we want to send eth we will use the call function :)) for safety reasons. 

    // Enums

    enum Direction {Right, Left, Up, Down};  // Enums are one way to create a user-defined type in Solidity. it's also used for a more readable code


    //bytes

    bytes1 a = 0x1;   //the data type byte represent a sequence of bytes

}

