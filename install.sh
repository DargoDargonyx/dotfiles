#!/usr/bin/env bash

set -euo pipefail
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Backup/dotfiles}"


log() {
  echo "[dotfiles] $1"
}


backup() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    log "Backing up $target to $target.bak"
    mv "$target" "$target.bak"
  fi
}


link() {
  local src="$1"
  local dest="$2"

  backup "$dest"
  log "Linking $dest to $src"
  ln -sfn "$src" "$dest"
}


install() {
  log "Installing dotfiles..."
  mkdir -p "$HOME/.config"

  # bash
  link "$DOTFILES_DIR/bash/.bash_profile" "$HOME/.bash_profile"
  link "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
  link "$DOTFILES_DIR/bash/.bashrc.d" "$HOME/.bashrc.d"
  # nvim
  link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
  # kitty
  link "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
  # i3
  link "$DOTFILES_DIR/i3" "$HOME/.config/i3"
  # i3blocks
  link "$DOTFILES_DIR/i3blocks" "$HOME/.config/i3blocks"
  # misc
  link "$DOTFILES_DIR/misc/.dircolors" "$HOME/.dircolors"

  log "Install complete"
}


sync_file() {
  local src="$1"
  local dest="$2"

  if [ -e "$src" ]; then
    log "Syncing $src to $dest"
    mkdir -p "$(dirname "$dest")"
    cp -r "$src" "$dest"
  else
    log "Skipping $src (not found)"
  fi
}


sync() {
  log "Syncing local configs to the git repo..."

  # bash
  sync_file "$HOME/.bash_profile" "$DOTFILES_DIR/bash/"
  sync_file "$HOME/.bashrc" "$DOTFILES_DIR/bash/"
  sync_file "$HOME/.bashrc.d" "$DOTFILES_DIR/bash/"
  # nvim
  sync_file "$HOME/.config/nvim" "$DOTFILES_DIR/"
  # kitty
  sync_file "$HOME/.config/kitty" "$DOTFILES_DIR/"
  # i3
  sync_file "$HOME/.config/i3" "$DOTFILES_DIR/"
  # i3blocks
  sync_file "$HOME/.config/i3blocks" "$DOTFILES_DIR/"
  # misc
  sync_file "$HOME/.dircolors" "$DOTFILES_DIR/misc/"

  log "Sync complete"
}


case "${1:-}" in
  install)
    install
    ;;
  sync)
    sync
    ;;
  *)
    echo "Usage: $0 {install|sync}"
    exit 1
    ;;
esac
