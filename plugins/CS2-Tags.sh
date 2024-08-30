#!/bin/bash

plugin_repo_url="https://github.com/daffyyyy/CS2-Tags"
name_pattern="^CS2-Tags\.zip$"
extract_path="./game/csgo/addons/counterstrikesharp/plugins/CS2-Tags"

DOWNLOADED_FILE=$(./scripts/download_latest.sh $plugin_repo_url "$name_pattern")
unzip -o -j $DOWNLOADED_FILE -d $extract_path
rm -rf $DOWNLOADED_FILE