// SPDX-License-Identifier: MIT

pragma solidity 0.8.22;

//This contract implements the ERC-721 standard for creating and managing hybrid animal tokens.
//It includes functions for minting new hybrid animals, transferring ownership, and querying hybrid attributes.

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "Animash/AnimalCollection.sol";

contract AnimashToken is ERC721URIStorage, Ownable {

    uint256 public tokencount;
    AnimashCollecion public animashCollection;

    constructor(address _animashCollectionAddress) ERC721("Animash NFT", "ANFT") Ownable(msg.sender) {animashCollection = AnimashCollecion(_animashCollectionAddress);}

    event hybridGenerated(string _name, string rarity, uint16 strength, uint16 speed);

    function mint(string memory _name, string memory _fatherName, string memory _motherName, string memory _tokenURI) external onlyOwner returns(uint256) {
        (string memory rarity, uint16 strength, uint16 speed) = animashCollection.getAverageAttributes(_fatherName, _motherName);
        animashCollection.setAnimal(_name, rarity, strength, speed);
        tokencount++;
        _safeMint(msg.sender, tokencount);
        _setTokenURI(tokencount, _tokenURI);
        emit hybridGenerated(_name, rarity, strength, speed);
        return(tokencount);
    }

    function getInfo(string memory _name) public view {
        animashCollection.getAnimal(_name);
    }
}
