// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title DAOPlathTreasury - where code and poetry converge
/// @notice A treasury contract to safeguard the DAO’s precious funds with grace and trust
contract DAOPlathTreasury {
    address public dao; // The heart of the DAO, keeper of keys
    
    mapping(address => uint256) public balances; // Each soul's share in the collective chest
    
    event Deposited(address indexed from, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);
    
    modifier onlyDAO() {
        require(msg.sender == dao, "Only the DAO can call this verse.");
        _;
    }
    
    constructor(address _dao) {
        dao = _dao;
    }
    
    /// @notice Deposit ether into the treasury — a silent gift to the collective
    function deposit() external payable {
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }
    
    /// @notice Withdraw ether from the treasury — a measured release of trust
    function withdraw(uint256 amount) external onlyDAO {
        require(address(this).balance >= amount, "The treasury is but a whisper, not a gale.");
        payable(dao).transfer(amount);
        emit Withdrawn(dao, amount);
    }
    
    /// @notice Check the treasury balance — the pulse of our DAO’s lifeblood
    function treasuryBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
