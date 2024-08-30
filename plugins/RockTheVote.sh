#!/bin/bash

plugin_repo_url="https://github.com/abnerfs/cs2-rockthevote"
name_pattern="^RockTheVote_v[\w.]+\.zip$"
extract_path="./game/csgo/addons/counterstrikesharp/plugins/"

DOWNLOADED_FILE=$(./scripts/download_latest.sh $plugin_repo_url "$name_pattern")
unzip -o $DOWNLOADED_FILE -d $extract_path
rm -rf $DOWNLOADED_FILE