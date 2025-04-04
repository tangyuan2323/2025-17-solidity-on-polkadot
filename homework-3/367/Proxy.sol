// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Proxy {
    // 代理合约自己的存储变量，布局与逻辑合约保持一致
    uint256 public count;
    address public logicAddress;

    // 构造函数传入逻辑合约地址
    constructor(address _logicAddress) {
        require(_logicAddress != address(0), "Invalid logic contract address");
        logicAddress = _logicAddress;
    }

    // 调用逻辑合约的 increment 函数，使用 delegatecall
    function increment() public {
        (bool success, ) = logicAddress.delegatecall(
            abi.encodeWithSignature("increment()")
        );
        require(success, "Delegatecall failed");
    }
}
