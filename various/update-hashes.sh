#!/usr/bin/env bash

set -euo pipefail

HASHES_FILE="${1:-hashes.json}"

if [[ ! -f "$HASHES_FILE" ]]; then
    echo "Error: $HASHES_FILE not found" >&2
    exit 1
fi

get_latest_release() {
    local owner=$1
    local repo=$2
    local include_prerelease=$3
    
    echo "Fetching latest release for $owner/$repo (pre-release: $include_prerelease)..." >&2
    
    if [[ "$include_prerelease" == "true" ]]; then
        # Get the latest release (including pre-releases)
        curl -s "https://api.github.com/repos/$owner/$repo/releases" | \
            jq -r '.[0].tag_name' 2>/dev/null
    else
        # Get the latest stable release only
        curl -s "https://api.github.com/repos/$owner/$repo/releases/latest" | \
            jq -r '.tag_name' 2>/dev/null
    fi
}

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

get_tarball_hash() {
    local url=$1
    local name=$2
    echo "Calculating hash for tarball at $url..." >&2
    
    local hash
    hash=$(nix-prefetch-url "$url" 2>/dev/null)
    if [[ -n "$hash" ]]; then
        nix hash to-sri --type sha256 "$hash" 2>/dev/null || echo "$hash"
    fi
}

update_package() {
    local name=$1
    local current_version=$2
    local owner=$3
    local repo=$4
    local include_prerelease=$5
    
    echo "=== Checking $name ===" >&2
    echo "Current version: $current_version" >&2
    
    # Get latest release from GitHub
    local new_version
    new_version=$(get_latest_release "$owner" "$repo" "$include_prerelease")
    
    if [[ -z "$new_version" || "$new_version" == "null" ]]; then
        echo "Failed to fetch latest release for $name" >&2
        return 1
    fi
    
    echo "Latest version: $new_version" >&2
    
    if [[ "$new_version" == "$current_version" ]]; then
        echo "Already up to date, skipping" >&2
        return 0
    fi
    
    echo "Version mismatch, updating..." >&2
    
    local download_url
    local eden_commit
    local new_hash
    
    if [[ "$name" == "pcsx2" ]]; then
        download_url="https://github.com/$owner/$repo/releases/download/$new_version/pcsx2-$new_version-linux-appimage-x64-Qt.AppImage"
        new_hash=$(get_appimage_hash "$download_url" "$name")
    elif [[ "$name" == "eden-nightly" ]]; then
        # Extract the commit hash from version tag (e.g., v1769981453.cd9527072d -> cd9527072d)
        eden_commit=$(echo "$new_version" | grep -oP '\.\K[a-f0-9]+$')
        download_url="https://github.com/$owner/$repo/releases/download/$new_version/Eden-Linux-$eden_commit-amd64-clang-pgo.AppImage"
        new_hash=$(get_appimage_hash "$download_url" "$name")
    elif [[ "$name" == "glide" ]]; then
        download_url="https://github.com/$owner/$repo/releases/download/$new_version/glide.linux-x86_64.tar.xz"
        new_hash=$(get_tarball_hash "$download_url" "$name")
    else
        echo "Unknown package: $name" >&2
        return 1
    fi
    
    if [[ -z "$new_hash" ]]; then
        echo "Failed to get hash for $name" >&2
        return 1
    fi
    
    echo "$name|$new_version|$new_hash"
}

echo "Reading $HASHES_FILE..." >&2

TEMP_FILE=$(mktemp)
trap "rm -f $TEMP_FILE" EXIT

# Define package configurations: name|owner|repo|include_prerelease
declare -A package_configs=(
    ["pcsx2"]="PCSX2|pcsx2|true"
    ["eden-nightly"]="Eden-CI|Nightly|false"
    ["glide"]="glide-browser|glide|false"
)

jq -r '.pins | to_entries[] | "\(.key)|\(.value.version)"' "$HASHES_FILE" | \
while IFS='|' read -r name current_version; do
    if [[ -z "${package_configs[$name]:-}" ]]; then
        echo "Warning: No configuration found for $name, skipping..." >&2
        echo "" >&2
        continue
    fi
    
    IFS='|' read -r owner repo include_prerelease <<< "${package_configs[$name]}"
    
    if update_result=$(update_package "$name" "$current_version" "$owner" "$repo" "$include_prerelease"); then
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
