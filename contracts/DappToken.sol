// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.7;

contract DappToken {
    string  public name = "DApp Token";
    string  public symbol = "DAPP";
    string  public standard = "DApp Token v1.0";
    uint256 public totalSupply=100000;
     address owner;
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

   constructor () {
       owner=msg.sender;
        balanceOf[owner] = totalSupply;
        
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
       require(balanceOf[owner] >= _value,"not in DappToken");

        balanceOf[owner] -= _value;
        balanceOf[_to] += _value;

       emit Transfer(owner, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

       emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

      emit  Transfer(_from, _to, _value);

        return true;
    }

    function contractaddressbalance() public view returns(uint256)
    {
        return address(this).balance;
    }

      function BalanceOfAddr(address _to) public view returns(uint256)
    {
        return balanceOf[_to];
    }
}