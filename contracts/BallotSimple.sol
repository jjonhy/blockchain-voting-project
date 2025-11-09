// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BallotSimple {
    address public owner;
    bool public votingOpen;

    struct Candidate {
        string name;
        uint256 votes;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;

    event CandidateAdded(string name, uint256 index);
    event VotingOpened();
    event VotingClosed();
    event Voted(address voter, uint256 candidateIndex);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    modifier whenOpen() {
        require(votingOpen, "Voting closed");
        _;
    }

    constructor(string[] memory candidateNames) {
        owner = msg.sender;
        for (uint256 i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate({name: candidateNames[i], votes: 0}));
            emit CandidateAdded(candidateNames[i], i);
        }
    }

    function openVoting() external onlyOwner {
        votingOpen = true;
        emit VotingOpened();
    }

    function closeVoting() external onlyOwner {
        votingOpen = false;
        emit VotingClosed();
    }

    function vote(uint256 candidateIndex) external whenOpen {
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateIndex < candidates.length, "Invalid candidate");
        hasVoted[msg.sender] = true;
        candidates[candidateIndex].votes += 1;
        emit Voted(msg.sender, candidateIndex);
    }

    function totalCandidates() external view returns (uint256) {
        return candidates.length;
    }

    function winner() external view returns (string memory name_, uint256 votes_) {
        uint256 top = 0;
        uint256 idx = 0;
        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i].votes > top) {
                top = candidates[i].votes;
                idx = i;
            }
        }
        return (candidates[idx].name, candidates[idx].votes);
    }
}
