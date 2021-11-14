# GreenVolt

## Summary
An NFT fragmenting smart contract on EVM compatible chains.

## Abstract

International institutes issue IREC's for the production (and injection?) of 1 MWh of verifiably renewable energy.
Hence, the IREC stands for International Renewable Energy Certficate and is awarded in the form of an ERC-1888 token.
These certificates can be traded between entities on a (de)centralized market as a financial incentive to produce carbon-neutral or even carbon-negative energy.

## Motivation

The certificates are generally awarded to and traded by enterprises to meet emission quota and/or creating a return on investment.
Individuals on the other hand, often lack the means to generate these copious amounts of green energy.

## Tokenomics

To democratize this landscape, we need to find a way to make these certificates more accessible for the common man.
We propose to fragment these ERC-1888 tokens into 1,000,000 pieces, each representing 1Wh of green energy.
These pieces are minted as ERC-20 tokens which can be traded on (de)centralized exchanges.
They can also be burned incentivized by the price reducting in certain purchases.

## Use Cases

### Airplane tickets

Bob wants to book a flight to go see Alice who lives on the other side of the planet.
This journey emits a lot of greenhouse gasses by the airplane burning fuel to get there.
These emissions are part of the price of his airplane ticket.

However, Bob has bought some VOLT tokens and the airline can accept these to lower the ticket price.
If Bob wishes to do so, he can then burn these VOLT's representing the carbon emissions of his flight.
This effectively balances out the renewable energy with the emissions, making this flight closer to carbon-neutral.

### Online shopping

Alice has been wishing to dress up for Bob's arrival and want to buy a new dress which is handmade 500 kilometres away.
Her purchase has a carbon footprint as her dress needs to be shipped through the air, over water and/or on land.
To minimize this impact, Alice can choose to burn some of the VOLT tokens she bought a couple of days before.

## Gamification

To add to the incentives of lowering global emissions as well as the financial aspect of being able to sell/trade these tokens, we also propose gamifying the process in a way by awarding achievements to the users for burning VOLT tokens.
For example, should Bob over the course of a couple of monts burn 1 million VOLT tokens, and thus effectively burning an IREC as well, he receives the first achievement NFT for burning this amount.
The second can then be issued when he's burned 5 million VOLT's, third for burning 10 million VOLT tokens et cetera.

This gives Bob not only a clear consciousness, but also bragging rights about balancing the emissions caused by his lifestyle with the decentralized production of renewable energy.

## Implementation

### Definitions

* IREC: International Renewable Energy Certificate
* VOLT: Our VOLT token represents one millionth of an IREC
* ERC-20: Fungible token standard
* ERC-223: Prevents the wrong tokens to be sent for transfer
* ERC-1155: Typical NFT standard
* ERC-1888: Current token standard for IREC's (we'll replace this with our own implentation, though it's not required)
* Minting: Creating an asset (can be fungible, can be non-fungible)


### IREC mock

The IREC.sol is currently a mockup for the real IREC's. They are at the time of writing a ERC-223 token, but will be extended to a ERC-223+ERC-1888 token.
When transferring these tokens to a contract address, it will trigger the `tokenReceived` function of the IERC223Recipient (in our case, VOLT)

### VOLT token

The VOLT.sol is the smart contract that mints 1,000,000 VOLT tokens when you transfer an amount of IREC's to its contract address.
It implements the IERC223Recipient interface to mint VOLT's upon receiving an ERC223 IREC token.

The VOLT contract also implements the ERC20Burnable interface so that these tokens can be burned.
In this function, it also makes sure to burn the IREC's from the VOLT's balance.

## History

This project is the work of a group of people and started from a hackathon event called BLINGathon*, we call ourselves _'SystemGoesB00m!'_, but in all reality, we're just GreenVolt now ;)
Because of the potential with fragmenting energy certificates, we'll continue the research and development beyond this event.

_*BLING stands for BLockchain in Government and is an initiative to research technologies and how they can benefit the citizens of the EU (and the world)_

