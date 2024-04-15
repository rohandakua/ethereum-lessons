// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// creating an array of both fruit and fruitKg
import "./fruit.sol";
import "./fruitKg.sol";

contract iplementation_of_fruit{
    fruit[] public listOfFruit;
    fruitKg[] public listOfFruitKg;
    function enter(string memory _name,string memory _color,uint256 _price) public {
        fruit fr=new fruit();
        fr.enterFruit(_name, _color, _price);
        listOfFruit.push(fr);

        fruitKg frKg = new fruitKg();
        frKg.enterFruit(_name, _color, _price*10);
        listOfFruitKg.push(frKg);
    }
}
