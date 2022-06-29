
const hre = require("hardhat");
const ethers = require("ethers");
async function main() {
  const Greeter = await hre.ethers.getContractFactory("Greeter");
  const greeter = await Greeter.deploy("Hello, Hardhat!");

  await greeter.deployed();

  console.log("Greeter deployed to:", greeter.address);

  //DappToken contract

  const DappToken = await hre.ethers.getContractFactory("DappToken");
  const dapptoken = await DappToken.deploy();

  await dapptoken.deployed();

  console.log("DappToken deployed to:", dapptoken.address);

  //DappTokenSale contract

  const DappTokenSale = await hre.ethers.getContractFactory("DappTokenSale");
  const dapptokensale = await DappTokenSale.deploy(dapptoken.address);

  await dapptokensale.deployed();

  console.log("DappTokenSale deployed to:", dapptokensale.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
  
});
