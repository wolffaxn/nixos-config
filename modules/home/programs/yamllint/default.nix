{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.yamllint;
in
{
  options.${namespace}.programs.yamllint = {
    enable = mkBoolOpt false "Whether or not to enable yamllint";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      yamllint
    ];

    xdg.configFile."yamllint/config" = {
      source = config.lib.file.mkOutOfStoreSymlink ./config.yml;
    };
  };
}
