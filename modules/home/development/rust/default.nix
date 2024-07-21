{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.rust;
in
{
  options.${namespace}.development.rust = {
    enable = mkBoolOpt false "Whether or not to install rust";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rustup
      sccache
    ];
  };
}
