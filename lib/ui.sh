#!/usr/bin/env bash
# lib/ui.sh - Progress bars and user interface helpers

# Colors
C_RED='\033[31m'
C_GREEN='\033[32m'
C_YELLOW='\033[33m'
C_BLUE='\033[34m'
C_CYAN='\033[36m'
C_RESET='\033[0m'

ok()    { printf "  ${C_GREEN}[ok]${C_RESET}  %s\n" "$1"; }
bad()   { printf "  ${C_RED}[!!]${C_RESET}  %s\n" "$1"; }
warn()  { printf "  ${C_YELLOW}[!!]${C_RESET}  %s\n" "$1"; }
info()  { printf "  ${C_CYAN}[..]${C_RESET}  %s\n" "$1"; }
step()  { printf "${C_BLUE}==>${C_RESET} %s\n" "$1"; }

# Progress bar: progress <current> <total> <label>
progress() {
  local current=$1
  local total=$2
  local label=$3
  local width=20
  local percent=$(( current * 100 / total ))
  local filled=$(( current * width / total ))
  local empty=$(( width - filled ))
  local p_i
  
  printf "\r  ${C_CYAN}["
  for ((p_i=0; p_i<filled; p_i++)); do printf "#"; done
  for ((p_i=0; p_i<empty; p_i++)); do printf "."; done
  printf "]${C_RESET} %3d%% %s" "$percent" "$label"
  
  if [ "$current" -eq "$total" ]; then printf "\n"; fi
}

# Confirmation: confirm <prompt> [default_y|default_n]
confirm() {
  local prompt=$1
  local default=${2:-default_n}
  local choices="[y/N]"
  [ "$default" = "default_y" ] && choices="[Y/n]"
  
  printf "  ${C_YELLOW}??${C_RESET} %s %s " "$prompt" "$choices"
  read -r response
  case "$response" in
    [yY][eE][sS]|[yY]) return 0 ;;
    [nN][oO]|[nN]) return 1 ;;
    "") [ "$default" = "default_y" ] && return 0 || return 1 ;;
    *) return 1 ;;
  esac
}

# Approval gate for commands: approve_run <label> <command...>
approve_run() {
  local label=$1
  shift
  echo
  info "Action: $label"
  printf "     ${C_CYAN}$ %s${C_RESET}\n" "$*"
  if confirm "Allow Chanakya to run this command?"; then
    "$@"
  else
    warn "Skipped: $label"
    return 1
  fi
}
