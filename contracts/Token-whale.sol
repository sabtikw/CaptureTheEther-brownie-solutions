/*


in this challenge , we notice that the transferFrom function calls the private _transfer function which decrements the msg.sender balance value 
instead of the from address. which can cause an underflow as follows.

1 - approve a secondary address

2 - call transferFrom using the secondary address 
    from=your address to=your address (another flaw where the function doesn't check from != to)

3 - now your secondary address will have the max value for uint256 , send it to your primary address


*/