pragma solidity ^0.8.0;

contract ScavengerHuntNFT {
    address public owner;
    mapping(address => bool) public winners;
    bool public huntActive;
    
    event WinnerDeclared(address winner);
    event HuntStarted();
    event HuntEnded();

    function startHunt() public {
        require(msg.sender == owner, "Only owner can start");
        huntActive = true;
        emit HuntStarted();
    }
    
    function declareWinner(address participant) public {
        require(msg.sender == owner, "Only owner can declare winners");
        require(huntActive, "Hunt is not active");
        winners[participant] = true;
        emit WinnerDeclared(participant);
    }
    
    function endHunt() public {
        require(msg.sender == owner, "Only owner can end hunt");
        huntActive = false;
        emit HuntEnded();
    }
}
