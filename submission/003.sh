# How many new outputs were created by block 123,456?

block_number=123456
block_hash=$(bitcoin-cli getblockhash $block_number)
block=$(bitcoin-cli getblock $block_hash)
echo $block | jq '.tx' | jq length
