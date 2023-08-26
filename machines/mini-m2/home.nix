{ config, pkgs, ... }: {
  imports = [
    ../../home/alacritty
    ../../home/aws
    #../../home/azure
    ../../home/cli
    ../../home/dev
    ../../home/direnv
    ../../home/fish
    ../../home/gh
    ../../home/git
    ../../home/gpg
    ../../home/neovim
    ../../home/ssh
    ../../home/starship
    ../../home/utils-bin
    ../../home/wezterm
    ../../home/yabai
    #../../home/zsh
    ../../home/bat.nix
    ../../home/exa.nix
    ../../home/fonts.nix
    ../../home/xdg.nix
  ];

  programs.home-manager.enable = true;

  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    # devops
    ansible
    terraform

    # editor
    vscodium

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
    iperf3
    mtr
    netcat
    nmap


    # process
    bottom
    btop
    htop

    # misc
    coreutils
    httpie
    jq
    moreutils
    neofetch
    openssl
    packer
    pandoc
  ]
  ++ lib.optionals pkgs.stdenv.isDarwin [
    # container runtimes on macOS
    colima
    # vm host for macOS & iOS
    utm

    ## misc

    # keepass fork (need it only on macOS)
    keepassxc
  ]
  ++ lib.optionals pkgs.stdenv.isLinux [
    # container runtimes on Linux
    #docker
    #docker-compose
    podman
    podman-compose
  ];

  home.username = "alex";
  home.homeDirectory = (if pkgs.stdenv.isDarwin then "/Users/alex" else "/home/alex");

  home.stateVersion = "23.05";
}
