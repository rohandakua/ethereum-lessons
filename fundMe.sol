// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./aggregator.sol";
import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract fundMe{
    uint256 public minEth=10000;   // in wei
    function fund() public payable{
        require(msg.value>getConversionRate(minEth),"didnot send enough amount");
        
    }
    uint256 minUsd=100 * 1e10;
    function fundInUsd() public payable{
        require(getConversionRate(msg.value)>minUsd,"very small");
    }
    function getPrice () public view returns(uint256){
        // needs ABI and Adrress to make contact with other API to fetch data
        // address - 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        AggregatorV3Interface pricefeed=AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        (,int256 price,,,)=pricefeed.latestRoundData();
        return(uint256(price*1e10));  // doesnot have decimals in solana


    }
    function getVersion() public view returns (uint256){
        AggregatorV3Interface pricefeed=AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        return pricefeed.version();
    }
    function getConversionRate(uint256 ethAmount)public view returns(uint256 ){
        uint256 ethPrice=getPrice();
        uint256 ethAmountInUsd = (ethPrice*ethAmount)/1e18;  // division is because the decimal is not available in solana
        return ethAmountInUsd;
    }


}
