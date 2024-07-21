{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.kotlin;
in
{
  options.${namespace}.development.kotlin = {
    enable = mkBoolOpt false "Whether or not to install kotlin";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gradle
      kotlin
    ];
  };
}
