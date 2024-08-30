#!/bin/bash

PLUGIN_NAME="MultiAddonManager"
REPO_URL="https://github.com/Source2ZE/MultiAddonManager"
SEARCH_REGEX="^MultiAddonManager-v[0-9]+\.[0-9]+\.[0-9]+-linux\.tar\.gz$"
EXTRACT_PATH="game/csgo/"
EXTRACT_FLATTEN=false
CSS_PLUGIN=false

./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN