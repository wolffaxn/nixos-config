{ lib, pkgs, ... }: {

  homebrew = {
    enable = true;

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    taps = [
      # pre-configuration for brew sources
      "homebrew/cask"
      "homebrew/cask-fonts"
    ];
    casks = [
      "amethyst"
      "google-chrome"
      "iterm2"
      # fonts
      "font-fira-code"
      "font-fira-mono"
      "font-hack"
      "font-jetbrains-mono"
    ];
    brews = [];
  };
}
