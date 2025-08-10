# Deployment
## Deployed contract address
## Steps to delopy and verify
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
