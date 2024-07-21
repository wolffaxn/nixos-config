{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.java;
in
{
  options.${namespace}.development.java = {
    enable = mkBoolOpt false "Whether or not to install java";
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
