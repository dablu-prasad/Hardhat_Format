require('@nomiclabs/hardhat-waffle');
require('@nomiclabs/hardhat-etherscan');
require('dotenv').config();

const { RINKEBY_API_URL, PRIVATE_KEY, ETHERSCAN_KEY } = process.env;

module.exports = {
  solidity: '0.8.7',
  networks: {
    rinkeby: {
      url: "https://rinkeby.infura.io/v3/04132d4001834221a021b8e2eac7766c",
      accounts: [`615a1eb9b6f7ac0a980ea60bbf6cc24e56b2fe96b665c0e8113ac5a89ee8ef2f`],
    },
  },
  // etherscan: {
  //   apiKey: ETHERSCAN_KEY,
  // },
};