#!/bin/bash

curl -s -L "https://steamcommunity.com/sharedfiles/filedetails/?id=${WORKSHOP_COLLECTION}" \
| sed -n '/<div class="workshopItem">/{n;p;}' \
| grep -oP 'href="https:\/\/steamcommunity.com\/sharedfiles\/filedetails\/\?id=\K\d+' \
| uniq > workshop_ids.txt
curl -s -L "https://steamcommunity.com/sharedfiles/filedetails/?id=${WORKSHOP_COLLECTION}" | grep -oP '(?<=<div class="workshopItemTitle">)[^<]+' | tail -n +2 | uniq > workshop_names.txt

paste -d':' workshop_names.txt workshop_ids.txt | sed 's/\t/:/' > ./game/csgo/addons/counterstrikesharp/plugins/RockTheVote/maplist.txt

# Cleanup
rm -rf workshop_names.txt
rm -rf workshop_ids.txt