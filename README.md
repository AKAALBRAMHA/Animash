# Hybrid Animal Game Contracts

Welcome to the Hybrid Animal Game Contracts repository! This repository contains a collection of smart contracts for a game involving hybrid animals. Each contract serves a specific function within the game ecosystem, enabling features such as creating, battling, and trading hybrid animals.

## Contracts Overview

- **AnimashCollection.sol**: This contract manages the collection of pre-defined animals available in the game. Game owners can use it to define and manage the characteristics of these animals.

- **AnimashToken.sol**: Implements the ERC-721 standard for creating and managing hybrid animal tokens. Users can mint new hybrid animals, transfer ownership, and query attributes associated with them.

- **AnimashArena.sol**: Facilitates battles between players' hybrid animals. Players can initiate battles by selecting their hybrid animals, and the contract determines the winner based on attributes like strength and speed.

- **AnimashMarketplace.sol**: Provides a decentralized marketplace for buying and selling hybrid animals. Players can list their hybrid animals for sale, set prices, and others can purchase them using cryptocurrency.

## Getting Started

To deploy and interact with these contracts, you'll need:

- An Ethereum development environment such as Remix or Truffle.
- A compatible wallet like MetaMask for interacting with Ethereum contracts.
- Solidity compiler to compile the contracts.

## Deployment

Deploy each contract to your chosen Ethereum network using your preferred development environment. Make sure to fund the contracts with enough cryptocurrency for testing purposes.

## Usage

- Use `AnimashCollection.sol` to manage the collection of pre-defined animals in the game.
- Mint new hybrid animals and manage ownership using `AnimashToken.sol`.
- Initiate battles between hybrid animals using `AnimashArena.sol`.
- Buy and sell hybrid animals on the decentralized marketplace provided by `AnimashMarketplace.sol`.

## Contributing

Contributions to the project are welcome! Feel free to submit issues or pull requests if you have any suggestions or improvements.

## License

This project is licensed under the [MIT License](LICENSE).
