curl -X GET "https://api.cloudflare.com/client/v4/zones/<Zones ID>/dns_records?type=A" \
     -H "X-Auth-Email: blah@blam.com" \
     -H "X-Auth-Key: 111111a1a11111aa11111aaa111aaa111111a \
     -H "Content-Type: application/json"
     
# The following config needs to be updated with your information please see readme.md for more info
# Zone ID: Zone ID (Step 2 of readme.md)
# Auth-Email: Cloudflare login email address
# Auth-key: API Token (step 1 of readme.md)
