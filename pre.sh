#!/bin/bash

# PRE HOOK
echo "-------------------------------------- PREHOOK --------------------------------------"

# Save original path
initial_path=$(pwd)
# Set relative path to current file
current_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$current_path"

# Install metamod
METAMOD_URL="https://mms.alliedmods.net/mmsdrop/2.0/mmsource-2.0.0-git1313-linux.tar.gz"
echo "Installing metamod from: ${METAMOD_URL}"
wget -O metamod.tar.gz $METAMOD_URL
tar -xzvf metamod.tar.gz -C game/csgo/
rm -rf metamod.tar.gz
grep -q 'Game[[:space:]]*csgo/addons/metamod' ./game/csgo/gameinfo.gi || sed -i '/Game_LowViolence[[:space:]]*csgo_lv/a\\t\t\tGame    csgo\/addons\/metamod' ./game/csgo/gameinfo.gi

# Set permissions on all plugin and script files
find ./plugins/ -type f -exec chmod +x {} \;
find ./scripts/ -type f -exec chmod +x {} \;

# Load/install every plugin
find ./plugins -maxdepth 1 -type f -executable -name '*.sh' -exec {} \;

# Load custom configuration files
cp -r -f ./custom/game/* ./game/ && rm -rf ./custom

# Return to the original path
cd "$initial_path"

echo "-------------------------------------- PREHOOK --------------------------------------"