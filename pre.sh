#!/bin/bash

# PRE HOOK
echo "-------------------------------------- PREHOOK --------------------------------------"

# Save original path
initial_path=$(pwd)
# Set relative path to current file
current_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$current_path"

# Set permissions on all plugin and script files
find ./plugins/ -type f -exec chmod +x {} \;
find ./scripts/ -type f -exec chmod +x {} \;

# Make sure installed plugins file exists
touch ./installed_plugins.txt

# Install metamod
if grep -Fxq "$METAMOD_URL" "./installed_plugins.txt"; then
    echo "Plugin: metamod from $METAMOD_URL has already been installed."
else
    echo "Installing metamod from: ${METAMOD_URL}"
    wget -O metamod.tar.gz $METAMOD_URL
    tar -xzvf metamod.tar.gz -C game/csgo/
    rm -rf metamod.tar.gz
    grep -q 'Game[[:space:]]*csgo/addons/metamod' ./game/csgo/gameinfo.gi || sed -i '/Game_LowViolence[[:space:]]*csgo_lv/a\\t\t\tGame    csgo\/addons\/metamod' ./game/csgo/gameinfo.gi
    echo "$METAMOD_URL" >> "./installed_plugins.txt"
fi

# Disable all plugins in case there are plugins from other gamemodes installed
./scripts/disable_all_plugins.sh

# Enable/install every plugin
./scripts/install_plugins.sh

# Load custom configuration files
cp -r -f ./custom/game/* ./game/ && rm -rf ./custom

# Generate maplist
./scripts/generate_maplist.sh

# Load gamemode config
./scripts/load_gamemode.sh

# Return to the original path
cd "$initial_path"

echo "-------------------------------------- PREHOOK --------------------------------------"