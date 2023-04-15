// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BilkentBlockchainLottery is Ownable, VRFConsumerBaseV2 {
    VRFCoordinatorV2Interface COORDINATOR;
    uint64 subscriptionId;

    //Fuji testnet
    address vrfCoordinator = 0x2eD832Ba664535e5886b75D64C46EB9a228C2610;
    bytes32 private keyHash = 0x354d2f95da55398f44b7cff77da56283d9c6c829a4bdf1bbcaf2ad6a4d081f61;
    uint16 private requestConfirmations = 5;

    uint256 public lastRandomWord;
    uint32 private callbackGasLimit = 100000;
    uint32 private numWords = 1;

    constructor(uint64 _subscriptionId) VRFConsumerBaseV2(vrfCoordinator) {
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        subscriptionId = _subscriptionId;
    }

    function requestRandomWords() external onlyOwner {
        COORDINATOR.requestRandomWords(
        keyHash,
        subscriptionId,
        requestConfirmations,
        callbackGasLimit,
        numWords
        );  
    }

    function changeSubscriptionId(uint64 _newId) external onlyOwner {
        subscriptionId = _newId;
    }

    function fulfillRandomWords(
        uint256, /* requestID */
        uint256[] memory randomWords
    ) internal override {
        lastRandomWord = randomWords[0];
    }
}