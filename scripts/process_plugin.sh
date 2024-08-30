#!/bin/bash

# PARAMETERS
PLUGIN_NAME=$1 # Name of the plugin folder (Important if it is a counterstrikesharp plugin)
REPO_URL=$2 # Base URL of the repository the plugin gets downloaded from
SEARCH_REGEX=$3 # Regex pattern of the asset filename example: counterstrikesharp-with-runtime-build-[0-9]+-linux-[a-zA-Z0-9]+\.zip
EXTRACT_PATH=$4 # Where does the plugin need to be extracted?
EXTRACT_FLATTEN=$5 # true/false does the extraction need to be flattened?
CSS_PLUGIN=$6 # true/false (whether or not the plugin is a plugin inside CounterStrikeSharp or not)

# 1. ENABLE THE PLUGIN IF IT ALREADY EXISTS (ONLY IF THE PLUGIN IS A CSS PLUGIN)
if $CSS_PLUGIN; then
    CSS_DIR="./game/csgo/addons/counterstrikesharp/plugins"
    CSS_DIR_DISABLED="$CSS_DIR/disabled"

    if [ -d "$CSS_DIR_DISABLED/$PLUGIN_NAME" ]; then
        if [ -d "$CSS_DIR/$PLUGIN_NAME" ]; then
            rm -rf "$CSS_DIR/$PLUGIN_NAME"
        fi
        mv -f "$CSS_DIR_DISABLED/$PLUGIN_NAME" "$CSS_DIR"
    fi
fi

# 2. GET THE LATEST DOWNLOAD URL
LATEST_URL=$(echo "$REPO_URL" | sed -E 's|https://github.com/([^/]+)/([^/]+)|https://api.github.com/repos/\1/\2/releases/latest|')
DOWNLOAD_URL=$(curl -s ${LATEST_URL} | \
jq -r --arg FILENAME "$SEARCH_REGEX" '.assets[] | select(.name | test($FILENAME)) | .browser_download_url')

# 3. CHECK IF THE PLUGIN FROM THAT URL HAS ALREADY BEEN INSTALLED
if grep -Fxq "$DOWNLOAD_URL" "./installed_plugins.txt"; then
    echo "Plugin: $PLUGIN_NAME from $DOWNLOAD_URL has already been installed."
    exit 1
fi

# 4. DOWNLOAD THE PLUGIN FROM THE LATEST URL
wget $DOWNLOAD_URL

DOWNLOADED_FILE=$(curl -s ${LATEST_URL} | \
jq -r --arg FILENAME "$SEARCH_REGEX" '.assets[] | select(.name | test($FILENAME)) | .name')

echo "Downloaded: $DOWNLOADED_FILE from $DOWNLOAD_URL"
echo "extracting..."

# 5. EXTRACT THE DOWNLOADED ZIP/TAR.GZ TO THE PLUGIN INSTALL LOCATION
if [[ "$DOWNLOADED_FILE" == *.tar.gz ]]; then
    tar -xzvf "$DOWNLOADED_FILE" -C "$EXTRACT_PATH"
elif [[ "$DOWNLOADED_FILE" == *.zip ]]; then
    # Check if EXTRACT_FLATTEN is set to true
    if [ "$EXTRACT_FLATTEN" = "true" ]; then
        unzip -o -j "$DOWNLOADED_FILE" -d "$EXTRACT_PATH"
    else
        unzip -o "$DOWNLOADED_FILE" -d "$EXTRACT_PATH"
    fi
else
    echo "'$DOWNLOADED_FILE' cannot be extracted, unknown file extension."
fi

# 6. REMEMBER PLUGIN URL
echo "$DOWNLOAD_URL" >> "./installed_plugins.txt"

# 7. CLEANUP
rm -rf "$DOWNLOADED_FILE"

# 8. ??? profit
echo "installed plugin: $PLUGIN_NAME."