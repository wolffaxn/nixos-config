{ config, pkgs, ... }: {

  imports = [
    ../../home/alacritty
    ../../home/aws
    #../../home/azure
    ../../home/dev
    ../../home/direnv
    ../../home/fish
    ../../home/gh
    ../../home/git
    ../../home/gpg
    ../../home/neovim
    ../../home/ssh
    ../../home/starship
    ../../home/wezterm
    ../../home/bat.nix
    ../../home/exa.nix
    ../../home/xdg.nix
  ];

  programs.home-manager.enable = true;

  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    # devops
    ansible
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
