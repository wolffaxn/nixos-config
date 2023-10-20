{ config, pkgs, ... }: {
  imports = [
    ../../home/alacritty
    ../../home/aws
    ../../home/azure
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
    ../../home/zellij
    #../../home/zsh
    ../../home/fonts.nix
    ../../home/xdg.nix
  ];

  programs.home-manager.enable = true;

  home = {
    enableNixpkgsReleaseCheck = false;

    packages = with pkgs; [
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
      cmatrix
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
      # container runtime on macOS
      colima
      # vm host for macOS & iOS
      utm

      # keepass fork (need it only on macOS)
      keepassxc
      
      # vpn
      tailscale
      wireguard-tools
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      # container runtimes on Linux
      #docker
      #docker-compose
      podman
      podman-compose
    ];

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
    homeDirectory = (if pkgs.stdenv.isDarwin then "/Users/alex" else "/home/alex");

    stateVersion = "23.05";
  };
}
