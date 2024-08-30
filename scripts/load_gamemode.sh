#!/bin/bash

server_cfg="./game/csgo/cfg/server.cfg"
gamemode_cfg="gamemode.cfg"
gamemode_content=$(cat "$gamemode_cfg")
start_marker="// GAMEMODE CONFIGURATION"

if grep -q "$start_marker" "$server_cfg"; then
    sed -i "/$start_marker/,\$c\\$gamemode_content" "$server_cfg"
else
    echo "$gamemode_content" >> "$server_cfg"
fi
