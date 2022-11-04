const { ethers } = require("hardhat");
require("dotenv").config({path: ".env"});

async function main(){
    // use the contractFactory to fetch the contract to deploy
    const messageContract = await ethers.getContractFactory("Message");

    // deploy the contract
    const deployMessageContract = await messageContract.deploy();

    // log our the contract address
    console.log(
        "Message contract address", deployMessageContract.address
    );
}

main().then(()=>process.exit(0)).catch((error)=>{
    console.error(error);
    process.exit(1)
})


// Message contract address 0x5FbDB2315678afecb367f032d93F642f64180aa3