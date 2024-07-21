{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.kotlin;
in
{
  options.${namespace}.development.kotlin = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable kotlin";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gradle
      kotlin
    ];
  };
}
