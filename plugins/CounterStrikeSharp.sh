#!/bin/bash

PLUGIN_NAME="CounterStrikeSharp"
REPO_URL="https://github.com/roflmuffin/CounterStrikeSharp"
SEARCH_REGEX="counterstrikesharp-with-runtime-build-[0-9]+-linux-[a-zA-Z0-9]+\.zip"
EXTRACT_PATH="./game/csgo/"
EXTRACT_FLATTEN=false
CSS_PLUGIN=false

./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN