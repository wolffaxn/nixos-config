{ lib, pkgs, ... }: {

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.package = pkgs.nixUnstable;

  # auto upgrade nix package and daemon service
  services.nix-daemon.enable = true;

  system.activationScripts.postActivation.text = ''
    # set fish as the default shell
    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish alex
  '';

  homebrew = {
    enable = true;
    global.brewfile = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;

    taps = [
      # pre-configuration for brew sources
      "homebrew/cask"
      "homebrew/cask-fonts"
    ];
    casks = [
      "iterm2"
      "vscodium"
      # fonts
      "font-fira-code"
      "font-fira-mono"
      "font-hack"
      "font-jetbrains-mono"
    ];
    brews = [
      "ansible"
      "awscli"
      "bzip2"
      "coreutils"
      "curl"
      "dos2unix"
      "graphviz"
      "htop-osx"
      "httpie"
      "hub"
      "jq"
      "molecule"
      "moreutils"
      "neofetch"
      "openssl"
      "packer"
      "pandoc"
      "plantuml"
      "terraform"
      "tmux"
      # Skipping upx (no bottle for Apple Silicon)
      #"upx"
    ];
  };
}
