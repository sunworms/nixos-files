#!/usr/bin/env bash

set -euo pipefail

SOURCES_FILE="${1:-npins/sources.json}"
HASHES_FILE="${2:-hashes.json}"

if [[ ! -f "$SOURCES_FILE" ]]; then
    echo "Error: $SOURCES_FILE not found" >&2
    exit 1
fi

if [[ ! -f "$HASHES_FILE" ]]; then
    echo "Error: $HASHES_FILE not found" >&2
    exit 1
fi

get_appimage_hash() {
    local url=$1
    local name=$2
    echo "Calculating hash for AppImage at $url..." >&2
    
    local hash
    hash=$(nix-prefetch-url "$url" 2>/dev/null)
    if [[ -n "$hash" ]]; then
        nix hash to-sri --type sha256 "$hash" 2>/dev/null || echo "$hash"
    fi
}

update_from_sources() {
    local name=$1
    local new_version=$2
    local current_version=$3
    local owner=$4
    local repo=$5
    
    echo "=== Checking $name ===" >&2
    echo "Current version: $current_version" >&2
    echo "New version: $new_version" >&2
    
    if [[ "$new_version" == "$current_version" ]]; then
        echo "Already up to date, skipping" >&2
        return 0
    fi
    
    echo "Version mismatch, updating..." >&2
    
    local appimage_url
    local eden_version
    local new_hash
    
    if [[ "$name" == "pcsx2" ]]; then
        appimage_url="https://github.com/$owner/$repo/releases/download/$new_version/pcsx2-$new_version-linux-appimage-x64-Qt.AppImage"
    elif [[ "$name" == "eden-nightly" ]]; then
        # Extract the commit hash from version tag (e.g., v1769981453.cd9527072d -> cd9527072d)
        eden_commit=$(echo "$new_version" | grep -oP '\.\K[a-f0-9]+$')
        appimage_url="https://github.com/$owner/$repo/releases/download/$new_version/Eden-Linux-$eden_commit-amd64-clang-pgo.AppImage"
    else
        echo "Unknown package: $name" >&2
        return 1
    fi
    
    if [[ -n "$appimage_url" ]]; then
        new_hash=$(get_appimage_hash "$appimage_url" "$name")
        
        if [[ -z "$new_hash" ]]; then
            echo "Failed to get hash for $name AppImage" >&2
            return 1
        fi
        
        echo "$name|$new_version|$new_hash"
    fi
}

echo "Reading $SOURCES_FILE and $HASHES_FILE..." >&2

TEMP_FILE=$(mktemp)
trap "rm -f $TEMP_FILE" EXIT

jq -r '.pins | to_entries[] | select(.key == "pcsx2" or .key == "eden-nightly") | "\(.key)|\(.value.version)|\(.value.repository.owner)|\(.value.repository.repo)"' "$SOURCES_FILE" | \
while IFS='|' read -r name new_version owner repo; do
    current_version=$(jq -r --arg name "$name" '.pins[$name].version // ""' "$HASHES_FILE")
    
    if update_result=$(update_from_sources "$name" "$new_version" "$current_version" "$owner" "$repo"); then
        if [[ -n "$update_result" ]]; then
            echo "$update_result" >> "$TEMP_FILE"
        fi
    fi
    echo "" >&2
done

if [[ -s "$TEMP_FILE" ]]; then
    JQ_COMMAND='.'

    while IFS='|' read -r name new_version new_hash; do
        echo "Preparing update for $name: version=$new_version, hash=$new_hash..." >&2
        JQ_COMMAND="${JQ_COMMAND} | .pins[\"$name\"].version = \"$new_version\" | .pins[\"$name\"].hash = \"$new_hash\""
    done < <(grep -v '^$' "$TEMP_FILE")
    
    echo "Applying all updates to $HASHES_FILE..." >&2
    
    if [[ "$JQ_COMMAND" != "." ]]; then
        jq "$JQ_COMMAND" "$HASHES_FILE" > "$HASHES_FILE.tmp"
        
        mv "$HASHES_FILE.tmp" "$HASHES_FILE"
        
        echo "✓ Updated $HASHES_FILE" >&2
    else
        echo "No valid updates were processed." >&2
    fi
else
    echo "No updates needed" >&2
fi
