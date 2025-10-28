require('dotenv').config();
require("@nomiclabs/hardhat-ethers"); // ensure plugin installed

const { PRIVATE_KEY, RPC_URL } = process.env;

module.exports = {
  solidity: "0.8.19",
  networks: {
    sepolia: {
      url: RPC_URL || "http://127.0.0.1:8545/",
      accounts: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 ? [0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266] : []
    }
  }
};
