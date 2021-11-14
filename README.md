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


