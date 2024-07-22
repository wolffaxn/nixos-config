{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.karabiner-elements;
in
{
  options.${namespace}.programs.karabiner-elements = {
    enable = mkBoolOpt false "Whether or not to enable karabiner-elements";
  };

  config = mkIf cfg.enable {
   xdg.configFile = {
      "karabiner/karabiner.json".source = config.lib.file.mkOutOfStoreSymlink ./karabiner.json;
    };
  };
}
