require('dotenv').config();
const hre = require("hardhat");

async function main() {
  const Complaints = await hre.ethers.getContractFactory("Complaints");
  const complaints = await Complaints.deploy();
  await complaints.waitForDeployment(); // works for modern hardhat-ethers
  console.log("Contract deployed to:", await complaints.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
