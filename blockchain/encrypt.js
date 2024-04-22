const { ethers } = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();

async function main() {
  const wallet = new ethers.Wallet(process.env.private_key);
  const encryptedJsonKey = await wallet.encrypt(
    process.env.private_key_password
  );
  fs.writeFileSync("./.encryptedKey.json",encryptedJsonKey);
  console.log(encryptedJsonKey);
}
main().then(()=>process.exit(0)).catch((error)=>{console.error(error);process.exit(0);});
