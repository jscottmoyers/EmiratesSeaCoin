//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


///=actual code if "///" are removed; //=notes


****
///import "./IERC20.sol";
///import "./extensions/IERC20Metadata.sol";
///import "../../utils/Context.sol";

//dev Implementation of the {IERC20} interface.

//this implementation is agnostic to the way tokens are created. This means that a supply mechanism has to be added in a derived contract using {_mint}
//for generic mechanism see {ERC20PresentMinterPauser}


//-see how to implement supply mechanisms

//general guidelines have been followed: functions revert instead of returning 'false' on failure. 
//this behavior is nonetheless conventional and does not conflict with the expectations of ERC20 applications

//additionally, an {Approval} event is emitted on calls to the {transferFrom}
//this allows applications to reconstruct the allowance for all accounts just by listening to said events
//other implementations of the EIP may not emit these events, as it isnt required by the specification

//finally, the non-standard {decreaseAllowance} and {increaseAllowance} functions hyave been added to mitigate the well-known issues around setting allowances
//see {IERC20-approve}

///contract ERC20 is Context, IERC20, IERC20Metadata {
    ///mapping (address => mapping (address => unit256)) private _allowances;
    
    ///unit256 private _totalSupply;
    
    ///string private _name;
    ///string private _symbol;
///}
**

//dev Sets the values for {name} and {symbol}

//the default value of {decimals} is int18
//to select a different value for {decimals} you should overload it

//all two of these values are immutable: they can only be set once during construction

**
///constructor (string memory name_, string memory symbol_) {
    ///_name = name_;
    ///_symbol = symbol_;
///}
**

//dev Returns the name of the token

**
///function name() public view virtual override returns (string memory) {
    ///return _name;
///}
**

//dev returns the symbol of the token, usually a shorter version of the name

**
///function symbol() public view virtual override returns (string memory) {
    ///return _symbol;
///}
**

//dev Returns the number of decimals used to get its user representation
//-for example, if 'decimals' equals '2', a balance of '505' tokens should be displayed to a user as '5,05' ('505 / 10 ** 2')

//tokens usually opt for a value of 18, imitating the relationship between Ether and wei
//This is the value {ERC20} uses, unless this function is overridden 

//NOTE: This information is only used for _display_ purposes: it in now way affects any of the arithmetic of the contract, including {IERC20-balanceOf} and {IERC20-transfer}

**
///function decimals () public view virtual override returns (unit8) {
    ///return 18;
///}
**

//dev see {IERC20-totalSupply}

**
///function totalSupply() public view virtual override returns (unit256) {
    ///return _totalSupply;
///}
**

//dev see {IERC20-balanceOf}

**
///function balanceOf(address account) public view virtual override returns (unit256) {
    ///return _balances[account];
///}
**

//dev see {IERC20-transfer}

//requirements:
//-'recipient' cannot be the zero address
//-the caller must have a balance of at least 'amount'

**
///function transfer(address recipient, unit256 amount) public virtual override returns (bool) {
    ///_transfer(_msgSender(), recipient, amount);
    ///return true;
///}
**

//dev see {IERC20-allowance}

**
///function allowance(address owner, address spender) public view virtual override returns (unit256) {
    ///return _allowances[owner][spender];
///}
**

//dev see {IERC20-approve}

//requirements:
//-'spender' cannot be the zero address

**
///function approve(address spender, unit256 amount) public virtual override returns (bool) {
    ///_approve(msgSender(), spedner, amount);
    ///return true;
///}
**

//dev see {IERC20-transferFrom}

//Emits an {Approval} event indicating the updated allowance. 
//this is not required by the EIP
//see the note at the beginning of {ERC20}

//requirements
//-'sender' and 'recipient' cannot be the zero address
//-'sender' must have a balance of at least 'amount'
//-the caller must have allowance for ''sender'' 's tokens of at least 'amount'

