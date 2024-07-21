{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.java;
in
{
  options.${namespace}.development.java = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable java";
    };
  };

  config = mkIf cfg.enable {
    programs.java.enable = true;

    home.packages = with pkgs; [
      ant
      gradle
      maven
    ];
  };
}
