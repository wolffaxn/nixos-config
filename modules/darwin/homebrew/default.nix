{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.custom.homebrew;
in
{
  options.custom.homebrew = {
    enable = mkEnableOption "homebrew";
  };

  config = mkIf cfg.enable {
    homebrew = {
      enable = true;

      caskArgs.no_quarantine = true;

      global = {
        autoUpdate = true;
        brewfile = true;
      };

      onActivation = {
        autoUpdate = true;
        # "zap" removes manually installed brews and casks
        cleanup = "zap";
        upgrade = true;
      };

      taps = [
        "homebrew/bundle"
        "homebrew/services"
      ];
    };
  };
}
