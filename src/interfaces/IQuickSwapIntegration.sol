//SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

/// @title The interface
interface IQuickSwapIntegration {
    function createPoolQK(
        address token0,
        address token1,
        uint160 sqrtPriceX96
    ) external;
}
