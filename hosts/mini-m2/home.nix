{ config, pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./packages.nix
    ../../modules/alacritty
    #../../modules/aws
    ../../modules/azure
    ../../modules/cli
    ../../modules/dev
    ../../modules/direnv
    ../../modules/fish
    ../../modules/gh
    ../../modules/git
    ../../modules/gpg
    ../../modules/neovim
    ../../modules/nix
    ../../modules/ssh
    ../../modules/starship
    ../../modules/utils-bin
    ../../modules/wezterm
    ../../modules/yabai
    ../../modules/yamllint
    ../../modules/zellij
    ../../modules/zoxide
    ../../modules/zsh
    ../../modules/xdg.nix
  ];

  # let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home = {
    enableNixpkgsReleaseCheck = false;

    sessionVariables = {
      EDITOR = "nvim";
      
      LANG = "en_US.UTF-8";
      LANGUAGE = "en_US";
      LC_ALL = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";

      PAGER = "less -FirSwX";
    };

    username = "alex";
    homeDirectory = "/Users/alex";

    stateVersion = "23.05";
  };
}
