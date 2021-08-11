/*


accoridng to solidity doc https://docs.soliditylang.org/en/v0.8.6/units-and-global-variables.html#block-and-transaction-properties
 
 you can only read the last 256 block hash. so if we read further than that we get 0x0 as the hash. 
 
send guess of 0x0 and wait more than 256 hashes then call settle


*/