// SPDX-License-Identifier: GNU AFFERO GENERAL PUBLIC LICENSE Version 3
// The power of our words is more powerful than the words of the powerful 
// Let us free the world. Let us all unite.

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