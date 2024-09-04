#!/bin/bash

PLUGIN_NAME="GG2"
REPO_URL="https://github.com/ssypchenko/cs2-gungame"
SEARCH_REGEX="^GG2\.plugin\.[0-9]+\.[0-9]+\.[0-9]+\.zip$"
EXTRACT_PATH="./game/"
EXTRACT_FLATTEN=false
CSS_PLUGIN=true

./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN