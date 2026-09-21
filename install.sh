#!/bin/sh
# Install the original Hondi PNG without image conversion or extra runtimes.
set -eu
main() {
  source_dir=''
  case "${1:-}" in
    --from) [ "$#" -eq 2 ] || { echo 'Usage: sh install.sh [--from REPOSITORY_DIR]' >&2; exit 2; }; source_dir=$2 ;;
    '') ;;
    *) echo 'Usage: sh install.sh [--from REPOSITORY_DIR]' >&2; exit 2 ;;
  esac
  pet_home=${CODEX_HOME:-${HOME:?HOME is required}/.codex}
  case "$pet_home" in /*) ;; *) echo 'CODEX_HOME must be an absolute path.' >&2; exit 1 ;; esac
  if command -v shasum >/dev/null 2>&1; then
    hash_file() { shasum -a 256 "$1" | awk '{print $1}'; }
  elif command -v sha256sum >/dev/null 2>&1; then
    hash_file() { sha256sum "$1" | awk '{print $1}'; }
  else
    echo 'Install shasum or sha256sum first.' >&2; exit 1
  fi
  umask 077
  mkdir -p "$pet_home/pets"
  target=$pet_home/pets/hondi
  lock=$pet_home/.hondi-install.lock
  mkdir "$lock" 2>/dev/null || { echo "Another install is active (lock: $lock)." >&2; exit 1; }
  stage=''
  backup=''
  cleanup() {
    status=$?
    trap - EXIT HUP INT TERM
    if [ -n "$backup" ] && [ ! -e "$target" ] && [ ! -L "$target" ]; then
      mv "$backup" "$target" || echo "Restore manually from $backup" >&2
    fi
    [ -z "$stage" ] || rm -rf "$stage"
    rmdir "$lock"
    exit "$status"
  }
  trap cleanup EXIT
  trap 'exit 130' INT
  trap 'exit 143' HUP TERM
  stage=$(mktemp -d "$pet_home/pets/.hondi-install.XXXXXX")
  if [ -n "$source_dir" ]; then
    cp "$source_dir/assets/hondi-spritesheet-v2.png" "$stage/spritesheet.png"
  else
    command -v curl >/dev/null 2>&1 || { echo 'curl is required.' >&2; exit 1; }
    curl --fail --show-error --silent --location --proto '=https' --proto-redir '=https' \
      --connect-timeout 15 --max-time 180 --retry 2 \
      'https://raw.githubusercontent.com/qkrwlgus89/hondi-codex-pet/main/assets/hondi-spritesheet-v2.png' \
      -o "$stage/spritesheet.png"
  fi
  expected=8b2de2ac6ef0e65a03557fb95b2c25ba4c2b8b04747e55f8827241367cf62ace
  [ "$(hash_file "$stage/spritesheet.png")" = "$expected" ] || { echo 'Sprite checksum mismatch; existing pet was not changed.' >&2; exit 1; }
  cat > "$stage/pet.json" <<'JSON'
{
  "id": "hondi",
  "displayName": "혼디 (Hondi)",
  "description": "A Jeju dog that carries a tangerine and dozes off while sitting.",
  "spriteVersionNumber": 2,
  "spritesheetPath": "spritesheet.png"
}
JSON
  if [ -L "$target" ]; then
    echo "Refusing to replace symlink: $target" >&2; exit 1
  fi
  if [ -d "$target" ] && cmp -s "$stage/pet.json" "$target/pet.json" && cmp -s "$stage/spritesheet.png" "$target/spritesheet.png"; then
    echo "Hondi is already installed: $target"
    return
  fi
  if [ -e "$target" ]; then
    mkdir -p "$pet_home/pet-backups"
    backup=$(mktemp -d "$pet_home/pet-backups/hondi.XXXXXX")
    rmdir "$backup"
    mv "$target" "$backup"
  fi
  mv "$stage" "$target"
  stage=''
  echo "Installed Hondi: $target"
  [ -z "$backup" ] || echo "Previous installation saved: $backup"
  echo 'Open Settings > Pets, refresh, and select 혼디 (Hondi). Restart the app if needed.'
}
main "$@"
