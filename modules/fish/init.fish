set -g fish_greeting

fish_add_path -p \
  $HOME/.nix-profile/bin \
  /etc/profiles/per-user/$USER/bin \
  /nix/var/nix/profiles/default/bin
