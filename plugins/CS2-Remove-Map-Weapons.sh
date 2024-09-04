#!/bin/bash

PLUGIN_NAME="CS2-Remove-Map-Weapons"
REPO_URL="https://github.com/kus/CS2-Remove-Map-Weapons"
SEARCH_REGEX="^CS2-Remove-Map-Weapons-[0-9]+\.[0-9]+\.[0-9]+\.zip$"
EXTRACT_PATH="./game/csgo/"
EXTRACT_FLATTEN=false
CSS_PLUGIN=true

./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN