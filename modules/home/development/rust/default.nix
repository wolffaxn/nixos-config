{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.rust;
in
{
  options.${namespace}.development.rust = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable rust";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rustup
      sccache
    ];
  };
}
