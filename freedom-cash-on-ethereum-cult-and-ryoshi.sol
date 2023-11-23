/*

    This is an homage to all who play for freedom and support the:
    Hike to freedom / Поход к свободе / Wanderung in die Freiheit / Hike Ad Libertatem

    Wir wollen sein eine einige Familie von Menschen. In keiner Not uns trennen und Gefahr. 

*/

// SPDX-License-Identifier: MIT
pragma solidity =0.8.11;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/token/ERC20/ERC20.sol";
import "./library/Liquidity.sol";

contract FreedomCash is ERC20 {
    struct StructuraLibertatis {
        address from;
        address freedomWallet;
        string text;
    }

    mapping(uint256 => StructuraLibertatis) libertasCelebrationis;

    mapping(address => bool) airdropReceived;

    address public cultAddress;
    address public ryoshiAddress;
    address[168] airdropEligibles;

    uint256 public counter = 0;
    uint256 public nextBurnAfterXMoreWrites = 369;

    constructor(
        address _cultAddress,
        address _ryoshiAddress,
        address[168] memory _airdropEligibles
    ) ERC20("FreedomCash", "FREEDOMCASH") {
        _mint(address(this), 369369369 * 10 ** decimals());
        cultAddress = _cultAddress;
        ryoshiAddress = _ryoshiAddress;
        airdropEligibles = _airdropEligibles;
    }

    modifier isInEligiblesList(address candidate) {
        bool inList = false;
        for (uint256 i = 0; i < airdropEligibles.length; i++) {
            if (airdropEligibles[i] == msg.sender) {
                inList = true;
            }
        }
        require(
            inList,
            "the wallet with which you called this function seems not in eligibles list"
        );
        _;
    }

    function write(address freedomWallet, string memory text) public {
        StructuraLibertatis memory liber = StructuraLibertatis(
            msg.sender,
            freedomWallet,
            text
        );

        libertasCelebrationis[counter] = liber;

        counter = counter + 1;

        if (balanceOf(address(this)) >= 18 * 10 ** decimals()) {
            this.transfer(msg.sender, 9 * 10 ** decimals());
            this.transfer(freedomWallet, 9 * 10 ** decimals());
        }

        uint256 cultAmountToBeBurned = 1000000;
        uint256 ryoshiAmountToBeBurned = 100000;
        uint256 slippageCULT = 45000;
        uint256 slippageRyoshi = 4500;

        nextBurnAfterXMoreWrites = counter % 369;

        if (nextBurnAfterXMoreWrites == 0) {
            Liquidity.swap(
                address(this),
                cultAddress,
                cultAmountToBeBurned,
                slippageCULT,
                Liquidity.DEAD_ADDRESS
            );
            Liquidity.swap(
                address(this),
                ryoshiAddress,
                ryoshiAmountToBeBurned,
                slippageRyoshi,
                Liquidity.DEAD_ADDRESS
            );
        }
    }

    function read(
        uint256 index
    ) public view returns (StructuraLibertatis memory) {
        return libertasCelebrationis[index];
    }

    function receiveAirdrop() public isInEligiblesList(msg.sender) {
        require(
            (airdropReceived[msg.sender] == false),
            "it seems this wallet already received the airdrop"
        );
        for (uint256 i = 0; i < airdropEligibles.length; i++) {
            if (
                msg.sender == airdropEligibles[i] &&
                airdropReceived[msg.sender] == false
            ) {
                this.transfer(msg.sender, 9 * 10 ** decimals());
                airdropReceived[msg.sender] = true;
            }
        }
    }

    // To the best of my knowledge the early supporters = holders of Ryoshi
    // https://etherscan.io/token/0xb962c980128e77d87a53ceddcab67d7e26540288
    // deserve an airdrop of 9 FREEDOMCASH
    // they can claim it until there are no FREEDOMCASH left in this smart contract
    // details about the snapshot date / time regarding holders:
    // https://x.com/Peer2peerE/status/1726952913376022936
    // Please validate in the contract deployment logs on etherscan that I used the
    // proper constructor parameters:
    /*
	_cultAddress = 0xf0f9D895aCa5c8678f706FB8216fa22957685A13
	_ryoshiAddress = 0xB962C980128e77D87a53cedDCAb67D7e26540288
	_airdropEligibles = [
		0x27e6a4920bDE370EB7B7E3fE7ede04fE006fe926,
		0x54F251B53b70cD3C0D43dc2FB22704E6C0B4677e,
		0xD23E62f2B066Cb1De7bB69e759879f86dee1b2a5,
		0x6c0172DE23Cc67FB2a2349270D74DBe61008FfBd,
		0x79671cDA333E98cDcF3D417Ccc3Cd3E2b3fE7ae2,
		0x6d90128d779fed4a63E6414Ac02C94558fCABb00,
		0x13E87F465f21Acc4ca78E7187470430F3F12E136,
		0x7D5f639474b0cC5b734cF9d7377714D9015743B9,
		0x9E972a43B3B8D68cD70930697E16429E47E88151,
		0x0ce809F6a3d9a3631264C64b8c4d4c5A0c7404d8,
		0xa1e0f03e1FF7FBB795d384233F11E2f0A9Ed31ab,
		0x2E1454Ff781d9dc43df70035fab8DBF0FF98ECa2,
		0xa0Ee1b2f339EcA52b374617D80396DEbA93e3C65,
		0x2724C553b788f306e3a1e1fE0e8C0ef56bA6A2A4,
		0xd1EEB3132579132c6821b8D455cA64F49312F1C8,
		0x24788664CD9b13F735ee153b8B503902d9d4E00f,
		0xfCf6cE6169bc764211743cC05EaBcEa74254936b,
		0x6e8699bE84628fea1d913665B8711E9e70A38753,
		0x6565671EDB0b36F0efab980507D28bcFD090aB2c,
		0xa97CC4FBFdC3Cb11342520e168F85be885cCE118,
		0x2A5bac6615C1516C89e3b657a19C8620D815674a,
		0xd90a088b1f4BB17ae8FF3542E31191bE36AaDbF9,
		0x8209E7068C4697E6DadFeB9a84eb0136E1365B71,
		0xA770Fb4157041818c11aA55360ead332D0531758,
		0x7A915e362353d72570dcf90aa5BAA1C5B341c7AA,
		0xb2225d38B5EC00AdDCb262670624E05265DaC50E,
		0x5E297F507546Bc49a7dCD92d4555DEe09D7cC16d,
		0x85b27334a4d83F2C3496DF43EEB593Caff786336,
		0x9B228B4F71B3Bc7e4b478251f218060D7B70Dc25,
		0x916fa2E34a3297485C1bF2c0E4c38d4C5e87f221,
		0xE55d36Af4844338e3157d1c8bF20c75dE7326b7d,
		0x36Ec8E61141310208E3288912a708AfD67cb3187,
		0xa6ED54f08E95FD31F37FDE73e005952E6137Ea98,
		0x91a4aD5906275Dd0D48E36F5bfCD66FB9d86bf6e,
		0xcFf0450588D2Fe308Ab4c08aD8Dc7EDA4EDa74A0,
		0xe6fA18BDae19f43d6C6CB15b2a9f14fa6f78390A,
		0x7Be55317fE283d15b4B84C3a373679483Df28B72,
		0xbF9500c23Ae44bd2678c6eb5fA5B36cE6001Bb8E,
		0x4396A292512AA418087645B56a3a76333Bd10e28,
		0x96761F546bAdd88aCaC819781A2247f30386ad6B,
		0x8C68010ea85ADFb72fF1A4df06811D307bf4f5E4,
		0x163804B7991D36EBdF0F7373CBBABCc6460Fe10a,
		0x5Ca887615098c6B7409F18502F57538205c768D9,
		0x12D3702eFFAe9AD1cC79CC870d6De8961ce40Cd4,
		0x751D085e9aC3443FC496EF7B6Ec035B2C4e2af86,
		0x956224e61669243A92B687554909CAC253361d1A,
		0xc1cF3ad3CeFeC00F072A88bd6553d20243D5FF59,
		0xc78A08a0da4077D630672619BFd1DF5fE926C8af,
		0x146cD2fCbdbAc27e7A805588D3d02D9cCee85041,
		0x4330E12B7fE1c99e08B6Dc0Bf497E3481aAC7225,
		0x92399641C9412dE2C255986ad86E6e5c19224F68,
		0x894A26338a4714889BC80BEB451E695262686694,
		0x8B59e21D4E9c409cf2b7D354CD95F737443dd367,
		0xB78dbf1C001826E6fBAC886a990342A35ce279ce,
		0xC2c97F3e08dAD53b89aA20bc9C86657f07C942CB,
		0x26A8500d24e5dafE95B0681f5853dA4f90Bbac4f,
		0x451fA8A7c1AADE23501Fc362b5015D52bAc79F15,
		0x062A1A5D1215b476E48Fe240184980AC035D3DDd,
		0x757B4E74fFd6596eb56a602F55Abb18deB5DBE9e,
		0xD41b61aD0A1F9E42ee995A8ad7D4294AaD447b84,
		0x8A6478FAB8F6B55052DB2e8e60c44CEDeFD9e437,
		0x535C195F56470db9EEd23F8B80184264fBE877ca,
		0xafaE819C1Efd3881Bb8A65f06E36d83018FDeb76,
		0x8fB2642587bFaf13d0FB025fa46f49B2bfaB1b61,
		0xEc0CB6d23f385c9818A48e0062b382adFef20A79,
		0x1F080f1487895188bDd6Cbc0cB788d50e4a74a4A,
		0xd6b20c15410b66914bD93EaF017084c0DA28b11F,
		0x4B8727566e8353aab3843809EFabfe2C745aD70C,
		0x25EC6161367e11cA65e625537b6Dd8523dD44C46,
		0x64f21dc0dAe229616c095D6b7e1a5A615a700FcB,
		0x579024eb1A4Fe6233790a26fe1f728501AE336c5,
		0x013EB38a05c197d606b3c02FC8Da34B4d7383bfA,
		0xDC92008f0C2dec4E3cb3D4c296e30029aC98aEA7,
		0x6B1B45C925B29ea9d5BDDe5490D7016EDD288700,
		0x8A93310E5D92FCAc729fa3AcC20BB82F21a51980,
		0x2Bec5d62b37988A3995B1245eFE05E3660Dc0A89,
		0x05bbb13759e4ab15F4cF5a2Bfa6959305d2840EA,
		0xFaECD73ee0Ac34D35Eb376f00B75Aa6c5Ce8462B,
		0x18e4CD52655cE00Ddd68F3a07eAfd452e504343c,
		0x885C17389f81B49F4E95b90A74d440e9613b6BeF,
		0x69876961459e34c2c896a5A67b53C69e182B2E75,
		0x9EdE65d0196537Ce0771F0724d9C2509766F7b92,
		0x6945963F213b01cfFadcAe29EfC55BF6Be7b239d,
		0x3b665ec825e1A4fB3f3d282557977823AEBA0D0c,
		0x495fd60cCb04B407C2EAfe2721555eb7D919F99E,
		0x8001eDaf71dc22df812d906758754218B93B9AeD,
		0xb07D1c51117b5cEC7A1612ff057A12c9B3f945f7,
		0x73C23cb7d76C5a804498DD54B6aE1830D4DfE8e9,
		0xF90E9A73b41953C4bcfA709Dd29c76bc7E01c870,
		0xfE9646eCAdfB76030Ebf93363c74ff4Cdac8E91a,
		0x0B2b22A173962393D866908866b36F1336707D2D,
		0x733ba03345449FC977b10F03e77EA1ABB4c6bc4F,
		0x39396b151846d9198866E742D6AcF97A73E728A4,
		0xB9C4189b0f76C18FBc20BA1c91247B33f536D205,
		0x7F36091626e7bcC18D1B954DE8f45B8D6F41B0e1,
		0xF3c1a53754861EcEcee4ca615A6b11F67Bc89d25,
		0x63F4D8e701F694e68BE94Ab97bb1f7d1F1386faA,
		0x26b5Ea50389BD5C3F87c11a278AcF3CeE6e0a2d5,
		0x5abBc66af123319b72eCe7ed4Ab68de97fB18D7f,
		0x04f250e83f02Bd1EDC6488E3664a7Bce4F863107,
		0x6Bc3794671A892818d569708a99E2B916Ca809E2,
		0x5058Af5Fe09a33Fa56B32f35675374E6272Be9CF,
		0xED7d00D585adFdE6deFc4DD6bC34dD016D42378A,
		0xACB0217b7b2779F1412C98831652647C62460eCe,
		0x10b7501F22Cb80f31549ff41A27668A22D25e900,
		0x34FB5617754A4396ECFf1cC904e4716243446B95,
		0x56D210Aa1EebC8F8c43CC068d4A4bc0a0Ac700b6,
		0x6667bcF13b1376877f68526Ba8fC9D2A8534a597,
		0x414e0262b0C07fB29704A9332587d299Ba87F5F7,
		0x6b2091ee7815df08B0F18a4fed54a494CeF152EF,
		0xC2C63d4b9742607809c7030d2a9Cb1cE61E10E57,
		0xfe96406c8E693323d447eB0c58cE76829b5cd140,
		0x3D3c13bD6F33C555C27786934064E59bbE5894D1,
		0x8697BdeE7B35fF16F20c6A01B65F37702Eed0eEA,
		0x3bb415F59A012050719a8D25C8214166721040Ea,
		0xdec54B112dcbf229EfFBa39E9d660b2076F003B6,
		0x6C3E52b0229601231AC267DC2c4dCE2Eea76c9B4,
		0x15BfA4A5b51F73156Ad00efB3e3A1e53970c8025,
		0xd44869c25f62dF5920eB0Bc7EfCdeceA65b46021,
		0xa76DB9f08f2C6AD48E4164E063eC454254160E61,
		0xB7258cB6F572F5ed470fdB7f2e01F2D22bcF8400,
		0x58e31509F03efB95E99326eA4149fE482d71C2ba,
		0xc4b3572deE1d00A5C71292ae171681C272bC2eF5,
		0x313230093ecD3ba17cB92DF22139D70437033987,
		0x4981cb3e42949f319Db09733F43a473adc636bD2,
		0x29F361e4F224b68d7a6f19C2DEfCc71F9a44B5e3,
		0xea985413668AEDD8E7327703f6Fdf546E8DD6432,
		0x17d3c302d30Ac502Aa5dBCEc28A1847375B2d4B1,
		0x0A5590dBA578a0e9937960957E7C7Cdf08292439,
		0x7621bF9E9c08323f865e49EE16A1BF29652c181a,
		0x56bBe8253A2864030EFeE5D4ac5941E2E14954cb,
		0x2365eF74b41bE844eCD8F68A2a32F23f7A00617f,
		0x2EE5Fa95e44aFac32EC3b6f73122B1918D541D9D,
		0xA9487C5B6Fd8a1454Df4e07eEc6e9906482B4610,
		0xA8309aADCCF8b7A92A308123cae2CD7F026Af6e8,
		0xcED54e1D6128fb7C419848c462Fbfb9089019872,
		0xAf673e793C365229c2F17F4E7f95CE6a95d07466,
		0x266cD073795e502F683a55df8b9cD795aca1684d,
		0x6b3CbcD407aE97d584B9669C5a56B8Cc218DCd1b,
		0x11AA927Cd2593AdBC28b53fB2370A5cf545eB2b1,
		0x1dF8a9f0e9518c88b6c47D0FA672D186d8d55B5d,
		0xF7e4f96d362be8ad90178348dbb2a728135A352D,
		0x071eE091aD119b55Aa932905CbA0Ce2665C8C1Ea,
		0xd28958789f5BA6294400DEc16f8E471e7C9F0EF1,
		0x420eb87916504753D1E5AA099f3f24A914F9Cf26,
		0x32D94d3e3750f02c6502663927513bed09feE77A,
		0x57D6eDc1DCC89A582924182c503D84E5b2Cc000F,
		0x391999BA19F9CB492463066f85fafd319Bb88690,
		0x86D35A3126B90146673c599cCdB6e533a0cd1363,
		0xc45e688C14F4f9c5fb0786a2181C81906931d5bf,
		0x8e260F9E62A153BE3354aA8BbB0f2a1f10faD34a,
		0x54E318E7B396c5C8a4BF5c26B6e63715059806C8,
		0x8a95d0eFBb0052638fE7F30eEEF621045aC2f5b2,
		0x7Db7Ae620C4a4a98d9a18973E9d77Af033E854b5,
		0x25AB0a569Ca042c66265726a4b2AcceF900DCcD3,
		0xe7EF24aA6DeA79767EAC7608662DdD8f19B93066,
		0xF013a6675AbFf256335Fb23A836fe2A5FD8caDE6,
		0x4038a44B34dC6974b2d609715c00DA7df845C4F9,
		0x6b75d8AF000000e20B7a7DDf000Ba900b4009A80,
		0x9Cc67114F5fAb232b3c07B2D9Aa5163A47BC04F2,
		0x87c0B5e001af679305dfA310927c7c88D3231029,
		0xA352FC0Be585BF2717736555516ff5E3D966c6EA,
		0xfc847231C6cebcA90Ad50605ef9738360CcFAB29,
		0xA46A0f1EE908F15C16fb91022D15f758cd39B827,
		0x5621970f6f7fa1f3a5aBbf82341408C60a3F336b,
		0x9E508F256FE762c1Aea60Ee318bfe20639f2BfaF,
		0xB962C980128e77D87a53cedDCAb67D7e26540288,
		0xf081470f5C6FBCCF48cC4e5B82Dd926409DcdD67
	]
*/
}
