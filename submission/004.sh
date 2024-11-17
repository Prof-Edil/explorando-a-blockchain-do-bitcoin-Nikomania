# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`

xpub_key="xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2"
xpub_key_desc="tr($xpub_key/*)"
checksum=$(bitcoin-cli getdescriptorinfo $xpub_key_desc | jq -r '.checksum')
taproot_address=$(bitcoin-cli deriveaddresses "$xpub_key_desc#$checksum" "[100,100]" | jq -r '.[0]')
echo $taproot_address
