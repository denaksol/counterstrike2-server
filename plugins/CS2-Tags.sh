#!/bin/bash

PLUGIN_NAME="CS2-Tags"
REPO_URL="https://github.com/daffyyyy/CS2-Tags"
SEARCH_REGEX="^CS2-Tags\.zip$"
EXTRACT_PATH="./game/csgo/addons/counterstrikesharp/plugins/CS2-Tags"
EXTRACT_FLATTEN=true
CSS_PLUGIN=true

./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN