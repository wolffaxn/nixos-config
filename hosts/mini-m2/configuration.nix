{ inputs, lib, pkgs, ... }: {

  imports = [
    ./brew.nix
  ];

  # Nix configuration

  nix = {
    # https://github.com/LnL7/nix-darwin/issues/287
    #configureBuildUsers = true;

    # enable experimental nix command and flakes
    extraOptions = ''
      # Linking issue: https://github.com/NixOS/nix/issues/7273
      auto-optimise-store = false
      experimental-features = nix-command flakes
      #keep-derivations = true
      #keep-failed = true
      keep-going = true
      #keep-outputs = true
    '' + lib.optionalString (pkgs.system == "x86_64-darwin") ''
      extra-platforms = x86_64-darwin      
    '';

    # optimise storage by enabling automatic garbage collection
    gc = {
      automatic = true;
      interval = { Day = 7; };
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

  # configure DNS for WiFi
  networking.knownNetworkServices = ["Wi-Fi"];
  # use cloudflare
  networking.dns = ["1.1.1.1" "1.0.0.1"];

  # auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  # keyboard
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

#  system.activationScripts.postActivation.text = ''
#    # set fish as the default shell
#    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish alex
#  '';

  time.timeZone = "Europe/Berlin";

  # we need to set this up so Nix knows what our home directory is (https://github.com/nix-community/home-manager/issues/4026)
  users.users."alex" = {
    name = "alex";
    home = "/Users/alex";
    shell = pkgs.fish;
  };
}
