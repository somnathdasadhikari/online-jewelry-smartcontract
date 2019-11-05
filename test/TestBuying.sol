pragma solidity >=0.4.22 <0.6.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Buying.sol";


contract TestBuying {

 Buying buying = Buying(DeployedAddresses.Buying());
 uint expectedJwelleryId = 8;
 address expectedBuyer = address(this);

    function testUserCanBuyItem() public {
        uint returnedId = buying.buy(expectedJwelleryId);
        Assert.equal(returnedId, expectedJwelleryId, "Buying of Item ID 8 should be recorded.");
    }
    function testGetBuyerAddressByItemId() public {
        address buyer = buying.buyers(expectedJwelleryId);
        Assert.equal(buyer, expectedBuyer, "Owner of Item ID 8 should be recorded.");
    }

    function testGetBuyerAddressByItemIdInArray() public {
        address[16] memory buyers = buying.getBuyers();
        Assert.equal(buyers[expectedJwelleryId], expectedBuyer, "Owner of Item ID 8 should be recorded.");
    }

}