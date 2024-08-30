#!/bin/bash

REPO_URL=$1
FILENAME=$2 # Regex pattern example: counterstrikesharp-with-runtime-build-[0-9]+-linux-[a-zA-Z0-9]+\.zip

# Check if a GitHub URL is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <GitHub Repository URL> ..."
    echo "Example: $0 https://github.com/<username>/<repo> ..."
    exit 1
fi

# Check if file name is provided
if [ -z "$2" ]; then
    echo "Usage: $0 ... <Filename Regex Pattern>"
    echo "Example: $0 ... filename-[0-9]+-linux-[a-zA-Z0-9]+\.zip"
    exit 1
fi

# Convert URL to api URL
API_URL=$(echo "$REPO_URL" | sed -E 's|https://github.com/([^/]+)/([^/]+)|https://api.github.com/repos/\1/\2/releases/latest|')

# Fetch and download the latest asset file(s) that match the filename pattern
wget $(curl -s ${API_URL} | \
jq -r --arg FILENAME "$FILENAME" '.assets[] | select(.name | test($FILENAME)) | .browser_download_url')

# Echo out the actual filename
echo $(curl -s ${API_URL} | \
jq -r --arg FILENAME "$FILENAME" '.assets[] | select(.name | test($FILENAME)) | .name')