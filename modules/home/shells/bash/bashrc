#!/usr/bin/env bash

if [ "$(arch)" = arm64 ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

export EDITOR="nvim"
export GIT_EDITOR="nvim"

export DOTFILES="$HOME/dotfiles"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

alias cat='bat'
alias cls='clear'
alias df='df -h'
alias du='du -h'
alias ls='eza'

eval "$(starship init bash)"

eval "$(fzf --bash)"

# shellcheck disable=SC1091
source "/opt/homebrew/opt/asdf/libexec/asdf.sh"
