// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "./LogicContract.sol";
import "./Proxy.sol";

contract ProxyTest is Test {
    LogicContract logic;
    Proxy proxy;

    function setUp() public {
        // 部署逻辑合约
        logic = new LogicContract();
        // 部署代理合约，将逻辑合约地址传入
        proxy = new Proxy(address(logic));
    }

    function testIncrement() public {
        // 初始 count 值应为 0
        uint256 initialCount = proxy.count();
        // 通过代理调用 increment
        proxy.increment();
        // 代理合约中的 count 应该加 1
        uint256 newCount = proxy.count();
        assertEq(newCount, initialCount + 1, "count should be incremented by 1");
    }
}
