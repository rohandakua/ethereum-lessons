// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract fruit{
    string public name;
    string public color;
    uint256 public price;

    function enterFruit (string memory _name,string memory _color ,uint256 _price) public virtual {
        name=_name;
        color=_color;
        price=_price;
    } 

}
