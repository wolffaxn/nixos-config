{ pkgs, ... }: {

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;    

  nix.package = pkgs.nixUnstable;

  # auto upgrade nix package and daemon service
  services.nix-daemon.enable = true;

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
      "gpg"
      "git"
      "zsh"
      "zsh-completions"
    ];
  };
}