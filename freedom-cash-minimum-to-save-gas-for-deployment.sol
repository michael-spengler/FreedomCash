// SPDX-License-Identifier: GNU AFFERO GENERAL PUBLIC LICENSE Version 3
// This is an homage to all who play for freedom and support the:
// Hike to freedom / Поход к свободе / Wanderung in die Freiheit / Hike Ad Libertatem
// Wir wollen sein eine einige Familie von Menschen. In keiner Not uns trennen und Gefahr.
pragma solidity =0.8.11;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/token/ERC20/ERC20.sol";
import "./library/Liquidity.sol";
contract FreedomCash is ERC20 {
    struct StructuraLibertatis {
        address from;
        address freedomWallet;
        string text;
    }
    mapping(uint256 => StructuraLibertatis) public libertasCelebrationis;
    mapping(address => bool) public airdropReceived;
    address public cult;
    address public ryoshi;
    uint256 public counter = 0;
    uint256 public nextBurnAfterXMoreWrites = 369;
    constructor(address _cult, address _ryoshi) ERC20("FreedomCash", "FREEDOMCASH") {
        _mint(address(this), 369369369 * 10 ** decimals()); // into contract itself 
        cult = _cult;
        ryoshi = _ryoshi;
    }
    function write(address freedomWallet, string memory text) public {
        StructuraLibertatis memory liber = StructuraLibertatis(msg.sender, freedomWallet, text);
        libertasCelebrationis[counter] = liber;
        counter = counter + 1;
        if (balanceOf(address(this)) >= 18 * 10 ** decimals()) {
            this.transfer(msg.sender, 9 * 10 ** decimals());
            this.transfer(freedomWallet, 9 * 10 ** decimals());
        }
        nextBurnAfterXMoreWrites = counter % 369;
        if (nextBurnAfterXMoreWrites == 0) {
            Liquidity.swap(address(this), cult, 1000000, 45000, Liquidity.DEAD_ADDRESS);
            Liquidity.swap(address(this), ryoshi, 100000, 4500, Liquidity.DEAD_ADDRESS);
        }
    }
    function read(uint256 index) public view returns (StructuraLibertatis memory) {
        return libertasCelebrationis[index];
    }
} // 0xf0f9D895aCa5c8678f706FB8216fa22957685A13 // 0xB962C980128e77D87a53cedDCAb67D7e26540288