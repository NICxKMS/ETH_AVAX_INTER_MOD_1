// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Module1{
    string public name = "Nikhil Kumar";
    mapping (address => uint256) public balances;
    uint totalSupply=0;
    
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function mint(address _address,uint _val) public {
        uint oldTotal=totalSupply;
        balances[_address]+=_val;
        totalSupply +=(1+ _val);

        assert(totalSupply == oldTotal + _val);
    }

    function getTotalSupply() view public  returns (uint256){
        require(msg.sender == owner , "Only owner can get total supply");
        return totalSupply;
    }
    function burn(address _address, uint256 _val) public {
        require(_val<=balances[_address]);
        balances[_address]+=_val;
        totalSupply += _val;

    }
    function changeOwner(address _newOwner) public {
        if(msg.sender != owner) {
            revert("Requires Owner to personally change to new Owner");
        }
        owner = _newOwner;
    }
}
