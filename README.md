# FreedomCash
This is to support those who support freedom, fairness, peace and love. 

## Assumptions

FreedomCash can be retrieved by adding info via https://FreeMe.Energy 
Spammers might want to exploit that if the gas fees for retrieving 18 FreedomCash was lower than the price of 18 FreedomCash. 

I assume that at the beginning of this project the price of 
1 FreedomCash will be at maximum 9 Cent.

Assumed Prices at the beginning: 
CULT price while writing this:      $0.000002261
Ryoshi price while writing this:    $0.00008237 
assumed FreedomCash price:          $0.09

Assuming that at each burn event we could burn $CULT worth around 9 USD:
This would imply buying around 4.000.000 CULT

## Questions and Answers to the smart contract

Is it wise to approve that the uniswap router can spend the total supply?
I decided to go for it to save gas fees for users where I can without taking
unreasonable risks. I guess the risk of that is reasonable because everyone 
in crypto trusts the uniswap router not to spend FreedomCash in illegit ways. 
[Details](https://ethereum.stackexchange.com/questions/106459/current-erc20-approval-best-practices)
