{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.wezterm;
in
{
  options.${namespace}.programs.wezterm = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable wezterm";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      wezterm
    ];

    xdg.configFile = {
      "wezterm/wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink ./wezterm.lua;
    };
  };
}
