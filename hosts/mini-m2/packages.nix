{ pkgs, ... }: {

  home.packages = with pkgs; [
    # Radically simple IT automation
    ansible
    # A cross-platform graphical process/system monitor with a customizable interface
    bottom
    # A monitor of resources
    btop
    # High-quality data compression program
    bzip2
    # Command line client for Nix binary cache hosting https://cachix.org
    cachix
    # Simulates the falling characters theme from The Matrix movie
    cmatrix
    # The GNU Core Utilities
    coreutils
    # A command line tool for transferring files with URL syntax
    curl
    # Convert text files with DOS or Mac line breaks to Unix line breaks and vice versa
    dos2unix
    # A simple, fast and user-friendly alternative to find
    fd
    # Graph visualization tools
    graphviz
    # GNU zip compression program
    gzip
    # An interactive process viewer
    htop
    # A command line HTTP client whose goal is to make CLI human-friendly
    httpie
    # Display bandwidth usage on a network interface
    iftop
    # Tool to measure IP bandwidth using UDP or TCP
    iperf
    # A lightweight and flexible command-line JSON processor
    jq
    # Growing collection of the unix tools that nobody thought to write long ago when unix was young
    moreutils
    # A network diagnostics tool
    mtr
    # A fast, highly customizable system info script
    neofetch
    # Free TLS/SSL implementation
    netcat
    # A free and open source utility for network discovery and security auditing
    nmap
    # A cryptographic library that implements the SSL and TLS protocols
    openssl
    # A tool for creating identical machine images for multiple platforms from a single source configuration
    packer
    # Conversion between markup formats
    pandoc
    # Draw UML diagrams using a simple and human readable text description
    plantuml
    # A utility that combines the usability of The Silver Searcher with the raw speed of grep
    ripgrep 
    # Shell script analysis tool
    shellcheck
    # Tool for building, changing, and versioning infrastructure
    terraform
    # Open source source code editor
    vscodium
    # An extraction utility for archives compressed in .zip format
    unzip
    # A general-purpose data compression software, successor of LZMA
    xz
    # A linter for YAML files
    yamllint
    # Command-line tool to download videos from YouTube.com and other sites
    youtube-dl
    # Compressor/archiver for creating and modifying zipfiles
    zip
  ]
  ++ lib.optionals pkgs.stdenv.isDarwin [
    # Container runtimes with minimal setup
    colima
    # Offline password manager with many features
    keepassxc
    # The node agent for Tailscale, a mesh VPN built on WireGuard
    tailscale
    # Full featured system emulator and virtual machine host for iOS and macOS
    utm
    # Tools for the WireGuard secure network tunnel
    wireguard-tools
  ]
  ++ lib.optionals pkgs.stdenv.isLinux [
    # A program for managing pods, containers and container images
    podman
    # An implementation of docker-compose with podman backend
    podman-compose
  ];
}
