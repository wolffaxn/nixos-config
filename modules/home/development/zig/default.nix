{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.zig;
in
{
  options.${namespace}.development.zig = {
    enable = mkBoolOpt false "Whether or not to install zig";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      zig
    ];
  };
}
