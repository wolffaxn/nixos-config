# don't show any greetings
set fish_greeting ""

# use asdf
set -gx ASDF_CONFIG_FILE "$HOME/.config/asdf/asdfrc"
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# ripgrep
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/ripgreprc"
