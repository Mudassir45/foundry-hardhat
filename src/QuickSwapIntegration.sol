// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

import "./interfaces/IQuickSwapIntegration.sol";
import "forge-std/console.sol";

import "../test/mocks/interfaces/IAlgebraPool.sol";
import "../test/mocks/interfaces/IAlgebraFactory.sol";

// import "../node_modules/@cryptoalgebra/core/contracts/interfaces/IAlgebraPool.sol";
// import "../node_modules/@cryptoalgebra/core/contracts/interfaces/IAlgebraFactory.sol";

contract QuickSwapIntegration is IQuickSwapIntegration {
    IAlgebraFactory public algebraFactory;

    constructor(address _algebraFactory) {
        algebraFactory = IAlgebraFactory(_algebraFactory);
    }

    function createPoolQK(
        address token0,
        address token1,
        uint160 sqrtPriceX96
    ) external override {
        address pool = algebraFactory.createPool(token0, token1);
        IAlgebraPool(pool).initialize(sqrtPriceX96);
    }
}
