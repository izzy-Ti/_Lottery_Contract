// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Lottery {

    address public manager;
    address payable[] public players;
    address payable public winner;

    constructor(){
        manager = msg.sender;
    }

    function participate() public payable{
        require(msg.value == 1 ether , 'Please you must pay one ether');
        players.push(payable(msg.sender));
    }

    function totalBalance() public view returns (uint){
        require(msg.sender == manager, 'Sorry you must be an Admin to see');
        return address(this).balance;
    }
    function random() public view returns (uint){
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
    }
}