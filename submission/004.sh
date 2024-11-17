# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`

pub_key_desc_simple="tr(xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2/0/*)"

descriptor_info=$(bitcoin-cli getdescriptorinfo $pub_key_desc_simple)
checksum=$(echo $descriptor_info | jq '.checksum' | sed 's/"//g')
adress=$(bitcoin-cli deriveaddresses "${pub_key_desc_simple}#${checksum}" "[100,100]" | jq '.[0]' | sed 's/"//g')
echo $adress
