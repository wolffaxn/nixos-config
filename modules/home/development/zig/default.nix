{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.zig;
in
{
  options.${namespace}.development.zig = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable zig";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      zig
    ];
  };
}
