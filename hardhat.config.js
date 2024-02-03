require("@nomicfoundation/hardhat-toolbox");
require("dotenv").configDotenv()

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    // for mainnet
    "blast-mainnet": {
      url: "",
      accounts: [process.env.PRIVATE_KEY],
      gasPrice: 1000000000,
    },
    // for Sepolia testnet
    "blast-sepolia": {
      url: "https://sepolia.blast.io",
      accounts: [process.env.PRIVATE_KEY],
      gasPrice: 1000000000,
    },
  },
  defaultNetwork: "blast-sepolia"
};
