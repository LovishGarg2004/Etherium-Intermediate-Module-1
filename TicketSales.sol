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
