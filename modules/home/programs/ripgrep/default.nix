{ config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.ripgrep;
in
{
  options.${namespace}.programs.ripgrep = {
    enable = mkBoolOpt false "Whether or not to enable ripgrep";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ripgrep
    ];

    xdg.configFile = {
      "ripgrep/ripgreprc".source = config.lib.file.mkOutOfStoreSymlink ./ripgreprc;
    };
  };
}
