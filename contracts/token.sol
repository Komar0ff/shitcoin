// SPDX-License-Identifier: UNLICENSE


pragma solidity >=0.5.0 <0.9.0;

contract Shitcoin {
  constructor() {}

  /*OPTIONAL ERC-20 FUNCTIONS*/

  string private _name = "shitcoin";
  function name() public view returns (string memory) {
    return _name;
  }

  string private _shortName = "SHT";
  function symbol() public view returns (string memory){
    return _shortName;
  }

  uint256 private _total = 10000;
  function totalSupply() public view returns (uint256) {
    return _total;
  }

  function decimal() public pure returns (uint8) {
    return 18;
  }


  /*MUST HAVE ERC-20 FUNCTIONS*/

  mapping(address => uint256) private _balances;

  function balanceOf(address account) public view returns (uint256){
    return _balances[account];
  }

  function transfer(address to, uint256 amount) public returns (bool) {
    require(_balances[msg.sender] >= amount, "Not enough tokens");
    require(to != address(0))

    _balances[msg.sender] -= amount;
    _balances[to] += amount;

    emit Transfer(msg.sender, to, amount);
    return true;
  }

  mapping(address => mapping(address => uint256)) private _allowances;

  function transferFrom(address from, address to, uint256 amount) {
    require(_balances[from] >= amount, "Not enough tokens");
    require(_allowances[from][msg.sender] >= amount, "Allowance exceeded");
    require(to != address(0))

    _balances[from] -= amount;
    _balances[to] += amount;
    _allowances[from][msg.sender] -= amount;

    emit Transfer(from, to, amount);
    return true;
  }

  function approve(address spender, uint256 amount) public returns (bool) {
      _allowances[msg.sender][spender] = amount;

      emit Approval(msg.sender, spender, amount);
      return true;
  }


  function allowance(address owner, address spender) public view returns (uint256) { 
    return _allowances[owner][spender]; 
  }
}
