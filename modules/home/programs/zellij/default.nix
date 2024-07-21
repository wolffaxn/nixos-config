{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.zellij;
in
{
  options.${namespace}.programs.zellij = {
    enable = mkBoolOpt false "Whether or not to enable zellij";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      zellij
    ];

    xdg.configFile."zellij/config.kdl" = {
      source = config.lib.file.mkOutOfStoreSymlink ./config.kdl;
    };
  };
}
