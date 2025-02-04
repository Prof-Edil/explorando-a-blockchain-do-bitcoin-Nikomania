# Which tx in block 257,343 spends the coinbase output of block 256,128?

block_tx_nr=257343
block_tx_hash=$(bitcoin-cli getblockhash $block_tx_nr)

block_coinbase_nr=256128
block_coinbase_hash=$(bitcoin-cli getblockhash $block_coinbase_nr)

block_tx_data=$(bitcoin-cli getblock $block_tx_hash 3)
block_coinbase_data=$(bitcoin-cli getblock $block_coinbase_hash 2)

coinbase_tx_data=$(echo $block_coinbase_data | jq -r '.tx[] | select(.vin[].coinbase)')
coinbase_tx=$(echo $coinbase_tx_data | jq -r '.txid')

block_tx_data=$(echo $block_tx_data | jq -r '.tx[] | select(.vin[].txid == "'$coinbase_tx'")')
echo $block_tx_data | jq -r '.txid'
