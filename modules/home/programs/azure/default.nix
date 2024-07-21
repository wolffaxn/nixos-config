{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.azure;
in
{
  options.${namespace}.programs.azure = {
    enable = mkBoolOpt false "Whether or not to enable azure cli";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      azure-cli
    ];

    xdg.configFile = {
      "azure/config".source = config.lib.file.mkOutOfStoreSymlink ./config;
    };
  };
}
