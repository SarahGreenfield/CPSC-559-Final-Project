const hre = require("hardhat");

async function main() {
  // Deploy Token contract
  const Token = await hre.ethers.getContractFactory("Token");
  const token = await Token.deploy();
  await token.deployed();
  console.log("Token deployed to:", token.address);

  // Deploy Pokemon contract
  const Pokemon = await hre.ethers.getContractFactory("Pokemon");
  const pokemon = await Pokemon.deploy();
  await pokemon.deployed();
  console.log("Pokemon deployed to:", pokemon.address);

  // Deploy Battle contract
  const Battle = await hre.ethers.getContractFactory("Battle");
  const battle = await Battle.deploy(pokemon.address);
  await battle.deployed();
  console.log("Battle deployed to:", battle.address);

  // Set up contract relationships
  await token.setBattleContract(battle.address);
  console.log("Battle contract set in Token contract");

  // Add Battle contract as authorized minter
  await token.addAuthorizedMinter(battle.address);
  console.log("Battle contract added as authorized minter");

  // Authorize Battle contract to call addExperience on Pokemon contract
  await pokemon.addAuthorizedContract(battle.address);
  console.log("Battle contract authorized to call addExperience on Pokemon contract");

  // Save contract addresses to a file for frontend use
  const fs = require("fs");
  const contracts = {
    token: token.address,
    pokemon: pokemon.address,
    battle: battle.address,
  };
  fs.writeFileSync(
    "frontend/src/contracts/contract-addresses.json",
    JSON.stringify(contracts, null, 2)
  );
  console.log("Contract addresses saved to frontend/src/contracts/contract-addresses.json");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 