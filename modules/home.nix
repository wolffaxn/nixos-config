{ config, pkgs, ... }: {

  programs.home-manager.enable = true;

  home.username = "alex";
  home.homeDirectory = (if pkgs.stdenv.isDarwin then "/Users/alex" else "/home/alex");

  home.stateVersion = "23.05";
}