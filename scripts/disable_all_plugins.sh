#!/bin/bash

BASE_DIR="./game/csgo/addons/counterstrikesharp/plugins"
DISABLED_DIR="$BASE_DIR/disabled"

mkdir -p "$DISABLED_DIR"

for plugin in "$BASE_DIR"/*; do
    if [ -d "$plugin" ] && [ "$(basename "$plugin")" != "disabled" ]; then
        mv "$plugin" "$DISABLED_DIR"
    fi
done
