{ config, pkgs, ... }: {

  imports = [
    ../../modules/alacritty
    #../../modules/azure
    ../../modules/dev
    ../../modules/fish
    ../../modules/gh
    ../../modules/git
    ../../modules/gpg
    ../../modules/neovim
    ../../modules/ssh
    ../../modules/starship
    ../../modules/wezterm
    ../../modules/bat.nix
    ../../modules/exa.nix
    ../../modules/xdg.nix
  ];

  programs.home-manager.enable = true;

  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    # devops
    ansible
    awscli2
    terraform

    # filesystem
    dos2unix
    fd
    ripgrep
    curl

    # compression
    bzip2
    gzip
    unzip
    xz
    zip

    # graphics
    graphviz
    plantuml

    # networking
    iftop
    mtr

    # misc
    coreutils
    httpie
    jq
    moreutils
    neofetch
    openssl
    packer
    pandoc
  ];

  home.username = "alex";
  home.homeDirectory = (if pkgs.stdenv.isDarwin then "/Users/alex" else "/home/alex");

  home.stateVersion = "23.05";
}
