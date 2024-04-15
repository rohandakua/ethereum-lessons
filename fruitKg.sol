// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;
import "./fruit.sol";
contract fruitKg is fruit{
    // inheriting the fruit class and overriding its functions
    function enterFruit(string memory _name, string memory _color,uint256 _price)public override {
        //this will store the value in kgs (supposing the price is given for every 100gm)
        name=_name;
        color=_color;
        price=_price*10;
        
    }

}
