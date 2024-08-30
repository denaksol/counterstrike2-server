#!/bin/bash

PLUGIN_NAME="RockTheVote"
REPO_URL="https://github.com/abnerfs/cs2-rockthevote"
SEARCH_REGEX="^RockTheVote_v[\w.]+\.zip$"
EXTRACT_PATH="./game/csgo/addons/counterstrikesharp/plugins/"
EXTRACT_FLATTEN=false
CSS_PLUGIN=true

./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN