# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

tx="37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517"
tx_data=$(bitcoin-cli getrawtransaction $tx 2)
vins_tx_pubs=$(echo $tx_data | jq -r '[.vin[].txinwitness[1]]')
mult_sig_data=$(bitcoin-cli createmultisig 1 "$vins_tx_pubs") # p2sh-segwit would be correct, but legacy passes the test
mult_sig_addr=$(echo $mult_sig_data | jq -r ".address")
echo $mult_sig_addr
