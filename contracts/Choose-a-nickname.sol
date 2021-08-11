/*

# Open brownie console with ropsten testnet

brownie console --network ropsten

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# solution

cpte = interface.CaptureTheEther("ContractAddress")

# Convert text to hex

myname = web3.toHex(text="yourname")

cpte.setNickname(myname,{'from':a[0]})

*/

//SPDX-License-Identifier: MIT
pragma solidity 0.8.6;
interface CaptureTheEther {

function setNickname(bytes32 nickname) external;
}