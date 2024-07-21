# ~/.config/zsh/.zshenv

if [[ ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# command history configuration
HISTFILE=$ZDOTDIR/.zsh_history
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=1000000
SAVEHIST=1000000
# makes the switch between modes quicker
KEYTIMEOUT=1
# enables prefixed search for zsh-history-substring-search
HISTORY_SUBSTRING_SEARCH_PREFIXED=1

# set language and encoding
export LANG=en_US.UTF-8
export LANGUAGE=en_US
export LC_ALL=en_US.UTF-8
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8

# asdf
export ASDF_CONFIG_FILE="${ASDF_CONFIG_FILE:=-$HOME/.config/asdf/asdfrc}"

# aws
export AWS_CONFIG_FILE="${AWS_CONFIG_FILE:=-$HOME/.config/aws/config}"

# bat
export BAT_THEME="Catppuccin-mocha"

# dotfiles
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

# gnupg
export GPG_TTY="(tty)"

# disable analytics
export HOMEBREW_NO_ANALYTICS=1
# stop brew install from update everything
export HOMEBREW_NO_AUTO_UPDATE=1
# disable annoying hits
export HOMEBREW_NO_ENV_HINTS=1

# ripgrep
export RIPGREP_CONFIG_PATH="${RIPGREP_CONFIG_PATH:-$HOME/.config/ripgrep/ripgreprc}"

# rust
export CARGO_HOME="${CARGO_HOME:-$HOME/.config/cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.config/rustup}"

# vim
export EDITOR="nvim"
export VISUAL="nvim"

# starship
export STARSHIP_CONFIG="${STARSHIP_CONFIG:-$HOME/.config/starship.toml}"

# set XDG Base Directory Specification
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos""
