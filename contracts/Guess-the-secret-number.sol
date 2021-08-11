/*

# Open brownie console with ropsten testnet

brownie console --network ropsten

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")


the hash can be brute forced  (8-bits only = 256), see script at guess-the-number.py in scripts folder 

# run the the script in brownie console 

run("Guess-the-number")

call guess function with the script number result

gtsnc = interface.GuessTheSecretNumberChallenge("ContractAddress")

gtsnc.guess(170,{'from':a[0],'value':'1 ether'})

*/


pragma solidity 0.8.6;

interface GuessTheSecretNumberChallenge {

    function guess(uint8 n) external payable;
}