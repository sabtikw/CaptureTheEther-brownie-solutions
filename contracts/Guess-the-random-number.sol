/*

# get the storage variable at slot 0

hex = web3.eth.getStorageAt("address",0)

answer = int(hex.hex(),16)

function_selector => web3.keccak(text="guess(uint8)")[0:4].hex()

a[0].transfer(to="0xCb381ceb2F94d065f351DCCbbd13248efcE3Ede9",amount='1 ether',data='0x4ba4c16b000000000000000000000000000000000000000000000000000000000000003a')

data = function_selector + answer

*/