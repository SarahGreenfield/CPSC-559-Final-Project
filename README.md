# Pokemon Battle Arena

A decentralized Pokemon battle game built on Ethereum using Hardhat and React. Battle your Pokemon against others, gain experience, and climb the leaderboard!

## Features

### Blockchain Features
- **NFT-based Pokemon**: Each Pokemon is a unique ERC-721 token on the blockchain
- **Decentralized Ownership**: True ownership of your Pokemon through blockchain technology
- **Smart Contract Battles**: All battles are executed through smart contracts, ensuring fairness and transparency
- **On-chain Experience**: Pokemon experience and stats are stored on the blockchain
- **Battle History**: All battle results are permanently recorded on the blockchain
- **Leaderboard**: Global rankings are calculated from on-chain battle data
- **Token Rewards**: Earn ERC-20 tokens through successful battles
- **Lazy Listing Marketplace**: List your Pokemon for sale without transferring them to the marketplace contract. You can still train, battle, and interact with your Pokemon while they are listed. Ownership only transfers when purchased.

### Game Features
- Mint your own Pokemon
- List and purchase Pokemon on the marketplace
- Battle other players' Pokemon
- Gain experience and level up
- Track your battle history
- View the leaderboard
- Modern, responsive UI

## Prerequisites

- Node.js (v14 or later)
- npm or yarn
- MetaMask wallet
- Local Hardhat node

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd pokemon-battle-arena
```

2. Install dependencies:
```bash
npm install
```

3. Download Pokemon images:
```bash
node scripts/download-pokemon-images.js
```

4. Start the local Hardhat node:
```bash
npx hardhat node
```

5. In a new terminal, deploy the contracts:
```bash
npx hardhat run scripts/deploy.js --network localhost
```

6. Copy contract artifacts to frontend (ensure ABI is up to date!):
```bash
node scripts/copy-artifacts.js
```

7. Start the frontend development server:
```bash
cd frontend
npm install
npm start
```

## Configuration

1. Connect MetaMask to the local Hardhat network:
   - Network Name: Hardhat Local
   - RPC URL: http://127.0.0.1:8545
   - Chain ID: 31337
   - Currency Symbol: ETH

2. Import an account from your Hardhat node into MetaMask:
   - Copy a private key from the Hardhat node output
   - In MetaMask, click "Import Account"
   - Paste the private key

## How to Play

1. **Connect Your Wallet**
   - Click the "Connect Wallet" button
   - Make sure you're connected to the Hardhat network

2. **Get Your Starter Pokemon**
   - Go to the "Pokemon" or "Collection" page
   - Click "Mint Starter Pokemon"
   - Choose your starter Pokemon (Bulbasaur, Charmander, Squirtle, or Pikachu)
   - **If you sell or transfer your only Pokemon, you can mint a new starter!**

3. **List a Pokemon for Sale**
   - Go to the "Marketplace" page
   - Select a Pokemon from your collection
   - Enter a price in tokens
   - Click "List Pokemon"
   - **Your Pokemon stays in your wallet and can still be trained or battled while listed.**

4. **Purchase a Pokemon**
   - Switch to another account (import a different Hardhat account in MetaMask)
   - Go to the "Marketplace" page
   - Click "Purchase" on a listed Pokemon
   - The Pokemon will be transferred to your account

5. **Battle Other Pokemon**
   - Go to the "Battle" page
   - Select your Pokemon and an opponent
   - Click "Start Battle!"
   - Watch the battle unfold and see the results

6. **Track Your Progress**
   - View your Pokemon's stats and experience
   - Check your battle history
   - See where you rank on the leaderboard

## Marketplace Model

- **Lazy Listing**: When you list a Pokemon, it stays in your wallet. You can still train, battle, and interact with it until it is purchased.
- **Purchase**: When another user purchases your listed Pokemon, it is transferred directly from your wallet to theirs.
- **Multiple Listings**: You can list multiple Pokemon, even of the same species, as each is a unique NFT.

## Common Issues & Troubleshooting

1. **Can't connect to wallet**
   - Make sure MetaMask is installed
   - Check that you're connected to the Hardhat network
   - Try refreshing the page

2. **Transaction fails**
   - Check your Hardhat node is running
   - Ensure you have enough ETH in your account
   - Verify your Pokemon has enough stamina
   - Make sure you have enough ERC-20 tokens for purchases (use the "Get Test Tokens" button in the Marketplace)

3. **Pokemon not showing up**
   - Refresh the page
   - Check the console for errors
   - Make sure you've minted a Pokemon
   - If you listed a Pokemon, it will still show in your collection until purchased

4. **Can't mint a starter after selling**
   - You can mint a new starter if you have no Pokemon in your wallet (even if you previously owned one and sold it)
   - If you see an error, make sure your contract and frontend are up to date and synced

5. **Can't purchase a Pokemon (listing not active)**
   - Make sure you are using the correct listing ID (the frontend now uses the correct ID from the contract)
   - Refresh the page to get the latest listings
   - Only the buyer (not the seller) can purchase a listing

6. **ABI or contract errors**
   - If you see errors about missing functions, make sure you have copied the latest contract artifacts to the frontend and restarted your dev server

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License.