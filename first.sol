// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
contract class {
    people[] public a;
    
    struct people {
        uint256 age;
        string name;
    }
    
    mapping(string => uint256) public list;
    function enterInList (string memory _name,uint256 _age) public {
        list[_name]=_age;
        a.push(people(_age,_name));
    }

}
