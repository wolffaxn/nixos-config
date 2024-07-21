{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.hammerspoon;
in
{
  options.${namespace}.programs.hammerspoon = {
    enable = mkBoolOpt false "Whether or not to install hammerspoon";
  };

  config = mkIf cfg.enable {
    xdg.configFile = {
      "hammerspoon/init.lua".source = config.lib.file.mkOutOfStoreSymlink ./init.lua;
    };
  };
}
