// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
contract Free{
    IERC20 public TOKENXU;
    uint256 public amount=0.1*10**18;
    bool public isChecked;
    address [] public usersClaimed;
   address _owner;
    constructor (address _tokenXu){
        TOKENXU=IERC20(_tokenXu);
        _owner == msg.sender;
    }
    function claim_TokenXu()public  {
        require(checkUserClaim()==false,"sorry...you were reciver token xu ");
        require(TOKENXU.balanceOf(address(this)) >= amount ,"sorry... amount...");
        isChecked=TOKENXU.transfer(msg.sender,amount);
        usersClaimed.push(msg.sender);
    }
    function wirthRaw(uint256 amount) public   {
        require(checkTotal() >= amount ,"sorry... amount...");
        require( _owner == msg.sender,"sorry... admin...");
        TOKENXU.transfer(msg.sender,amount);
    }
    function checkTotal() public view returns(uint256){
        uint256  total =TOKENXU.balanceOf(address(this));
        return  total;
    }
    function checkUserClaim()public view returns(bool){
      bool check=false;
      for(uint count=0;count<usersClaimed.length;count ++){
          if(usersClaimed[count]==msg.sender){
              check=true;
              break;
          } 
      }
      return check;
    }
}
