// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "../src/Qui_QUIZ.sol";

contract QuiQUIZTest is Test {
    Qui_QUIZ public quiquiz;
    address attacker;
    using stdStorage for StdStorage;
    bytes32 storageContent;

    function setUp() public {
        // Creates mainnet fork
        string memory MAINNET_RPC_URL = vm.envString("MAINNET_RPC_URL");
        vm.createSelectFork(MAINNET_RPC_URL);

        // Define Attacker address
        attacker = address(
            0x0000000000000000000000000000000000000000000000000000000000009999
        );
        vm.label(attacker, "Attacker");
        vm.deal(attacker, 2 ether);

        // Loads Qui_QUIZ contract from mainnet
        quiquiz = Qui_QUIZ(0xCdB4164860d8f0670C9c05F1Fbb74CAFc021E6c5);

        // Checks balances
        assertEq(attacker.balance, 2 ether);
        console2.log("Quizquiz balance: ", address(quiquiz).balance);

        // Read Storage
        // bytes32 storageContent = stdstore.read_bytes32();
        // emit log_named_bytes32("storageContent",storageContent);
    }

    function testStorage() public {
        // Read Storage
        storageContent = stdstore.target(address(quiquiz)).find().read_bytes32();
        emit log_named_bytes32("storageContent", storageContent);
    }
    //bytes32 storageContent = stdstorage.read_bytes32(0);
    //bytes32 storageContent = stdstore.read_bytes32();
    //console2.log("storageContent: ", storageContent);
    //.target(address(quiquiz))
    //.find(address(quiquiz).responseHash.selector)
    //.read_bytes32();
    // .target(address(quiquiz))
    // .sig("playerToCharacter(address)")
    // .with_key(address(this))
    // .depth(1)
    // .checked_write(120);
    //}

    // function testTry() public {
    //     vm.prank(attacker);
    //     quiquiz.Try{value: 1.1 ether}("Good Morning");
    //     //assertEq(counter.number(), 1);
    // }

    // bytes32 responseHash;
    // guessedResponseHash = keccak256(abi.encode(_response)

    // mapping (bytes32=>bool) admin;
    // admin[keccak256(abi.encodePacked(msg.sender))]

    // if(responseHash == keccak256(abi.encode(_response)) && msg.value > 1 ether)

    // function testIncrement() public {
    //     counter.increment();
    //     assertEq(counter.number(), 1);
    // }

    // function testSetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
