#!/bin/bash

# plugin_name="noblock"
# plugin_url="https://github.com/ManifestManah/NoBlock/archive/refs/heads/main.zip"

# # Check if the plugin is already installed
# ./plugins/plugin_manager.sh check "$plugin_name" "$plugin_url"

# if [ $? -eq 1 ]; then
#     echo "Installing $plugin_name from $plugin_url..."

#     # Installation
#     wget -O "${plugin_name}.zip" $plugin_url
#     unzip -o -j "${plugin_name}.zip" -d "./game/csgo/addons/counterstrikesharp/plugins/NoBlock"
#     rm -rf "${plugin_name}.zip"

#     # Add to plugin manager
#     ./plugins/plugin_manager.sh add "$plugin_name" "$plugin_url"
#     echo "$plugin_name installed successfully from $plugin_url!"

# fi

# TODO download repo, repo has no releases

#!/bin/bash

# PLUGIN_NAME="NoBlock"
# REPO_URL="https://github.com/ManifestManah/NoBlock"
# SEARCH_REGEX=""
# EXTRACT_PATH="./game/csgo/addons/counterstrikesharp/plugins/NoBlock"
# EXTRACT_FLATTEN=true
# CSS_PLUGIN=true

# ./scripts/process_plugin.sh $PLUGIN_NAME $REPO_URL $SEARCH_REGEX $EXTRACT_PATH $EXTRACT_FLATTEN $CSS_PLUGIN