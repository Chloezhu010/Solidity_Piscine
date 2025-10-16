# Deployment
## Deployed contract address
- HelloEthereum deployed to: 0x20Cf32df33AD34208fa6B1813aDB341822362896
## Steps to delopy and verify
- Prerequisites
    - .env config
    - Foundry setup
- Deploy HelloEthereum contract through script: Deploy.s.sol 
    - Deploy cmd: `forge script script/Deploy.s.sol:Deploy --rpc-url sepolia --broadcast`
    - Key output
        ```
        ## Setting up 1 EVM.

        ==========================

        Chain 11155111

        Estimated gas price: 0.548699174 gwei

        Estimated total gas used for script: 341021

        Estimated amount required: 0.000187117941016654 ETH

        ==========================

        ##### sepolia
        ✅  [Success] Hash: 0xcf333bb468530d71cec7d9738141a20f0e5c71ec9f92ce4f24ca4f8ccea48ec5
        Contract Address: 0x20Cf32df33AD34208fa6B1813aDB341822362896
        Block: 9013099
        Paid: 0.000091332989794712 ETH (262324 gas * 0.348168638 gwei)

        ✅ Sequence #1 on sepolia | Total Paid: 0.000091332989794712 ETH (262324 gas * avg 0.348168638 gwei)                                                                                  
        ```
- Update .env file with newly deployed contract address
- Update the message by deploying UpdateMsg script
    - Deploy cmd: `forge script script/UpdateMsg.s.sol:UpdateMsg --rpc-url sepolia --broadcast`
    - Output
        ```
        ## Setting up 1 EVM.

        ==========================

        Chain 11155111

        Estimated gas price: 0.188718469 gwei

        Estimated total gas used for script: 37818

        Estimated amount required: 0.000007136955060642 ETH

        ==========================

        ##### sepolia
        ✅  [Success] Hash: 0xbc3146d385360af5773a1624d761cd2e2d9568a22e312d04678356857feea3b2
        Block: 9013166
        Paid: 0.00000266434960708 ETH (27380 gas * 0.097310066 gwei)

        ✅ Sequence #1 on sepolia | Total Paid: 0.00000266434960708 ETH (27380 gas * avg 0.097310066 gwei)
        ```
- Verify the transactions on sepolia etherscan
    - Deploy HelloEthereum tx: https://sepolia.etherscan.io/tx/0xcf333bb468530d71cec7d9738141a20f0e5c71ec9f92ce4f24ca4f8ccea48ec5
    - Update message tx: https://sepolia.etherscan.io/tx/0xbc3146d385360af5773a1624d761cd2e2d9568a22e312d04678356857feea3b2
## Notes
### What's forge, cast, anvil
- Forge: smart contract dev and testing framework
    - compile smart contracts
    - run tests
    - manage dependencies and lib
    - generate gas reports
    - deploy contracts to network
    - key commands
    ```
    forge build          # compile contracts
    forge test           # run tests
    forge install        # install dependencies
    forge create         # deploy contracts
    forge verify-contract # verify on Etherscan
    ```
- Cast: cmd line tool for ethereum rpc calls
    - query blockchain data
    - call contract functions
    - send txns
    - convert between format (hex, decimal, units)
    - generate wallets and signatures
    - key commands
    ```
    cast balance 0x123...              # check ETH balance
    cast call <contract> "balanceOf(address)" <address>  # call view function
    cast send <contract> "transfer(address,uint256)" <to> <amount>  # send transaction
    cast to-wei 1 ether                # convert 1 ETH to wei
    cast block latest                  # get latest block info
    ```
- Anvil: local ethereum node for development
    - fast local blockchain
    - pre-funded test accounts
    - fork mainnet locally for testing vs real state
    - no gas costs for testing
    - key commands
    ```
    anvil                              # start local node
    anvil --fork-url <RPC_URL>         # fork mainnet locally
    anvil --accounts 20                # create 20 test accounts
    anvil --balance 10000              # give each account 10k ETH
    ```
### Data location in solidity - storage, memory, calldata
- Ref: https://solidity-by-example.org/data-locations/
- Storage: permanent onchain storage
    - Most expensive: c.20k gas to write, c.5k gas to modify
    - Use for: Contract state var that need to persist
- Memory: temp in-memory storage
    - Temp: only exists during function execution
    - Moderate cost: c. 3 gas per 32-byte word
    - Mutable: can be modified within the function
    - Use for: Function parameters, local var, temp data
- Calldata: read-only function input data
    - Cheapest: no copying cost, direct access to tx data
    - External only: only be used for external/ public function parameters
    - Use for: Function parameters you don't need to modify
### Useful cmd
- For compilation: `forge build`
- Deployment of HelloEthereum on sepolia: 
`forge script script/Deploy.s.sol:Deploy --rpc-url sepolia --broadcast`
- Verify if the contract actually deployed to sepolia: 
`cast code <Contract address> --rpc-url sepolia`

