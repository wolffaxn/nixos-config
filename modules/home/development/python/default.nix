{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.python;
in
{
  options.${namespace}.development.python = {
    enable = mkBoolOpt false "Whether or not to install python";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;  [
      python311
      python311Packages.pip
      python311Packages.virtualenv
    ];

    xdg.configFile = {
      "pip/pip.conf".source = config.lib.file.mkOutOfStoreSymlink ./pip.conf;
    };
  };
}
