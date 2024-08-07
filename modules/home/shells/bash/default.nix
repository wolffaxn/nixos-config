{  config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.shells.bash;
in
{
  options.${namespace}.shells.bash = {
    enable = mkBoolOpt false "Whether or not to enable bash shell";
  };

  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
        ${builtins.readFile ./bashrc}
      '';
    };

    home.file = {
      ".hushlogin".source = config.lib.file.mkOutOfStoreSymlink ./hushlogin;
      ".inputrc".source = config.lib.file.mkOutOfStoreSymlink ./inputrc;
    };
  };
}
