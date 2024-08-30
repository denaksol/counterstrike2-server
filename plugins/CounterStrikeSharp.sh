#!/bin/bash

plugin_repo_url="https://github.com/roflmuffin/CounterStrikeSharp"
name_pattern="counterstrikesharp-with-runtime-build-[0-9]+-linux-[a-zA-Z0-9]+\.zip"
extract_path="./game/csgo/"

DOWNLOADED_FILE=$(./scripts/download_latest.sh $plugin_repo_url "$name_pattern")
unzip -o $DOWNLOADED_FILE -d $extract_path
rm -rf $DOWNLOADED_FILE