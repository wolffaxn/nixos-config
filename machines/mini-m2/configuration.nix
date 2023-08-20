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

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-derivations = true
      keep-outputs = true
    '';

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };

    package = pkgs.nix;

    settings = {
      auto-optimise-store = false;
      cores = 0;
      max-jobs = 8;
      # see https://github.com/NixOS/nix/issues/4119
      sandbox = false;
      allowed-users = ["@wheel"];
      trusted-users = ["root" "alex"];

      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  nixpkgs.config = {
    # allow broken nixpkgs
    allowBroken = true;
    # allow unfree packages
    allowUnfree = true;
  };

  services.nix-daemon.enable = true;

  system.activationScripts.postActivation.text = ''
    # set fish as the default shell
    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish alex
  '';

  time.timeZone = "Europe/Berlin";
}
