{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.tools.homebrew;
in
{
  options.${namespace}.tools.homebrew = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "enable or disable homebrew";
    };
  };

  config = mkIf cfg.enable {

    environment.systemPath = [ "/opt/homebrew/bin" ];

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
