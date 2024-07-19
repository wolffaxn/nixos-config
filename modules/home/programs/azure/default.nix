{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.azure;
in
{
  options.${namespace}.programs.azure = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable azure cli";
    };
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
