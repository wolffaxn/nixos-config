{ config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.lazygit;
in
{
  options.${namespace}.programs.lazygit = {
    enable = mkBoolOpt false "Whether or not to enable lazygit";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      lazygit
    ];

    xdg.configFile = {
      "lazygit/config.yml".source = config.lib.file.mkOutOfStoreSymlink ./config.yml;
    };
  };
}
