// SPDX-License-Identifier: MIT

pragma solidity 0.8.22;

// This cobntract facillates game owner's pre-defined animals.

contract AnimashCollecion {
    struct Animal {
        string rarity;
        uint16 strength;
        uint16 speed;
    }

    mapping(string => Animal) public animals;

    function setAnimal(string memory _name, string memory _rarity, uint16 _strength, uint16 _speed) public {
        Animal storage newAnimal = animals[_name];
        newAnimal.rarity = _rarity;
        newAnimal.strength = _strength;
        newAnimal.speed = _speed;
    }

    function getAnimal(string memory _name) public view returns(string memory, string memory, uint16, uint16 ){
        return (_name,
        animals[_name].rarity,
        animals[_name].strength,
        animals[_name].speed);
    }

    function getAverageAttributes(string memory _fatherName, string memory _motherName) external view returns (string memory, uint16, uint16) {
        Animal memory father = animals[_fatherName];
        Animal memory mother = animals[_motherName];
        uint16 averageStrength = (father.strength + mother.strength) / 2;
        uint16 averageSpeed = (father.speed + mother.speed) / 2;
        return (father.rarity, averageStrength, averageSpeed);
    }
}
