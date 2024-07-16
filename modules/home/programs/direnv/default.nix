{  config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.direnv;
in
{
  options.${namespace}.programs.direnv = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable direnv";
    };
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
