const { ethers } = require("hardhat");

const main = async () => {
  try {
    const user = (await ethers.getSigners())[0];

    const packingF = await ethers.getContractFactory("PackingVariable");
    const packing = await packingF.deploy();

    const key = ethers.utils.keccak256(ethers.utils.toUtf8Bytes("Storage1"));

    await packing.encodeWithKey(
      key,
      123456,
      11,
      "0xb9EDE6f94D192073D8eaF85f8db677133d483249",
      78910
    );

    const res = await packing.decodeWithKey(key);
    console.log(res);
  } catch (error) {
    throw new Error(error?.message);
  }
};

main();
