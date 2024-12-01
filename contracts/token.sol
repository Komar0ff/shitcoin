// SPDX-License-Identifier: UNLICENSE

pragma solidity >=0.5.0 <0.9.0;

contract Shitcoin {
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);

  mapping(address => uint256) private _balances;
  mapping(address => mapping(address => uint256)) private _allowances;

  uint256 private _total = 10000;

  constructor() {
    _balances[msg.sender] = _total; 
    emit Transfer(address(0), msg.sender, _total);
  }

  function balanceOf(address account) public view returns (uint256){
    return _balances[account];
  }

  function transfer(address to, uint256 amount) public returns (bool) {
    require(amount > 0, "Amount must be greater than zero");
    require(_balances[msg.sender] >= amount, "Not enough tokens");
    unchecked {
      _balances[msg.sender] -= amount;
      _balances[to] += amount;
    }
    require(to != address(0), "Invalid address");

    _balances[msg.sender] -= amount;
    _balances[to] += amount;

    emit Transfer(msg.sender, to, amount);
    return true;
  }

  function transferFrom(address from, address to, uint256 amount) public returns (bool){
    require(amount > 0, "Amount must be greater than zero");
    require(_balances[from] >= amount, "Not enough tokens");
    require(to != address(0), "Invalid address");
    require(_allowances[from][msg.sender] >= amount, "Allowance exceeded");
    if (_allowances[from][msg.sender] != type(uint256).max) {
      _allowances[from][msg.sender] -= amount;
    }

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

  /*OPTIONAL ERC-20 FUNCTIONS*/

  function name() public pure returns (string memory) {
    return "shitcoin";
  }

  function symbol() public pure returns (string memory){
    return "SHT";
  }

  function decimal() public pure returns (uint8) {
    return 18;
  }

  function totalSupply() public view returns (uint256) {
    return _total;
  }
}
