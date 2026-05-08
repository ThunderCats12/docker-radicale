#!/bin/sh
###############################################
# Purpose: Entry point for Radicale installtion
#          should create user, get cred from .env and start Radivale.
# Developer: Yaron Segev, Yar.Segev@gmail.com
# Version: 0.0.1
# Date: 7.5.2026
set -o errexit
set -o nounset
###############################################

USERS_FILE="/data/users"
CONFIG_FILE="/config/radicale.conf"

check_env() {
  if [ -z "${RADICALE_USER:-}" ] || [ -z "${RADICALE_PASSWORD:-}" ]; then
    echo "ERROR: RADICALE_USER and RADICALE_PASSWORD must be set" >&2
    exit 1
  fi
}

create_users_file() {
  echo "Creating initial Radicale user..."
  htpasswd -cbB "$USERS_FILE" "$RADICALE_USER" "$RADICALE_PASSWORD"
}

init_auth() {
  if [ ! -f "$USERS_FILE" ]; then
    check_env
    create_users_file
  else
    echo "Users file already exists, skipping creation"
  fi
}

start_radicale() {
  exec radicale --config "$CONFIG_FILE"
}

main() {
  init_auth
  start_radicale
}

main