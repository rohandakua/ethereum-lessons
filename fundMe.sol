// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./priceConverter.sol";

contract fundMe{
    using priceConverter for uint256;
    uint256 public minUsd=50 * 1e18 ;   // in wei

    //  to make sure only the owner can access the withdraw function
    address public owner;
    constructor(){
        owner = msg.sender;    // this a constructor and it is called first 
    }


    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    
    function fund() public payable{
        require(msg.value.getConversionRate()>=minUsd,"didnot send enough amount");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public checkOwner{
        // this function does take all the money and withdraw it 
        for(uint256 i=0;i<funders.length;i++){
            addressToAmountFunded[funders[i]]=0;
        }
        funders=new address[](0);

        // now to originaly transfer the money we can have three calls
        // // 1. transfer
        // payable(msg.sender).transfer(address(this).balance);
        // // this sends the balance to the address and it requires the address to be of payable type 
        // // and reverts itself

        // // 2. send
        // bool success=payable(msg.sender).send(address(this).balance);
        // require(success,"the transaction failed");
        // // this return boolean data and requires to be reverted 

        // 3. call
        (bool callSuccess ,) = payable(msg.sender).call{value:address(this).balance}("");
        // this is  a primitive function and can be used in many type and here it returns two data 
        // and it takes value as this.balance . needs to be reverted
        require(callSuccess,"the transaction failed");
    }
    modifier checkOwner{    // modifier is a condition for when to check the conditions
        require(owner==msg.sender,"this is not the owner");
        _;  // this line states the remaining code and position of this decide where this will run
    }
    
    


}
