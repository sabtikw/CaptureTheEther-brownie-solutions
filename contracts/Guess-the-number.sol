/*

# Open brownie console with ropsten testnet

brownie console --network ropsten

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")


number is at stroage address 0 (/or you can see it in the source code)

hex = web3.eth.getStorageAt("ContractAddress")

convert hex to int 

guess = int(hex.hex(),16)

gtnc = interface.GuessTheNumberChallenge("ContractAddress")

gtnc.guess(guess,{'from':a[0],'value': '1 ether'})

*/

pragma solidity 0.8.6;

interface GuessTheNumberChallenge {

 function guess(uint8 n) external payable;

}