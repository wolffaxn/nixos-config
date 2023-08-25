{ lib, pkgs, ... }: {

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
}
