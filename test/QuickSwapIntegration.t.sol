// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Token.sol";
import "../src/QuickSwapIntegration.sol";
import "./mocks/AlgebraFactory.sol";
import "./mocks/AlgebraPoolDeployer.sol";

contract QuickSwapIntegrationTest is Test {
    address token0;
    address token1;
    bytes32 hashed;

    AlgebraFactory algebraFactory;
    QuickSwapIntegration quickSwap;

    function setUp() public {
        token0 = address(new Token());
        token1 = address(new Token());

        AlgebraPoolDeployer poolDeployer = new AlgebraPoolDeployer();
        algebraFactory = new AlgebraFactory(address(poolDeployer), address(1));

        poolDeployer.setFactory(address(algebraFactory));
        quickSwap = new QuickSwapIntegration(address(algebraFactory));
    }

    function testSomething() public {
        quickSwap.createPoolQK(token0, token1, 79228162514264337593543950336);
    }
}
