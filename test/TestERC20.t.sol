// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {Multicall3} from "multicall/Multicall3.sol";
import {TestERC20} from "src/TestERC20.sol";

contract TestERC20Test is Test {
    TestERC20 internal _testERC20;
    Multicall3 public multicall;
    uint256 totalAmount = 1e6 * 1e18;

    function setUp() public {
        _testERC20 = new TestERC20();
        multicall = new Multicall3();
        deal(address(_testERC20), address(this), totalAmount);
    }

    function test_SingleTransfer_1_5() public {
        vm.pauseGasMetering();
        uint256 count = 5;
        uint256 amount = totalAmount / count;
        vm.resumeGasMetering();

        for (uint256 i; i < count;) {
            _testERC20.transfer(vm.addr(i + 1), amount);
            unchecked {
                ++i;
            }
        }
    }

    function test_SingleTransfer_2_10() public {
        vm.pauseGasMetering();
        uint256 count = 10;
        uint256 amount = totalAmount / count;
        vm.resumeGasMetering();

        for (uint256 i; i < count;) {
            _testERC20.transfer(vm.addr(i + 1), amount);
            unchecked {
                ++i;
            }
        }
    }

    function test_SingleTransfer_3_30() public {
        vm.pauseGasMetering();
        uint256 count = 30;
        uint256 amount = totalAmount / count;
        vm.resumeGasMetering();

        for (uint256 i; i < count;) {
            _testERC20.transfer(vm.addr(i + 1), amount);
            unchecked {
                ++i;
            }
        }
    }

    function test_SingleTransfer_4_50() public {
        vm.pauseGasMetering();
        uint256 count = 50;
        uint256 amount = totalAmount / count;
        vm.resumeGasMetering();

        for (uint256 i; i < count;) {
            _testERC20.transfer(vm.addr(i + 1), amount);
            unchecked {
                ++i;
            }
        }
    }

    function test_SingleTransfer_5_100() public {
        vm.pauseGasMetering();
        uint256 count = 100;
        uint256 amount = totalAmount / count;
        vm.resumeGasMetering();

        for (uint256 i; i < count;) {
            _testERC20.transfer(vm.addr(i + 1), amount);
            unchecked {
                ++i;
            }
        }
    }

    function test_BatchTransfer_1_5_Optimized() public {
        vm.pauseGasMetering();
        uint256 count = 5;
        uint256 amount = totalAmount / count;
        Multicall3.Call[] memory calls = new Multicall3.Call[](count);
        for (uint256 i; i < count; ++i) {
            calls[i] = Multicall3.Call({
                target: address(_testERC20),
                callData: abi.encodeWithSelector(_testERC20.transfer.selector, vm.addr(i + 1), amount)
            });
        }
        vm.resumeGasMetering();
        _testERC20.transfer(address(multicall), totalAmount);
        multicall.aggregate(calls);
    }

    function test_BatchTransfer_5_100_Optimized() public {
        vm.pauseGasMetering();
        uint256 count = 100;
        uint256 amount = totalAmount / count;
        Multicall3.Call[] memory calls = new Multicall3.Call[](count);
        for (uint256 i; i < count; ++i) {
            calls[i] = Multicall3.Call({
                target: address(_testERC20),
                callData: abi.encodeWithSelector(_testERC20.transfer.selector, vm.addr(i + 1), amount)
            });
        }
        vm.resumeGasMetering();
        _testERC20.transfer(address(multicall), totalAmount);
        multicall.aggregate(calls);
    }

    function test_BatchTransfer_1_5() public {
        vm.pauseGasMetering();
        uint256 count = 5;
        uint256 amount = totalAmount / count;
        Multicall3.Call[] memory calls = new Multicall3.Call[](count);
        for (uint256 i; i < count; ++i) {
            calls[i] = Multicall3.Call({
                target: address(_testERC20),
                callData: abi.encodeWithSelector(_testERC20.transferFrom.selector, address(this), vm.addr(i + 1), amount)
            });
        }
        vm.resumeGasMetering();
        _testERC20.approve(address(multicall), totalAmount);
        multicall.aggregate(calls);
    }

    function test_BatchTransfer_2_10() public {
        vm.pauseGasMetering();
        uint256 count = 10;
        uint256 amount = totalAmount / count;
        Multicall3.Call[] memory calls = new Multicall3.Call[](count);
        for (uint256 i; i < count; ++i) {
            calls[i] = Multicall3.Call({
                target: address(_testERC20),
                callData: abi.encodeWithSelector(_testERC20.transferFrom.selector, address(this), vm.addr(i + 1), amount)
            });
        }
        vm.resumeGasMetering();
        _testERC20.approve(address(multicall), totalAmount);
        multicall.aggregate(calls);
    }

    function test_BatchTransfer_3_30() public {
        vm.pauseGasMetering();
        uint256 count = 30;
        uint256 amount = totalAmount / count;
        Multicall3.Call[] memory calls = new Multicall3.Call[](count);
        for (uint256 i; i < count; ++i) {
            calls[i] = Multicall3.Call({
                target: address(_testERC20),
                callData: abi.encodeWithSelector(_testERC20.transferFrom.selector, address(this), vm.addr(i + 1), amount)
            });
        }
        vm.resumeGasMetering();
        _testERC20.approve(address(multicall), totalAmount);
        multicall.aggregate(calls);
    }

    function test_BatchTransfer_4_50() public {
        vm.pauseGasMetering();
        uint256 count = 50;
        uint256 amount = totalAmount / count;
        Multicall3.Call[] memory calls = new Multicall3.Call[](count);
        for (uint256 i; i < count; ++i) {
            calls[i] = Multicall3.Call({
                target: address(_testERC20),
                callData: abi.encodeWithSelector(_testERC20.transferFrom.selector, address(this), vm.addr(i + 1), amount)
            });
        }
        vm.resumeGasMetering();
        _testERC20.approve(address(multicall), totalAmount);
        multicall.aggregate(calls);
    }

    function test_BatchTransfer_5_100() public {
        vm.pauseGasMetering();
        uint256 count = 100;
        uint256 amount = totalAmount / count;
        Multicall3.Call[] memory calls = new Multicall3.Call[](count);
        for (uint256 i; i < count; ++i) {
            calls[i] = Multicall3.Call({
                target: address(_testERC20),
                callData: abi.encodeWithSelector(_testERC20.transferFrom.selector, address(this), vm.addr(i + 1), amount)
            });
        }
        vm.resumeGasMetering();
        _testERC20.approve(address(multicall), totalAmount);
        multicall.aggregate(calls);
    }
}
