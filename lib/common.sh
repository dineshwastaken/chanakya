#!/usr/bin/env bash
# lib/common.sh - Shared logic for Chanakya CLI

# Locate REPO_ROOT and CHANAKYA_DIR
# We assume the shim at root or the script in .chanakya/bin/
find_roots() {
  local target="${BASH_SOURCE[0]}"
  # Walk up from lib/ to find the engine root
  local lib_dir; lib_dir="$(cd "$(dirname "$target")" && pwd)"
  ENGINE_ROOT="$(cd "$lib_dir/.." && pwd)"
  
  # Try to find REPO_ROOT by walking up from current directory until we find .git or chanakya shim
  local curr; curr="$(pwd)"
  while [ "$curr" != "/" ]; do
    if [ -f "$curr/chanakya" ] || [ -d "$curr/.git" ]; then
      REPO_ROOT="$curr"
      break
    fi
    curr="$(dirname "$curr")"
  done
  : "${REPO_ROOT:=$(pwd)}"
  
  # CHANAKYA_DIR is the project-specific instance folder in the consumer
  CHANAKYA_DIR="$REPO_ROOT/.chanakya"
}

# manifest_value KEY [FILE] -> prints the value of a top-level "KEY: value" line
manifest_value() {
  local key=$1
  local file=${2:-"$CHANAKYA_DIR/manifest.yaml"}
  [ -f "$file" ] || return 0
  grep -E "^$key:" "$file" 2>/dev/null | head -1 | sed -E "s/^$key:[[:space:]]*//" || true
}

# prop_value KEY [FILE] -> prints the value of a "KEY=value" line
prop_value() {
  local key=$1
  local file=${2:-"$CHANAKYA_DIR/repo-paths.properties"}
  [ -f "$file" ] || return 0
  local raw
  raw="$(grep -E "^$key=" "$file" | head -1 | sed -E "s/^$key=//" || true)"
  printf '%s' "${raw//\$\{HOME\}/$HOME}"
}

# Guard against git writes
git_safe() {
  local cmd=$1
  case "$cmd" in
    add|commit|push|reset|restore|stash|tag|branch|merge|rebase)
      bad "Chanakya is prohibited from running 'git $cmd'. Please run this manually."
      return 1
      ;;
  esac
  
  # For safe commands, still ask for approval if it's a network or structural action
  case "$cmd" in
    clone|fetch|pull|checkout)
      approve_run "Git $cmd" git "$@"
      ;;
    *)
      git "$@"
      ;;
  esac
}

# Check if a tool exists
has_tool() {
  command -v "$1" >/dev/null 2>&1
}

# Initialize roots
find_roots
