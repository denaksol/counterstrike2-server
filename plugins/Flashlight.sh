#!/bin/bash

PLUGIN_NAME="Flashlight"
REPO_URL="https://github.com/creazy231/cs2-css-flashlight"
SEARCH_REGEX="^Flashlight\.zip$"
EXTRACT_PATH="./game/csgo/addons/counterstrikesharp/plugins/Flashlight"
EXTRACT_FLATTEN=true
CSS_PLUGIN=true

./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN