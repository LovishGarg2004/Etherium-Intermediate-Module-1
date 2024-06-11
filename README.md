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

