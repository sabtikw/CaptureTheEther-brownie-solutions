from brownie import web3


def main():
    for i in range(0,2 ** 8):
        k = web3.keccak(i)
        hex = k.hex()
        if hex == "0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365":
            print(i)
            break