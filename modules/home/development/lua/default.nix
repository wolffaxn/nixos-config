{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.lua;
in
{
  options.${namespace}.development.lua = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable lua";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      lua
    ];
  };
}
