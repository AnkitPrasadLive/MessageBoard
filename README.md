

# MessageBoard

A simple on-chain message board built with **Solidity** and developed using **Foundry**.
The contract stores a single public message that can be updated by any address, emitting an event on every change so updates can be tracked off-chain.

This project is intended as a minimal example of a state-changing smart contract and a good starting point for learning Foundry workflows.

---

## Features

* Stores a public message on-chain
* Anyone can update the message
* Emits an event whenever the message is changed
* Tracks the deployer as the contract owner
* Built and deployed using **Foundry**

---

## Tech Stack

* **Solidity ^0.8.19**
* **Foundry (forge / cast / anvil)**

---

## Project Structure

```
.
├── src/            # Smart contracts
├── script/         # Deployment scripts
├── test/           # Tests
├── foundry.toml
└── README.md
```

---

## Requirements

* [Foundry](https://book.getfoundry.sh/) installed
* Node.js (optional, for frontend or scripting)
* An Ethereum RPC endpoint (local or testnet)
* A funded wallet for deployment

---

## Installation

Clone the repository and install dependencies:

```bash
git clone <your-repo-url>
cd message-board
forge install
```

---

## Build

Compile the contracts:

```bash
forge build
```

---

## Test

Run the test suite:

```bash
forge test
```

---

## Deploy

### Local Deployment (Anvil)

1. Start a local node:

   ```bash
   anvil
   ```

2. Deploy the contract:

   ```bash
   forge script script/Deploy.s.sol \
     --rpc-url http://localhost:8545 \
     --broadcast
   ```

---

### Testnet Deployment (Example: Sepolia)

1. Set environment variables:

   ```bash
   export RPC_URL=<your_rpc_url>
   export PRIVATE_KEY=<your_private_key>
   ```

2. Deploy:

   ```bash
   forge script script/Deploy.s.sol \
     --rpc-url $RPC_URL \
     --private-key $PRIVATE_KEY \
     --broadcast \
     --verify
   ```

---

## Usage

* Read the current message using the public getter
* Update the message by sending a transaction to the setter function
* Listen for emitted events to track message changes in a frontend or indexer

---

## Future Improvements

* Restrict updates to the owner
* Add message history storage
* Build a frontend using ethers.js or viem
* Add gas optimizations

---

## License

MIT

---

