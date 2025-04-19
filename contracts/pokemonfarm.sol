// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "./ownable.sol";

contract PokemonFarm is Ownable {
    //event NewZombie(uint zombieId, string name, uint dna);
    event NewPokemon(uint pokemonId, string name);

    //uint dnaDigits = 16;
    //uint dnaModulus = 10 ** dnaDigits;
    uint cooldownTime = 1 days;
    uint public createFee = 0.001 ether;

    struct Pokemon {
        string name;
        //uint dna;
        string attribute;
        uint32 level;
        uint32 readyTime;
        uint16 winCount;
        uint16 lossCount;
        uint32 hp;
        uint32 attack;
        uint32 defense;
        uint32 specialAttack;
        uint32 specialDefense;
        uint32 speed;
        string ability1;
        string ability2;
    }

    Pokemon[] public pokemons;
    mapping (uint => address) public pokemonToOwner;
    mapping (address => uint) public ownerPokemonCount;

    mapping (uint => string) public pokemonDatabase;
    constructor() {
        pokemonDatabase[1] = "Bulbasaur";
        pokemonDatabase[2] = "Ivysaur";
        pokemonDatabase[3] = "Venusaur";
        pokemonDatabase[4] = "Charmander";
        pokemonDatabase[5]= "Charmeleon";
        pokemonDatabase[6]= "Charizard";
        pokemonDatabase[7]= "Squirtle";
        pokemonDatabase[8]= "Wartortle";
        pokemonDatabase[9] = "Blastoise";
        pokemonDatabase[10] = "Caterpie";
        pokemonDatabase[11] = "Metapod";
        pokemonDatabase[12] = "Butterfree";
        pokemonDatabase[13] = "Weedle";
        pokemonDatabase[14] = "Kakuna";
        pokemonDatabase[15] = "Beedrill";
        pokemonDatabase[16] = "Pidgey";
        pokemonDatabase[17] = "Pidgeotto";
        pokemonDatabase[18] = "Pidgeot";
        pokemonDatabase[19] = "Rattata";
        pokemonDatabase[20] = "Raticate";
        pokemonDatabase[21] = "Spearow";
        pokemonDatabase[22] = "Fearow";
        pokemonDatabase[23] = "Ekans";
        pokemonDatabase[24] = "Arbok";
        pokemonDatabase[25] = "Pikachu";
        pokemonDatabase[26] = "Raichu";
        pokemonDatabase[27] = "Sandshrew";
        pokemonDatabase[28] = "Sandslash";
        pokemonDatabase[29] = "Nidoran (F)";
        pokemonDatabase[30] = "Nidorina";
        pokemonDatabase[31] = "Nidoqueen";
        pokemonDatabase[32] = "Nidoran (M)";
        pokemonDatabase[33] = "Nidorino";
        pokemonDatabase[34] = "Nidoking";
        pokemonDatabase[35] = "Clefairy";
        pokemonDatabase[36] = "Clefable";
        pokemonDatabase[37] = "Vulpix";
        pokemonDatabase[38] = "Ninetales";
        pokemonDatabase[39] = "Jigglypuff";
        pokemonDatabase[40] = "Wigglytuff";
        pokemonDatabase[41] = "Zubat";
        pokemonDatabase[42] = "Golbat";
        pokemonDatabase[43] = "Oddish";
        pokemonDatabase[44] = "Gloom";
        pokemonDatabase[45] = "Vileplume";
        pokemonDatabase[46] = "Paras";
        pokemonDatabase[47] = "Parasect";
        pokemonDatabase[48] = "Venonat";
        pokemonDatabase[49] = "Venomoth";
        pokemonDatabase[50] = "Diglett";
        pokemonDatabase[51] = "Dugtrio";
        pokemonDatabase[52] = "Meowth";
        pokemonDatabase[53] = "Persian";
        pokemonDatabase[54] = "Psyduck";
        pokemonDatabase[55] = "Golduck";
        pokemonDatabase[56] = "Mankey";
        pokemonDatabase[57] = "Primeape";
        pokemonDatabase[58] = "Growlithe";
        pokemonDatabase[59] = "Arcanine";
        pokemonDatabase[60] = "Poliwag";
        pokemonDatabase[61] = "Poliwhirl";
        pokemonDatabase[62] = "Poliwrath";
        pokemonDatabase[63] = "Abra";
        pokemonDatabase[64] = "Kadabra";
        pokemonDatabase[65] = "Alakazam";
        pokemonDatabase[66] = "Machop";
        pokemonDatabase[67] = "Machoke";
        pokemonDatabase[68] = "Machamp";
        pokemonDatabase[69] = "Bellsprout";
        pokemonDatabase[70] = "Weepinbell";
        pokemonDatabase[71] = "Victreebel";
        pokemonDatabase[72] = "Tentacool";
        pokemonDatabase[73] = "Tentacruel";
        pokemonDatabase[74] = "Geodude";
        pokemonDatabase[75] = "Graveler";
        pokemonDatabase[76] = "Golem";
        pokemonDatabase[77] = "Ponyta";
        pokemonDatabase[78] = "Rapidash";
        pokemonDatabase[79] = "Slowpoke";
        pokemonDatabase[80] = "Slowbro";
        pokemonDatabase[81] = "Magnemite";
        pokemonDatabase[82] = "Magneton";
        pokemonDatabase[83] = "Farfetch'd";
        pokemonDatabase[84] = "Doduo";
        pokemonDatabase[85] = "Dodrio";
        pokemonDatabase[86] = "Seel";
        pokemonDatabase[87] = "Dewgong";
        pokemonDatabase[88] = "Grimer";
        pokemonDatabase[89] = "Muk";
        pokemonDatabase[90] = "Shellder";
        pokemonDatabase[91] = "Cloyster";
        pokemonDatabase[92] = "Gastly";
        pokemonDatabase[93] = "Haunter";
        pokemonDatabase[94] = "Gengar";
        pokemonDatabase[95] = "Onix";
        pokemonDatabase[96] = "Drowzee";
        pokemonDatabase[97] = "Hypno";
        pokemonDatabase[98] = "Krabby";
        pokemonDatabase[99] = "Kingler";
        pokemonDatabase[100] = "Voltorb";
        pokemonDatabase[101] = "Electrode";
        pokemonDatabase[102] = "Exeggcute";
        pokemonDatabase[103] = "Exeggutor";
        pokemonDatabase[104] = "Cubone";
        pokemonDatabase[105] = "Marowak";
        pokemonDatabase[106] = "Hitmonlee";
        pokemonDatabase[107] = "Hitmonchan";
        pokemonDatabase[108] = "Lickitung";
        pokemonDatabase[109] = "Koffing";
        pokemonDatabase[110] = "Weezing";
        pokemonDatabase[111] = "Rhyhorn";
        pokemonDatabase[112] = "Rhydon";
        pokemonDatabase[113] = "Chansey";
        pokemonDatabase[114] = "Tangela";
        pokemonDatabase[115] = "Kangaskhan";
        pokemonDatabase[116] = "Horsea";
        pokemonDatabase[117] = "Seadra";
        pokemonDatabase[118] = "Goldeen";
        pokemonDatabase[119] = "Seaking";
        pokemonDatabase[120] = "Staryu";
        pokemonDatabase[121] = "Starmie";
        pokemonDatabase[122] = "Mr. Mime";
        pokemonDatabase[123] = "Scyther";
        pokemonDatabase[124] = "Jynx";
        pokemonDatabase[125] = "Electabuzz";
        pokemonDatabase[126] = "Magmar";
        pokemonDatabase[127] = "Pinsir";
        pokemonDatabase[128] = "Tauros";
        pokemonDatabase[129] = "Magikarp";
        pokemonDatabase[130] = "Gyarados";
        pokemonDatabase[131] = "Lapras";
        pokemonDatabase[132] = "Ditto";
        pokemonDatabase[133] = "Eevee";
        pokemonDatabase[134] = "Vaporeon";
        pokemonDatabase[135] = "Jolteon";
        pokemonDatabase[136] = "Flareon";
        pokemonDatabase[137] = "Porygon";
        pokemonDatabase[138] = "Omanyte";
        pokemonDatabase[139] = "Omastar";
        pokemonDatabase[140] = "Kabuto";
        pokemonDatabase[141] = "Kabutops";
        pokemonDatabase[142] = "Aerodactyl";
        pokemonDatabase[143] = "Snorlax";
        pokemonDatabase[144] = "Articuno";
        pokemonDatabase[145] = "Zapdos";
        pokemonDatabase[146] = "Moltres";
        pokemonDatabase[147] = "Dratini";
        pokemonDatabase[148] = "Dragonair";
        pokemonDatabase[149] = "Dragonite";
        pokemonDatabase[150] = "Mewtwo";
        pokemonDatabase[151] = "Mew";
      }

    /*function createRandomZombie(string memory _name) public payable virtual {
        // Only check for valid payment and name
        require(msg.value >= createFee, "Insufficient payment for zombie creation");
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(bytes(_name).length <= 25, "Name too long");
        
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);

        // Return excess payment
        if (msg.value > createFee) {
            payable(msg.sender).transfer(msg.value - createFee);
        }
    }*/
    function generateNewPokemon(string memory _name, uint pokemonId, address _owner) public payable virtual {
        // Only check for valid payment and name
        require(msg.value >= createFee, "Insufficient payment for new pokemon");
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(bytes(_name).length <= 25, "Name too long");

        //Let the user choose a starter pokemon (bulbasaur, charmander, squirtle, or pikachu) before generating it.
        if(ownerPokemonCount[_owner] == 0)
        {
            require(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Bulbasaur")) ||
            keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Charmander")) ||
            keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Squirtle")) ||
            keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Pikachu")),
            "Invalid starter Pokemon. Please choose from either 'Bulbasaur', 'Charmander', 'Squirtle', or 'Pikachu'.");
        }

        _generatePokemon(_name);

        // Return excess payment
        if (msg.value > createFee)
        {
            payable(msg.sender).transfer(msg.value - createFee);
        }
    }

    /*function _createZombie(string memory _name, uint _dna) internal {
        // Remove all restrictions, just create the zombie
        zombies.push(Zombie(_name, _dna, 1, uint32(block.timestamp + cooldownTime), 0, 0));
        uint id = zombies.length - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
    }*/
    function _generatePokemon(string memory _name) internal {
        // Remove all restrictions, just create the pokemon
        //TODO: need to figure out how to give different pokemon different stats
        pokemons.push(Pokemon(_name, "Rock", 1, uint32(block.timestamp + cooldownTime), 0, 0, 10, 1, 1, 2, 2, 1, "Bite", "Thrash"));
        uint id = pokemons.length - 1;
        pokemonToOwner[id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit NewPokemon(id, _name);
    }

    /*function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str, block.timestamp, msg.sender)));
        return rand % dnaModulus;
    }*/

    /*function getZombiesByOwner(address _owner) external view virtual returns(uint[] memory) {
        uint[] memory result = new uint[](ownerZombieCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < zombies.length; i++) {
            if (zombieToOwner[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }*/
    function getPokemonsByOwner(address _owner) external view virtual returns(uint[] memory) {
        uint[] memory result = new uint[](ownerPokemonCount[_owner]);
        uint counter = 0;
        for(uint i = 0; i < pokemons.length; i++)
        {
            if(pokemonToOwner[i] == _owner)
            {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
}