**
///function transferFrom(address sender, address recipient, unit256 amount) public virtual override returns (bool) {
    ///_transfer (sender, recipient, amount);
    
    ///unit256 currentAllownace = _allowances [sender][_msgSender()];
    ///require(currentAllownace >= amount, "ERC20: transfer amount exceeds allowance");
    ///_approve(sender, _msgSender(), currentAllownace - amount);
    
    ///return true;
///}
**

//dev Atomically increases the allowance granted to 'spender' by the caller
//this is an alternative to {approve} that can be used as a mitigation for problems described in {IERC20-approve}

//Emits an {Approval} event indicating the updated allowance

//requirements:
//-'spender' cannot be the zero address

**
///function increaseAllowance(address spender, unit256 addedValue) public virtual returns (bool) {
    ///_approve(_msgSender (), spender, _allowances[_msgSender()][spender] + addedValue);
    ///return true;
///}
**

//dev Atomically decreases the allowance granted to 'spender' by the caller

//this is an alternative to {approve} that can be used as a mitigation for problems described in {IERC20-approve}

//Emits an {Approval} event indicating the updated allowance

//requirements:
//-'spender' cannot be the zero address
//-'spender' must have allownace for the caller of at least 'subtractedValue'

**
///function decreaseAllowance(address spender, unit256 subtractedValue) public virtual returns (bool) {
    ///unit256 currentAllownace = _allowances[_msgSender()][spender];
    ///require(currentAllownace >= subtractedValue, "ERC20: decreased allowance below zero");
    ///_approve(_msgSender(), spender, currentAllownace - subtractedValue);
    
    ///return true;
///}
**

//dev Moves tokens 'amount' from 'sender' to 'recipient'

//this is internal function is equivalent to {transfer}, and can be used to e.g. implement automatic token fees, slashing mechanisms, etc.

//Emits a {Transfer} event

//requirements:
//-'sender' cannot be the zero address
//-'recipient' cannot be the zero address
//-'sender' must have a balance of at least 'amount'

**
///function _transfer(address sender, address recipient, unit256 amount) internal virtual {
    ///require(sender != address(0), "ERC20: transfer from the zero address");
    ///require(recipient != address(0), "ERC20: transfer to the zero address";
    
    ///_beforeTokenTransfer(sender, recipient, amount);
    
    ///unit256 sednerBalance = _balances[sender];
    ///require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
    ///_balances[sender] = senderBalance - amount;
    ///_balances[recipient] += amount;
    
    ///emit Transfer(sender, recipient, amount);
///}
**

//dev Creates 'amount' tokens assigns them to 'account', increasing the total supply

//Emits a {Transfer} event with 'from' set to the zero address

//requirements:
//-'account' cannot be the zero address

**
///function _mint(address account, unit256 amount) internal virtual {
    ///require(account != address (0), "ERC20: mint to the zero address");
    
    ///_beforeTokenTransfer(0), account, amount);
    
    ///_totalSupply += amount;
    ///_balances[account] += amount;
    ///emit Transfer(address(0), account amount);
///}
**

//dev Destroys 'amount' tokens from 'account', reducing the total supply

//Emits a {Transfer} event with 'to' set to the zero address

//requirements:
//-'account' cannot be the zero address
//-'account' must have at least 'amount' tokens

**
///function _burn(address account, unit256 amount) internal virtual {
    ///require(account != address(0), "ERC20: burn from the zero address");
    
    ///_beforeTokenTransfer(account, address(0), amount);
    
    ///unit256 accountBalance = _balances[account];
    ///require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
    ///_balances[account] = accountBalance - amount;
    ///_totalSupply -= amount;
    
    ///emit Transfer(account, address(0), amount);
///}
**

//dev Sets 'amount' as the allowance of 'spender' over the 'owner' 's tokens

//this internal function is equivalent to 'approve', and can be used to e.g. set automatic allownaces for certain subsystems, etc.

