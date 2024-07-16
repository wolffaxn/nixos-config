{ pkgs, ... }:

{
  custom = {
    nix.enable = true;

    system = {
      defaults.enable = true;
      fonts.enable = true;
    };

    tools.homebrew.enable = true;
  };

  homebrew = {
    brews = [
      "age"
      "ansible"
      "ansible-lint"
      "asdf"
      "autoconf"
      "automake"
      "awscli"
      "azure-cli"
      "bash"
      "bash-completion"
      "bat"
      "btop"
      "bzip2"
      "ca-certificates"
      "cmatrix"
      "coreutils"
      "csshx"
      "curl"
      "diff-so-fancy"
      "direnv"
      "dockutil"
      "dos2unix"
      "exiftool"
      "eza"
      "fd"
      "ffmpegthumbnailer"
      "fish"
      "ffmpeg"
      "fzf"
      "gh"
      "git"
      "gitleaks"
      "git-crypt"
      "git-delta"
      "git-lfs"
      "gnu-sed"
      "graphviz"
      "grc"
      "helmfile"
      "htop"
      "httpie"
      "hub"
      "lazygit"
      "jenv"
      "jq"
      "jump"
      "molecule"
      "moreutils"
      "nvim"
      "openssh"
      "openssl@3"
      "opentofu"
      "packer"
      "pandoc"
      "pgcli"
      "plantuml"
      "poppler"
      "protobuf"
      "pstree"
      "pyenv"
      "ripgrep"
      "screenfetch"
      "shellcheck"
      "sqlite"
      "ssh-copy-id"
      "starship"
      "stylua"
      "tailscale"
      "terraform"
      "terragrunt"
      "tig"
      "tree"
      "unar"
      "watch"
      "wget"
      "yazi"
      "ykman"
      "zoxide"

      # development
      "ant"
      "delve"
      "gopls"
      "gradle"
      "lua"
      "maven"
      "rustup-init"
      "sccache"
      "zig"

      # gnupg related tools
      "gnupg"
      "hopenpgp-tools"
      "ykman"

      # tmux related tools
      "tmux"
      "tpm"
      "arl/arl/gitmux"

      # zsh
      "zsh"
      "zsh-autosuggestions"
      "zsh-completions"
      "zsh-history-substring-search"
      "zsh-syntax-highlighting"
      "zsh-fast-syntax-highlighting"
    ];
    casks = [
      "alacritty"
      "amethyst"
      "brave-browser"
      "discord"
      "google-chrome"
      "hammerspoon"
      "iterm2"
      "karabiner-elements"
      "keepassxc"
      "obsidian"
      "raycast"
      "spotify"
      "utm"
      "vscodium"
      "wezterm"
    ];
    taps = [
      "arl/arl"
    ];
  };

  networking = {
    computerName = "Mac mini";
    hostName = "mars";
    localHostName = "mars";

    # configure DNS for WiFi
    knownNetworkServices = [
      "Ethernet"
      "Thunderbolt Bridge"
      "Wi-Fi"
    ];
    # use cloudflare
    dns = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };

  # auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  # keyboard
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  time.timeZone = "Europe/Berlin";

  # we need to set this up so Nix knows what our home directory is (https://github.com/nix-community/home-manager/issues/4026)
  users.users.alex = {
    name = "alex";
    home = "/Users/alex";
    shell = pkgs.zsh;
  };

  system.stateVersion = 4;
}
