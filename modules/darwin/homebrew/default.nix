{ config, namespace, ... }:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.homebrew;
in
{
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
        "homebrew/bundle";
        "homebrew/services";
      ];
    };
  };
}
