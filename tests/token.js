import { expect } from "chai";

describe("💩 Shitcoin: Basic functions from erc20", function () {
    let Shitcoin, shitcoin, owner, addr1, addr2;

    beforeEach(async function () {
        Shitcoin = await ethers.getContractFactory("Shitcoin");

        [owner, addr1, addr2] = await ethers.getSigners();

        shitcoin = await Shitcoin.deploy();
    });

    it('', () => {})
});

describe("💩 Shitcoin: Optional functions from erc20", () => {
    let Shitcoin, shitcoin, owner, addr1, addr2;

    beforeEach(async function () {
        Shitcoin = await ethers.getContractFactory("Shitcoin");

        [owner, addr1, addr2] = await ethers.getSigners();

        shitcoin = await Shitcoin.deploy();
    });

  it('> should get the correct full name of the token', async () => {
    const name = await shitcoin.name();
    expect(name).to.equal("shitcoin")
  });

  it('> should get the correct short name of the token', async () => {
    const shortName = await shitcoin.symbol();
    expect(shortName).to.equal("SHT")
  });

  it('> should get the correct decimal', async () => {
    const decimal = await shitcoin.decimal();
    expect(decimal).to.equal(18)
  });

  it('> should get total supply', async () => {
    const total = await shitcoin.totalSupply();
    expect(total).to.equal(10000)
  });

})
