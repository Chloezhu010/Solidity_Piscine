# Solidity_Piscine
42 piscine-style solidity learning

## Overview
A comprehensive 13-project learning path designed to take you from Solidity basics to advanced DeFi development. Each project builds upon the previous ones, creating a complete understanding of Ethereum smart contract development.

## Schedule

### Module 00: Foundation (2 exercises)
**Duration:** 3-5 days

#### P00 - Hello Ethereum
- **Level:** Easy
- **Duration:** 1-2 days
- **Objective:** Set up development environment and deploy first smart contract
- **Learning Goals:**
  - Install and configure Foundry, Hardhat, and MetaMask
  - Write, compile, and test basic Solidity contracts
  - Deploy to Sepolia testnet and verify on Etherscan
  - Understand dApp development workflow

#### P01 - My First Token
- **Level:** Easy
- **Duration:** 2-3 days
- **Objective:** Create and deploy ERC20 token with mint/burn functionality
- **Learning Goals:**
  - Understand ERC20 standard
  - Use OpenZeppelin contracts
  - Add custom functionality to tokens
  - Write unit tests for token behavior

### Module 01: Core Concepts (2 exercises)
**Duration:** 7-9 days

#### P02 - Vault Lockbox
- **Level:** Intermediate
- **Duration:** 3-4 days
- **Objective:** Create time-locked vault for ETH deposits
- **Learning Goals:**
  - Work with structs and mappings
  - Use block.timestamp for time-based conditions
  - Emit and handle events
  - Implement reentrancy protection

#### P03 - Mini Auction (NFT Sale)
- **Level:** Intermediate
- **Duration:** 4-5 days
- **Objective:** Build English auction for ERC721 NFTs
- **Learning Goals:**
  - Transfer and manage ERC721 tokens
  - Implement bidding logic with refunds
  - Secure ETH handling with pull payments
  - Handle auction finalization

### Module 02: DeFi Fundamentals (3 exercises)
**Duration:** 11-14 days

#### P04 - DEX 101 (Uniswap v1-style AMM)
- **Level:** Intermediate-Advanced
- **Duration:** 5-6 days
- **Objective:** Build constant-product Automated Market Maker
- **Learning Goals:**
  - Understand AMM mechanics and swap pricing math
  - Implement liquidity provision with LP tokens
  - Manage ETH-ERC20 pools with constant-product invariants
  - Handle slippage and frontrunning risks

#### P05 - Staking Pool
- **Level:** Intermediate
- **Duration:** 4-5 days
- **Objective:** Build staking pool for earning reward tokens
- **Learning Goals:**
  - Understand staking and reward accrual
  - Work with proportional reward distribution
  - Implement claiming and withdrawal safely
  - Use checkpointing for gas optimization

#### P06 - Chainlink Price Oracle
- **Level:** Intermediate
- **Duration:** 2-3 days
- **Objective:** Integrate Chainlink price feeds for USD valuation
- **Learning Goals:**
  - Fetch and use external data in Solidity
  - Understand Chainlink AggregatorV3Interface
  - Safely integrate oracle-based pricing
  - Handle oracle data freshness

### Module 03: Advanced DeFi (3 exercises)
**Duration:** 16-21 days

#### P07 - Lending Pool (Aave-lite)
- **Level:** Advanced
- **Duration:** 6-8 days
- **Objective:** Implement simplified lending protocol with liquidation
- **Learning Goals:**
  - Understand overcollateralized lending
  - Calculate health factors and manage positions
  - Implement liquidation mechanics
  - Integrate price oracles for collateral valuation

#### P08 - Flash Loan Executor
- **Level:** Advanced
- **Duration:** 4-5 days
- **Objective:** Implement flash loan provider and borrower for arbitrage
- **Learning Goals:**
  - Understand atomic transactions
  - Implement flash loans with fees
  - Simulate arbitrage between AMMs
  - Ensure atomic repayment

#### P09 - Yield Aggregator (Yearn v1-style)
- **Level:** Advanced
- **Duration:** 6-8 days
- **Objective:** Build vault that automatically compounds yield
- **Learning Goals:**
  - Understand vault mechanics and share-based accounting
  - Implement harvesting and reinvestment strategies
  - Manage proportional share value growth
  - Protect against flash-loan inflations

### Module 04: Frontend & Analytics (2 exercises)
**Duration:** 9-11 days

#### P10 - React Frontend for My DEX
- **Level:** Intermediate
- **Duration:** 4-5 days
- **Objective:** Build React interface for AMM from P04
- **Learning Goals:**
  - Connect smart contracts to frontend
  - Use Ethers.js to read/write on-chain data
  - Build user-friendly DApp UI
  - Handle transaction status and errors

#### P11 - Analytics Dashboard
- **Level:** Advanced
- **Duration:** 5-6 days
- **Objective:** Use TheGraph to index DEX data and build analytics
- **Learning Goals:**
  - Build subgraphs to index on-chain events
  - Query subgraphs in frontend
  - Visualize DeFi metrics
  - Design efficient data structures

### Module 05: MEV & Security (2 exercises)
**Duration:** 9-11 days

#### P12 - MEV Simulation & Sandwich Detection
- **Level:** Advanced
- **Duration:** 4-5 days
- **Objective:** Simulate sandwich attacks and implement protections
- **Learning Goals:**
  - Understand MEV and frontrunning mechanics
  - Write scripts simulating MEV attacks
  - Implement basic anti-MEV measures
  - Analyze Flashbots architecture

#### P13 - MEV-Protected DEX
- **Level:** Advanced
- **Duration:** 5-6 days
- **Objective:** Implement anti-MEV trading mechanism
- **Learning Goals:**
  - Design commit-reveal transactions
  - Understand trade-offs between latency and MEV protection
  - Explore MEV-resistant DEX models
  - Compare with Uniswap v3 strategies

## Total Timeline
- **Total Duration:** 55-71 days
- **Projects:** 13
- **Modules:** 6
- **Difficulty Progression:** Easy → Intermediate → Advanced

## Learning Path Summary
1. **Foundation (Module 00):** Environment setup and basic token creation
2. **Core Concepts (Module 01):** Time-locks, auctions, and event handling
3. **DeFi Fundamentals (Module 02):** AMMs, staking, and oracle integration
4. **Advanced DeFi (Module 03):** Lending, flash loans, and yield aggregation
5. **Frontend & Analytics (Module 04):** Web3 frontends and data visualization
6. **MEV & Security (Module 05):** MEV protection and advanced security

## Technologies Covered
- **Development:** Foundry, Hardhat, Solidity
- **Standards:** ERC20, ERC721
- **Libraries:** OpenZeppelin
- **Oracles:** Chainlink
- **Frontend:** React, Ethers.js
- **Analytics:** TheGraph
- **Security:** MEV protection, reentrancy guards

## Prerequisites
- Basic programming knowledge
- Understanding of blockchain concepts
- Familiarity with JavaScript/TypeScript (for frontend modules)

## Reference
- https://solidity-by-example.org/hello-world/
- https://learnweb3.io/degrees/ethereum-developer-degree/
- https://www.youtube.com/watch?v=gyMwXuJrbJQ&t=2842s