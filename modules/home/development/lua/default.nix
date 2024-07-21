{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.lua;
in
{
  options.${namespace}.development.lua = {
    enable = mkBoolOpt false "Whether or not to install lua";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      lua
    ];
  };
}
