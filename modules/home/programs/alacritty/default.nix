{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.alacritty;
in
{
  options.${namespace}.programs.alacritty = {
    enable = mkBoolOpt false "Whether or not to enable alacritty";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      alacritty
    ];

    xdg.configFile = {
      "alacritty/themes".source = config.lib.file.mkOutOfStoreSymlink ./themes;
      "alacritty/alacritty.toml".source = config.lib.file.mkOutOfStoreSymlink ./alacritty.toml;
    };
  };
}
