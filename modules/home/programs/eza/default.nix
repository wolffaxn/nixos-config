{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.eza;
in
{
  options.${namespace}.programs.eza = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable eza";
    };
  };

  config = mkIf cfg.enable {
    programs.eza = {
      enable = true;
      #enableBashIntegration = true;
      #enableFishIntegration = true;
      #enableZshIntegration = true;
      enableIonIntegration = false;
      enableNushellIntegration = false;
    };
  };
}
