# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

tx="37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517"
tx_data=$(bitcoin-cli getrawtransaction $tx 2)
echo $tx_data | jq -r
vins_tx_pubs=$(echo $tx_data | jq -r '[.vin[].txinwitness[1]]')
echo $vins_tx_pubs
vins_tx_pubs_length=$(echo $vins_tx_pubs | jq -r 'length')
echo $vins_tx_pubs_length
mult_sig_data=$(bitcoin-cli createmultisig $vins_tx_pubs_length "$vins_tx_pubs" p2sh-segwit)
echo $mult_sig_data | jq -r ".address"
