#!/bin/bash

PLUGIN_NAME="CS2Rcon"
REPO_URL="https://github.com/LordFetznschaedl/CS2Rcon"
SEARCH_REGEX="^CS2Rcon-(?:\d+(?:\.\d+)*)\.zip$"
EXTRACT_PATH="./game/csgo/addons/counterstrikesharp/plugins/CS2Rcon"
EXTRACT_FLATTEN=true
CSS_PLUGIN=true

./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN