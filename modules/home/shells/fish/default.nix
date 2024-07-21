{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.shells.fish;
in
{
  options.${namespace}.shells.fish = {
    enable = mkBoolOpt false "Whether or not to enable fish shell";
  };

  config = mkIf cfg.enable {

    programs.fish = {
      enable = true;
      interactiveShellInit = builtins.readFile ./config.fish;
      shellInit = builtins.readFile ./init.fish;
    };

    xdg.configFile = {
      "fish/completions".source = config.lib.file.mkOutOfStoreSymlink ./completions;
      "fish/conf.d".source = config.lib.file.mkOutOfStoreSymlink ./conf.d;
      "fish/functions".source = config.lib.file.mkOutOfStoreSymlink ./functions;
      "fish/themes".source = config.lib.file.mkOutOfStoreSymlink ./themes;
    };
  };
}
