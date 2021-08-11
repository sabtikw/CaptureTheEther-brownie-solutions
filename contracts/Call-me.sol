/*

# Open brownie console with ropsten testnet

brownie console --network ropsten

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# solution

call = interface.callMeChallenge("contractAddress")

call.callme({'from':a[0]})


*/
//SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

interface callMeChallenge {

    function callme() external;
}