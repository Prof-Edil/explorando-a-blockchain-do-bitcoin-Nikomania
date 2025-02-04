# Only one single output remains unspent from block 123,321. What address was it sent to?

# bitcoin-cli gettxout "097e521fee933133729cfc34424c4277b36240b13ae4b01fda17756da1848c1e" 0 true

block_nr=123321
block_hash=$(bitcoin-cli getblockhash $block_nr)
block_data=$(bitcoin-cli getblock $block_hash 2)
txids=$(echo $block_data | jq -r '.tx[].txid')

txout_unspent=0
for txid in $txids; do
  vout_nrs=$(echo $block_data | jq -r '.tx[].vout[].n')

  for vout_nr in $vout_nrs; do
    txout=$(bitcoin-cli gettxout $txid $vout_nr true)
    if [ "$txout" != "" ]; then
      txout_unspent=$txout
      break 2
    fi
  done
done

echo $txout_unspent | jq -r '.scriptPubKey.address'
