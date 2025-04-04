// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LogicContract {
    // 为了与代理合约保持一致，声明一个 count 变量
    uint256 public count;

    // 增加 count 的函数，每调用一次就加 1
    function increment() public {
        count = count + 1;
    }
}
