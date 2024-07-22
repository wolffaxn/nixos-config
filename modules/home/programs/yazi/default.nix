{ config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.yazi;
in
{
  options.${namespace}.programs.yazi = {
    enable = mkBoolOpt false "Whether or not to install yazi";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      yazi
    ];

    xdg.configFile = {
      "yazi/flavors/catppuccin-mocha.yazi/flavor.toml".source = config.lib.file.mkOutOfStoreSymlink ./flavors/catppuccin-mocha.yazi/flavor.toml;
      "yazi/theme.toml".source = config.lib.file.mkOutOfStoreSymlink ./theme.toml;
      "yazi/yazi.toml".source = config.lib.file.mkOutOfStoreSymlink ./yazi.toml;
    };
  };
}
