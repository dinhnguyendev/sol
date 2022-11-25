// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
contract GameCaro{
    IERC20 public TOKENXU;
    address private _owner; 
    constructor (address _tokenXu){
        TOKENXU=IERC20(_tokenXu);
        _owner=msg.sender;
    }
    function wirthraw(uint256 amount)public payable  {
        require(checkTotal() >= amount ,"sorry... amount...");
        require( _owner == msg.sender,"sorry... admin...");
        TOKENXU.transfer(msg.sender,amount);
    }
    function transferWinner(address winner,uint256 amount)public payable  {
        require(checkTotal() >= amount ,"sorry... amount...");
        require( _owner == msg.sender,"sorry... admin...");
        TOKENXU.transfer(winner,amount);
    }
    function checkTotal() public view returns(uint256){
        uint256  total =TOKENXU.balanceOf(address(this));
        return  total;
    }
    function checkOwner() public view returns(address){
        return  _owner;
    }
   
}
