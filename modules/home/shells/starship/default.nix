{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.shells.starship;
in
{
  options.${namespace}.shells.starship = {
    enable = mkBoolOpt false "Whether or not to enable starship";
  };

  config = mkIf cfg.enable {
    programs.starship.enable = true;

    xdg.configFile."starship.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink ./starship.toml;
    };
  };
}
