{ config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.tmux;
in
{
  options.${namespace}.programs.tmux = {
    enable = mkBoolOpt false "Whether or not to install tmux";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      tmux
    ];

    xdg.configFile = {
      "tmux/gitmux.yml".source = config.lib.file.mkOutOfStoreSymlink ./gitmux.yml;
      "tmux/tmux.conf".source = config.lib.file.mkOutOfStoreSymlink ./tmux.conf;
    };
  };
}
