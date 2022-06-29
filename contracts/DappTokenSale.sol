// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.7;

import "contracts/DappToken.sol";

contract DappTokenSale {
    address payable admin;
    DappToken public tokenContract;
   // uint256 public tokenPrice;
    uint256 public tokensSold;
    uint256 tokenPrice=1000000000000000000;

    event Sell(address _buyer, uint256 _amount);

   constructor (DappToken _tokenContract) payable  {
        admin = payable(msg.sender);
        tokenContract = _tokenContract;
      //  tokenPrice = _tokenPrice;
    }

    function multiply(uint x, uint y) internal pure returns (uint) {
        return x*y;
    }

    function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == multiply(_numberOfTokens, tokenPrice),"not buy multiply");
       // require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);
        tokenContract.transfer(msg.sender, _numberOfTokens);

        tokensSold += _numberOfTokens;

       emit Sell(msg.sender, _numberOfTokens);
        
    }

    function endSale() public {
        require(msg.sender == admin);
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));

        selfdestruct(admin);
    }

    function contractaddressbalance() public view returns(uint256)
    {
        return address(this).balance;
    }

      function BalanceOfAddr(address _to) public view returns(uint256)
    {
        return tokenContract.balanceOf(_to);
    }
}