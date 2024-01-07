{ ... }: {

  homebrew = {
    enable = true;

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      upgrade = true;
    };
    brews = [

    ];
    casks = [
      "amethyst"
      "brave-browser"
      "google-chrome"
      "iterm2"
      "karabiner-elements"
      "spotify"
    ];
    taps = [
      # pre-configuration for brew sources
      
      # Tapping homebrew/cask is no longer typically necessary
      #"homebrew/cask"
    ];
  };
}
