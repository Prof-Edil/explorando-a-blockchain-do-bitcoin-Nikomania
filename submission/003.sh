# How many new outputs were created by block 123,456?

block_number=123456
block_hash=$(bitcoin-cli getblockhash $block_number)
block=$(bitcoin-cli getblock $block_hash 2) # verbosity=2

vout_total_count=$(echo $block | jq '[.tx[] | .vout | length] | add')

echo $vout_total_count
