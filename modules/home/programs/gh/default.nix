{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.gh;
in
{
  options.${namespace}.programs.gh = {
    enable = mkBoolOpt false "Whether or not to enable gh";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gh
    ];

    xdg.configFile = {
      "gh/config".source = config.lib.file.mkOutOfStoreSymlink ./config.yml;
    };
  };
}
