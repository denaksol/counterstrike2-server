#!/bin/bash

PLUGIN_NAME="FullTeamFix"
REPO_URL="https://github.com/ShookEagle/CS2-FullTeamFix"
SEARCH_REGEX="^FullTeamFix\.zip$"
EXTRACT_PATH="./game/csgo/addons/counterstrikesharp/plugins/"
EXTRACT_FLATTEN=false
CSS_PLUGIN=true

./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN