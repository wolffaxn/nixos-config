{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.zoxide;
in
{
  options.${namespace}.programs.zoxide = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable zoxide";
    };
  };

  config = mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
