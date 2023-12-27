//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Script} from 'forge-std/Script.sol';
import {Voting} from '../src/Voting.sol';

contract DeployVoting is Script{
    Voting public votingContract;

    function run() external returns (Voting){
        vm.startBroadcast();
        votingContract = new Voting();
        vm.stopBroadcast();

        return votingContract;
    }
}