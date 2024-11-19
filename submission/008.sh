# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`

# expected = 025d524ac7ec6501d018d322334f142c7c11aa24b9cffec03161eca35a1e32a71f

txid="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"
tx=$(bitcoin-cli getrawtransaction $txid 2)
vin_0=$(echo $tx | jq -r '.vin[0]')
txinwitnesses=$(echo $vin_0 | jq '[.txinwitness[]]')
pb_key=$(echo $txinwitnesses | jq -r '.[2][4:70]') # P2WSH witness script
echo $pb_key
