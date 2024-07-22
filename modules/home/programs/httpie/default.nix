{ config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.httpie;
in
{
  options.${namespace}.programs.httpie = {
    enable = mkBoolOpt false "Whether or not to enable httpie";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      httpie
    ];

    xdg.configFile = {
      "httpie/config.json".source = config.lib.file.mkOutOfStoreSymlink ./config.json;
    };
  };
}
