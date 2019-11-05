pragma solidity >=0.4.22 <0.6.0;


contract Buying {
    address[16] public buyers;

    function buy(uint itemId) public returns (uint) {
        require(itemId >= 0 && itemId <= 15, 'jwellery id must be within the range of 16');
        buyers[itemId] = msg.sender;
        return itemId;
    }

    function getBuyers() public view returns (address[16] memory) {
        return buyers;
    }

}