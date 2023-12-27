//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Test} from 'forge-std/Test.sol';
import {DeployVoting} from '../script/DeployVoting.s.sol';
import {Voting} from '../src/Voting.sol';

contract VotingTest is Test{
    Voting votingContract;

    function setUp() external {
        DeployVoting deployer = new DeployVoting();
        votingContract = deployer.run();
    }

    //test owner
    function testOwner() public{
        assertEq(votingContract.getOwner(), msg.sender);
    }

    //test changeOwner
    function testChangeOwner() public {
        address newOwner = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
        votingContract.changeOwner(newOwner);
        assertEq(newOwner,votingContract.getOwner());
    }

    //test addCandidate
    function testAddCandidate() public {
        vm.prank(msg.sender);
        votingContract.addCandidate("Kwame");
        assertEq(votingContract.getCandidateCount(),1);
    }

    //test getCandidate
    function testGetCandidate() public{
        vm.prank(msg.sender);
        votingContract.addCandidate("Ama");
        (string memory name,uint voteCount) = votingContract.getCandidate(0);
        assertEq(name,"Ama");
        assertEq(voteCount,0);
    }

    //test getCandidates
    function testGetCandidates() public{
        vm.prank(msg.sender);
        votingContract.addCandidate("John");
        vm.prank(msg.sender);
        votingContract.addCandidate("Angela");
        (string [] memory names, uint [] memory noOfVotes ) = votingContract.getCandidates();
        assertEq(names[0],"John");
        assertEq(names[1],"Angela");
        assertEq(noOfVotes[0],0);
        assertEq(noOfVotes[1],0);
    }

    //test voting
    function testVote() public{
        vm.prank(msg.sender);
        votingContract.addCandidate("Kwame");
        votingContract.vote(0);
        (,uint voteCount) = votingContract.getCandidate(0);
        assertEq(voteCount,1);
    }

    //test declare winner
    function testDeclareWinner() public{
        vm.prank(msg.sender);
        votingContract.addCandidate('Ama');
        vm.prank(msg.sender);
        votingContract.addCandidate('John');
        votingContract.vote(1);
        vm.prank(msg.sender);
        (string memory winnerName,) = votingContract.declareWinner();
        assertEq(winnerName,"John");
    }
}