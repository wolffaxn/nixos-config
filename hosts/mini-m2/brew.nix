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
    ];
    casks = [
      "amethyst"
      "brave-browser"
      "google-chrome"
      "iterm2"
      "spotify"
    ];
    brews = [];
  };
}
