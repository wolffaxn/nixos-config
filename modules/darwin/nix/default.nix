{ config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.nix;
in
{
  options.${namespace}.nix = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "enable or disable configuration for nix";
    };
  };

  config = mkIf cfg.enable {
    nix = {
      # enable experimental nix command and flakes
      extraOptions = ''
        experimental-features = nix-command flakes
        keep-derivations = true
        keep-outputs = true
      '' + lib.optionalString (pkgs.system == "x86_64-darwin") ''
        extra-platforms = x86_64-darwin
      '';

      # optimise storage by enabling automatic garbage collection
      gc = {
        automatic = true;
        interval = { Day = 7; };
        options = "--delete-older-than 7d";
      };

      settings = {
        # automatically detects files with identical contents, and replaces them with hard links to a single copy
        auto-optimise-store = true;
        # use all available CPU cores in the system
        cores = 0;
        # maximum number of jobs that Nix will try to build in parallel
        max-jobs = "auto";
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

      # whether use the daemon instead of services.nix-daemon.enable
      useDaemon = true;
    };
  };
}
