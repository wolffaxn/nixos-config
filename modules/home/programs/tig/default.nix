{ config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.tig;
in
{
  options.${namespace}.programs.tig = {
    enable = mkBoolOpt false "Whether or not to enable tig";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      tig
    ];

    xdg.configFile = {
      "tig/config".source = config.lib.file.mkOutOfStoreSymlink ./config;
    };
  };
}
