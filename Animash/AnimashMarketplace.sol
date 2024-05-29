// SPDX-License-Identifier: MIT

pragma solidity 0.8.22;

/*
This contract provides a decentralized marketplace for buying and selling hybrid animals.
Players can list their hybrid animals for sale, set prices, and others can purchase them using cryptocurrency.
*/

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AnimashMarket is ReentrancyGuard, Ownable {
    struct Listing {
        address seller;
        uint256 price;
    }

    mapping(uint256 => Listing) public listings;

    IERC721 public animashToken;

    event AnimalListed(address indexed seller, uint256 indexed tokenId, uint256 price);
    event AnimalPurchased(address indexed buyer, address indexed seller, uint256 indexed tokenId, uint256 price);
    event ListingCancelled(address indexed seller, uint256 indexed tokenId);

    constructor(address _animashTokenAddress) Ownable(msg.sender) {
        animashToken = IERC721(_animashTokenAddress);
    }

    function listAnimal(uint256 _tokenId, uint256 _price) external nonReentrant {
        require(animashToken.ownerOf(_tokenId) == msg.sender, "You do not own this token");
        listings[_tokenId] = Listing({seller: msg.sender, price: _price});
        emit AnimalListed(msg.sender, _tokenId, _price);
    }

    function cancelListing(uint256 _tokenId) external nonReentrant {
        require(listings[_tokenId].seller == msg.sender, "You did not list this token");
        delete listings[_tokenId];
        emit ListingCancelled(msg.sender, _tokenId);
    }

    function purchaseAnimal(uint256 _tokenId) external payable nonReentrant {
        Listing memory listing = listings[_tokenId];
        require(listing.price > 0, "This token is not for sale");
        require(msg.value >= listing.price, "Insufficient payment");

        delete listings[_tokenId];
        animashToken.safeTransferFrom(listing.seller, msg.sender, _tokenId);
        payable(listing.seller).transfer(msg.value);

        emit AnimalPurchased(msg.sender, listing.seller, _tokenId, listing.price);
    }
}
