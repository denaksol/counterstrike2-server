#!/bin/bash

PLUGIN_NAME="Kill-Sound-GoldKingZ"
REPO_URL="https://github.com/oqyh/cs2-Kill-Sound-GoldKingZ"
SEARCH_REGEX="^Kill-Sound-GoldKingZ\.[0-9]+\.[0-9]+\.[0-9]+\.zip$"
EXTRACT_PATH="./game/csgo/"
EXTRACT_FLATTEN=false
CSS_PLUGIN=true

./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN