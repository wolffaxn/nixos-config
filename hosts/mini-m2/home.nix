{ config, pkgs, ... }: {
  imports = [
    ../../modules/alacritty
    ../../modules/aws
    ../../modules/azure
    ../../modules/cli
    ../../modules/dev
    ../../modules/direnv
    ../../modules/fish
    ../../modules/gh
    ../../modules/git
    ../../modules/gpg
    ../../modules/neovim
    ../../modules/ssh
    ../../modules/starship
    ../../modules/utils-bin
    ../../modules/wezterm
    ../../modules/yabai
    ../../modules/zellij
    ../../modules/zsh
    ../../modules/fonts.nix
    ../../modules/xdg.nix
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

    stateVersion = "23.05";
  };
}
