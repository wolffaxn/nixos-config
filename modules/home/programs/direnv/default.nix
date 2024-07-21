{  config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.direnv;
in
{
  options.${namespace}.programs.direnv = {
    enable = mkBoolOpt false "Whether or not to enable direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
