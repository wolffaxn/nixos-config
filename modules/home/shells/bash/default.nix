{  config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.shells.bash;
in
{
  options.${namespace}.shells.bash = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable bash";
    };
  };

  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
    };
  };
}
