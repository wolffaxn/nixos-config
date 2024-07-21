{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.python;
in
{
  options.${namespace}.development.python = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable python";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;  [
      python311
      python311Packages.pip
      python311Packages.virtualenv
    ];
  };
}
