# lib/version.sh - Version management for Chanakya

# Source of truth for the version
VERSION_FILE="$ENGINE_ROOT/VERSION"

# Get current version
get_version() {
  cat "$VERSION_FILE" 2>/dev/null || echo "0.0.0"
}

# Bump version: bump_version <major|minor|patch>
bump_version() {
  local type=${1:-patch}
  local current; current=$(get_version)
  local major; major=$(echo "$current" | cut -d. -f1)
  local minor; minor=$(echo "$current" | cut -d. -f2)
  local patch; patch=$(echo "$current" | cut -d. -f3)

  case "$type" in
    major) major=$((major + 1)); minor=0; patch=0 ;;
    minor) minor=$((minor + 1)); patch=0 ;;
    patch) patch=$((patch + 1)) ;;
  esac

  local new_version="$major.$minor.$patch"
  echo "$new_version" > "$VERSION_FILE"
  echo "$new_version"
}
