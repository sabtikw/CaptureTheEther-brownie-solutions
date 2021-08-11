/*
## not solved yet

contract is calculating number of token by multiplying 1 ether (PRICE_PER_TOKEN) which is  1e18  and not 1.
in the buy function  

call buy with the amount 2 ** 256 / 1e18
 
then the multiply in the require statement (2 ** 256 / 1e18 * PRICE_PER_TOKEN(1e18)) =  the max amount

which should overflow to 0


note : this didn't work with me, still trying to figure out why.
*/
