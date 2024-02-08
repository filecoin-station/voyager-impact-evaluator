// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Voyager.sol";

contract VoyagerTest is Test {
    function test_Constructor() public {
        Voyager voyager = new Voyager(address(this));
        assertEq(voyager.nextRoundLength(), 40);
        assertEq(voyager.roundReward(), 0.456621004566210045 ether);
    }

    function test_AddMeasurements() public {
        Voyager voyager = new Voyager(address(this));
        voyager.addMeasurements("cid");
    }

    function test_AddMeasurementsNotSensor() public {
        Voyager voyager = new Voyager(address(this));
        voyager.revokeRole(
            voyager.MEASURE_ROLE(),
            address(this)
        );
        vm.expectRevert("Not a sensor");
        voyager.addMeasurements("cid");
    }
}
