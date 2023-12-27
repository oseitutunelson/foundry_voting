# Voting Smart Contract

## Overview

This is a simple Ethereum smart contract written in Solidity for conducting a voting process. The contract allows the deployment of candidates, voting by addresses, and declaring a winner based on the highest number of votes.

## Features

- **Adding Candidates**: The owner of the contract can add candidates to the election.

- **Voting**: Any address can vote for a candidate once.

- **Declare Winner**: A function is provided to determine and declare the winner based on the highest number of votes.

## Smart Contract Details

The smart contract is implemented in Solidity version ^0.8.18.

### Functions

1. **addCandidate(string memory name)**
   - Adds a candidate to the election.
   - Only the owner of the contract can add candidates.

2. **getCandidate(uint id) external view returns (string memory name, uint noOfVotes)**
   - Retrieves information about a specific candidate.

3. **getCandidates() external view returns (string[] memory, uint[] memory)**
   - Retrieves information about all candidates.

4. **vote(uint id) external**
   - Allows an address to vote for a candidate.
   - An address can vote only once.

5. **declareWinner() external view returns (string memory winnerName, uint winnerVotes)**
   - Determines and returns the winner's name and vote count.

6. **changeOwner(address newOwner) public**
   - Changes the owner of the contract.

### Events

1. **Voted(uint indexed id)**
   - Emitted when a vote is cast.

2. **CandidateCreated(uint indexed candidateNo, string indexed candidateName)**
   - Emitted when a new candidate is added.

3. **OwnerChange(address indexed oldOwner, address indexed newOwner)**
   - Emitted when the owner of the contract is changed.

### Storage

- Candidate information is stored in a mapping (`candidateLookUp`).
- Voter status is stored in a mapping (`voterLookUp`).

## Testing

The smart contract can be tested using foundry (`forge test`)

## Deployment

Deploy the smart contract to the Ethereum blockchain using your preferred deployment method or tool.(forge in foundry)


