{ config, pkgs, ... }: {

  programs.fish.interactiveShellInit = "set -gx GPG_TTY (tty)";

  home.packages = with pkgs; [
    gnupg
    yubikey-manager
  ];

  home.file = {
    ".gnupg/gpg-agent.conf".source = config.lib.file.mkOutOfStoreSymlink ./gpg-agent.conf;
    ".gnupg/gpg.conf".source = config.lib.file.mkOutOfStoreSymlink ./gpg.conf;
    ".gnupg/scdaemon.conf".source = config.lib.file.mkOutOfStoreSymlink ./scdaemon.conf;
  };
}
