# CloudFlare - Dynamic DNS update

# Step 1
First you need to create a API token for your domains, My guide will show you how to create 1 API token with access to all zones and DNS records in your Cloudflare account 

Login to your Cloudflare portal
select any domain, in the bottom right hand corner of the domain landing page select "Get your API Token" this will take you to your API settings page, select "API Tokens" then "Create Token" then select Get started next to Create Custom Token

use the following settings for the api account to have write access to all zones and records: 
 
`Token Name: EDIT ALL ZONES & DNS RECORDS`

`Permissions: Zone, DNS, Edit`

`Zone Resources: Include, All Zones`

Continue to summary

You should now see "All zones - DNS:Edit"

Select “Create Tokens” (copy the API Token generated you will need this later)


# Step 2

Copy "get-record-id.sh" to /opt/cloudflare/ if the directory doesnt exsit the create then go ahead and create it then update the following lines in the config file

`Email: your Cloudflare login`

`X-Auth-Key: the API Token you just created`

`zone key: The zone you want to query the dns records for`

To find your zone id, select the domain from the cloudflare portal, from the landing page of the domain in the bottom right hand corner you will see Zone ID.

# Step 3
now run get-record-id.sh and you should get a output listing all record ID's for the zone you spesified above, note down the id of the record you want to dynamicly update.


# Step 4
now copy the file called CF-DDNS-Update.sh to /opt/cloudflare/ and update the following lines with information take from steps 2 and 3

`AUTH_EMAIL="You cloudflare email"`

`AUTH_KEY="API Token generated from step 1"`

`ZONE_ID="See step 2 to find your zone id"`

`A_RECORD_NAME="A record you want to update i.e. blah.com"`

`A_RECORD_ID="ID for blah.com - step 3"`


# Step 5

now create a cron job to run CF-DDNS-Update.sh at what ever interval you see fit, 

to add a cron job to run every min on ubuntu then add the following line to /etc/crontab

`* * * * * /opt/cloudflare/CF-DDNS-Update.sh`

