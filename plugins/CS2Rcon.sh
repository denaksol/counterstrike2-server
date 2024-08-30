#!/bin/bash

plugin_repo_url="https://github.com/LordFetznschaedl/CS2Rcon"
name_pattern="^CS2Rcon-(?:\d+(?:\.\d+)*)\.zip$"
extract_path="./game/csgo/addons/counterstrikesharp/plugins/CS2Rcon"

DOWNLOADED_FILE=$(./scripts/download_latest.sh $plugin_repo_url "$name_pattern")
unzip -o -j $DOWNLOADED_FILE -d $extract_path
rm -rf $DOWNLOADED_FILE