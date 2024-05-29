// SPDX-License-Identifier: MIT

pragma solidity 0.8.22;

//This contract facilitates battles between players' hybrid animals.
//Players can initiate battles by selecting their hybrid animals, and the contract determines the winner based on attributes like strength and speed.

import "Animash/AnimalCollection.sol";

contract AnimashArena {
    AnimashCollecion public animashCollecion;

    constructor(address _animashCollectionAddress) {
        animashCollecion = AnimashCollecion(_animashCollectionAddress);
    }

    event BattleResult(address indexed player1, string player1Animal, address indexed player2, string player2Animal, address winner);

    function battle(address _player1, string memory _player1Animal, address _player2, string memory _player2Animal) public {
        (, , uint16 player1Strength, uint16 player1Speed) = animashCollecion.getAnimal(_player1Animal);
        (, , uint16 player2Strength, uint16 player2Speed) = animashCollecion.getAnimal(_player2Animal);
        uint256 player1Power = player1Strength + player1Speed;
        uint256 player2Power = player2Strength + player2Speed;
        uint256 randomness = uint256(keccak256(abi.encodePacked(block.timestamp, _player1, _player2, _player1Animal, _player2Animal))) % 100;
        address winner;
        if (player1Power + randomness % player1Power > player2Power + randomness % player2Power) {
            winner = _player1;
        } else {
            winner = _player2;
        }
        emit BattleResult(_player1, _player1Animal, _player2, _player2Animal, winner);
    }
}