import {expect} from 'chai'

describe('tests to verify the mandatory functions of the contract', () => {
  let Shitcoin, shitcoin;

  beforeEach(async function () {
      Shitcoin = await ethers.getContractFactory("Shitcoin");
      // [owner, addr1, addr2] = await ethers.getSigners();

      shitcoin = await Shitcoin.deploy();
      await shitcoin.deployed();
  });

  it('should get valid name', async () => {
    expect(await shitcoin.name()).to.be("shitcoin")
  })
})

describe('tests to verify the optional functions of the contract', () => {
  let Shitcoin, shitcoin;

  beforeEach(async function () {
      Shitcoin = await ethers.getContractFactory("Shitcoin");
      // [owner, addr1, addr2] = await ethers.getSigners();

      // Деплоим контракт
      shitcoin = await Shitcoin.deploy();
      await shitcoin.deployed();
  });
})

