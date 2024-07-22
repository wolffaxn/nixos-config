{ config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.htop;
in
{
  options.${namespace}.programs.htop = {
    enable = mkBoolOpt false "Whether or not to enable htop";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      htop
    ];

    xdg.configFile = {
      "htop/htoprc".source = config.lib.file.mkOutOfStoreSymlink ./htoprc;
    };
  };
}
