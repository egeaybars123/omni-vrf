// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


//Example VRF output from Fuji:
// Output 1: 33405836196948171851971772418622568822588926877272986533527532040470265723372
// Output 2: 75037952575285804669523403034031163664743652354934322085543724670668253884917
// Destination contract address: 0xd9145CCE52D386f254917e481eB44e9943F39138

contract Test {
    bytes public constant PAYLOAD = "0xd9145CCE52D386f254917e481eB44e9943F391383340583619694817185197177241862256882258892687727298653352753204047026572337";
    uint256 public constant RANDOM = 1235799133619433781463787136473281249823;
    
    function separate(bytes calldata _payload, uint range) public pure returns (bytes memory) {
        //bytes memory test = _payload.push;
        return _payload[:range];
    }

    function decodeMessage(bytes calldata _payload) public pure returns (address a, uint256 b) {
        (a, b) = abi.decode(_payload, (address, uint256));
    }

    //Consider using bytes array for multiple VRF output messaging.
    function encodeMessage(address destAddr, uint256 vrfOut) public pure returns(bytes memory) {
        return abi.encode(destAddr, vrfOut);
    }

    function encodeVRF() public pure returns (bytes memory) {
        return abi.encodePacked(RANDOM);
    }

    function decodeVRF(bytes memory _encoded) public pure returns (uint256) {
        return uint256(bytes32(_encoded));
    }


}