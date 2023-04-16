// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Test {
    bytes public constant PAYLOAD = "\x01\x02\x03\x04";
    uint256 public constant RANDOM = 1235799133619433781463787136473281249823;
    
    function separate(bytes calldata _payload) public pure returns (bytes memory) {
        bytes memory test = _payload[2:4];
        return test;
    }

    function encodeVRF() public pure returns (bytes memory) {
        return abi.encodePacked(RANDOM);
    }

    function decodeVRF(bytes memory _encoded) public pure returns (uint256) {
        return uint256(bytes32(_encoded));
    }


}