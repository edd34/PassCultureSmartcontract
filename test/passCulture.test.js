const { accounts, contract } = require('@openzeppelin/test-environment');
const Web3 = require('web3');
const { assert } = require('chai');
const { expectRevert, expectEvent, balance } = require('@openzeppelin/test-helpers');
const PassCulture = contract.fromArtifact('PassCulture'); // Loads a compiled contract
const ether = 10 ** 18; // 1 ether = 1000000000000000000 wei
const [owner, alice, bob] = accounts;

describe("PassCulture", () => {
    it("", async () => {
        passCulture = await PassCulture.new({ from: owner });
        assert.isTrue(true);
        // assert.isTrue(await bank.isEnrolled(owner, { from: owner }))
        // const balanceOwner = await bank.getBalance({ from: owner })
        // assert.equal(balanceOwner.toNumber(), 0)
    });
});