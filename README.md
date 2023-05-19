# test-erc20-batch-transfer

Compare standard Openzeppelin ERC20 contracts transfer via multiple single transfers with via [mds1/multicall](https://github.com/mds1/multicall). The result is as follows:

![image](https://github.com/WEI-NERD/test-erc20-batch-transfer/assets/131971450/99a40a40-0c24-4c4b-bf73-e6233697f21f)

The test result is somewhat wrong because in Foundry test, the single transfer is done in a single test function, so that the slot is warm except for the first transfer, causing the rest transfer save some gas.
