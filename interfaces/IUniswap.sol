// SPDX-License-Identifier: GNU AFFERO GENERAL PUBLIC LICENSE Version 3
pragma solidity ^0.8.20;
interface IUniswapV2Router {
    function getAmountsOut(
        uint256 amountIn,
        address[] memory path
    ) external view returns (uint256[] memory amounts);
    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;
}
interface IUniswapV2Factory {
    function getPair(
        address tokenA,
        address tokenB
    ) external view returns (address pair);
}   