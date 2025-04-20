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

### Game Features
- Mint your own Pokemon
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

6. Copy contract artifacts to frontend:
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
   - Go to the "Pokemon" page
   - Click "Mint Starter Pokemon"
   - Choose your starter Pokemon (Bulbasaur, Charmander, Squirtle, or Pikachu)

3. **Battle Other Pokemon**
   - Go to the "Battle" page
   - Select your Pokemon from the dropdown
   - Choose an opponent from the available Pokemon
   - Click "Start Battle!"
   - Watch the battle unfold and see the results

4. **Track Your Progress**
   - View your Pokemon's stats and experience
   - Check your battle history
   - See where you rank on the leaderboard

## Game Mechanics

- Each Pokemon has:
  - Level
  - Experience
  - Attack
  - Defense
  - Speed
  - Stamina

- Battle System:
  - Winner gains 100 experience
  - Loser gains 50 experience
  - Each battle costs 20 stamina
  - Stamina regenerates over time

## Scripts

The project includes several utility scripts:

1. `deploy.js` - Deploys all smart contracts and sets up their relationships
2. `download-pokemon-images.js` - Downloads Pokemon images for the frontend
3. `copy-artifacts.js` - Copies contract artifacts to the frontend

## Troubleshooting

1. **Can't connect to wallet**
   - Make sure MetaMask is installed
   - Check that you're connected to the Hardhat network
   - Try refreshing the page

2. **Transaction fails**
   - Check your Hardhat node is running
   - Ensure you have enough ETH in your account
   - Verify your Pokemon has enough stamina

3. **Pokemon not showing up**
   - Refresh the page
   - Check the console for errors
   - Make sure you've minted a Pokemon

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License.