//Emits an {Approval} event

//requirements:
//-'owner' cannot be the zero address
//-'spender' cannot be the zero address

**
///function _approve(address owner, address spender, unit256 amount) internal virtual {
    ///require(owner != address(0), "ERC20: approve from the zero address");
    ///require(spender != address(0), "ERC20: approve to the zero address");
    
    ///_allowances[owner][spender] = amount;
    ///emit Approval(owner, spender, amount);
///}
**

//dev Hook that is called before any transfer of tokens
//this includes minting and burning

//Calling condiditions:
//-when 'from' and 'to' are both non-zero, 'amount' of ''from'' 's tokens will be to transferred to 'to'
//-when 'from' is zero, 'amount' tokens will be minted for 'to'
//-when 'to' is zero, 'amount' of ''from'''s tokens will be burned
//-'from' and 'to' are never both zero

//to learn more about hooks, go to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks]

**
///function _beforeTokenTransfer(address from, address to, unit256 amount) internal virtual{ }

///}
*****


**
///import "../ERC20.sol";
///import "../estensions/ERC20Burnable.sol";
///import "../extensions/ERC20Pausable.sol";
///import "../../../access/AccessControlEnumerable.sol";
///import "../../../utils/Context.sol";
**

//ability for holders to burn (destroy) their tokens
//a minter role that allows for token minting (creation)
//a pauser role that allows to stop all token transfers

//this contract uses {AccessControl} to lock permissioned functions using the different roles - see documentation for details

//the account that deploys the contract will be granted the minter and pauser roles, as well as the default admin role, which will let it grant both minter and pauser roles to other accounts

**
///contract ERC20PresentMinterPauser is Context, AccessControlEnumerable, ERC20Burnable, ERC20Pausable {
    ///bytes32 public constant MINTER_ROLE = ("MINTER_ROLE");
    ///bytes32 public constant PAUSER_ROLE = ("PAUSER_ROLE");
///}
**

//dev Grants 'DEFAULT_ADMIN_ROLE' , 'MINTER_ROLE' and 'PAUSER_ROLE' to the account that deploys the contract.

//see ERC20-constructor

**
///constructor(string memory name, string memory symbol) ERC20(name,symbol){
    ///_setupRole (DEFAULT_ADMIN_ROLE, _msgSender());
    
    ///_setupRole(MINTER_ROLE, msgSender());
///}
**

//dev Creates 'amount' new tokens for 'to'
//see ERC20-_mint

//requirements:
//-the caller must have the 'MINTER_ROLE'

**
///function mint(address to, unit256 amount) public virtual {
    ///require(hasRole(MINTER_ROLE, _msgSender()), "ERC20PresentMinterPauser: must have minter role to mint");
    ///_mint(to, amount);
///}
**


//dev Pauses all token transfers
//see ERC20Pausable and Pausable-_pause
//requirements:
//-the caller must have the 'PAUSER_ROLE'

**
///function pause() public virtual {
    ///require(hasRole(PAUSER_ROLE, _msgSender()), "ERC20PresentMinterPauser: must have pauser role to pause");
    ///_pause();
///}
**

//dev unpauses all token transfers
//see ERC20Pausable and Pausable-_unpause
//requirements:
//-the caller must have the 'PAUSER_ROLE'

**
///function unpause() public virtual {
    ///require(hasRole(PAUSER_ROLE, _msgSender()), "ERC20PresentMinterPauser: must have pauser role to unpause");
    ///_unpause();
///}
**

**
///function _beforeTokenTransfer(address from, address to, unit256 amount) internal virtual override(ERC20, ERC20Pausable) {
    ///super._beforeTokenTransfer(from, to, amount);
///}
///}
**


contract Emirates Sea Coin is ERC20 {
    constructor(unit256 initialSupply)public ERC20 ("ESC")}
    _mint(msg.sender, initial);
}


