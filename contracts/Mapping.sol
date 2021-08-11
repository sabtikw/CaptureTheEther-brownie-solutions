/*


the contract storage locations are as follows :

0 - isComplete
1 - size of the dynamic array

the locatio of the first item in the dynamic array is keccak(1)
first_location = web3.keccak(hexstr='0x0000000000000000000000000000000000000000000000000000000000000001')

convert to integer => 
first_location_int = int(first_location.hex(),16)

since the array start after the second storage location , then the array size to overflow to zero is as below

zero_location = 2 ** 256 - first_location_int


call the set function with (zero_location,1) to set isComplete to true 


*/

pragma solidity 0.8.6;

interface MappingChallenge {


    function set(uint256 key, uint256 value) external;
    
}