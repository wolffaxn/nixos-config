{ pkgs, ... }: {
  programs.gpg.enable = true;
  programs.fish.interactiveShellInit = "set -gx GPG_TTY (tty)";

  home.packages = with pkgs; [
    yubikey-manager
  ];
}
