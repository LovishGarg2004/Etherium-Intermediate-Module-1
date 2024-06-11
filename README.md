# ETH+AVAX Intermediate Course Solution
## Demonstrating require(), assert(), and revert() functions of Solidity
[Video Tutorial here](https://www.loom.com/share/6001ff9e922a4d5eb2e2f58b929e1f09?sid=7ad63dcf-b03a-47a5-8cab-ecf826e37c21)

This document explains the Solidity code for a TicketSales contract that demonstrates the use of `require()`, `assert()`, and `revert()` functions. The contract allows an event organizer to manage ticket sales for an event.

## Description

The functionalities of the `TicketSales` contract:

* **Public Variables:** Event details (organizer, title, price, total tickets, sold tickets) and a record of who bought how many.
* **`onlyOrganizer`:** Only the event organizer can call certain functions (like ending the event).
* **Buying Tickets:** Users can buy tickets, but there are checks: minimum purchase, enough tickets left, and sufficient funds sent.
* **Canceling the Event:** The organizer can cancel the event if no tickets have been sold.
* **Withdrawing Funds:** The organizer can withdraw funds after the event, but only if tickets were sold.

**Note:** Withdrawing funds isn't fully implemented yet. You'll need to add the actual transfer logic.

# Getting Started
## Executing Program
To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to the Remix website at [Remix](https://remix.ethereum.org/#lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.26+commit.8a97fa7a.js).

2. Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `TicketSales.sol`).

3. Copy and paste the following code into the file:

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TicketSales {
  address public organizer;
  string public eventTitle;
  uint public ticketPrice; 
  uint public totalTickets; 
  uint public ticketsSold; 
  mapping(address => uint) public ticketsPurchasedBy;

  modifier onlyOrganizer() {
    require(msg.sender == organizer, "Only the organizer can call this function");
    _;
  }

  constructor(string memory _eventTitle, uint _ticketPrice, uint _totalTickets) {
    organizer = msg.sender;
    eventTitle = _eventTitle;
    ticketPrice = _ticketPrice;
    totalTickets = _totalTickets;
  }

  function buyTicket(uint _numberOfTickets) public payable {
    require(_numberOfTickets > 0, "You must buy at least one ticket");
    require(ticketsSold + _numberOfTickets <= totalTickets, "Not enough tickets left");

    if(msg.value < _numberOfTickets * ticketPrice){
        revert("Insufficient funds for purchase");
    }

    ticketsSold += _numberOfTickets;
    ticketsPurchasedBy[msg.sender] += _numberOfTickets;
  }

  function cancelEvent() public onlyOrganizer {
    require(ticketsSold == 0, "Cannot cancel event with tickets sold");
    eventTitle = "";
    totalTickets = 0;
    ticketPrice = 0;
  }

  function withdrawFunds() public onlyOrganizer {
    assert(ticketsSold > 0);
    ticketsSold = 0; 

  }
}
```
4. To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile TicketSales.sol" button.

5. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the `TicketSales` contract from the dropdown menu, and then click on the "Deploy" button.

6. Once the contract is deployed, you can interact with it by calling the `buyTicket`, `cancelEvent`, and `withdrawFunds` functions. Use the interface provided by Remix to input the necessary parameters and execute the functions.

## Help
If you encounter any issues, ensure the following:

1. The Solidity compiler version is set correctly.
2. The address used in function calls is valid.
3. The minimum contribution amount is met.
For additional help, use the Remix documentation or community forums.

## Authors
MetaCrafter Lovish Garg

[@LovishGarg2004](https://www.linkedin.com/in/lovish-garg-480b37249?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)

## License
This project is licensed under the MIT License - see the LICENSE.md file for details
