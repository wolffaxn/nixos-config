{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.git;
in
{
  options.${namespace}.programs.git = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable git";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
        diff-so-fancy
        git-crypt
        git-lfs
        gitui
        tig
    ];

    xdg.configFile = {
      "git/attributes".source = config.lib.file.mkOutOfStoreSymlink ./attributes;
      "git/config".source = config.lib.file.mkOutOfStoreSymlink ./config;
      "git/config.local".source = config.lib.file.mkOutOfStoreSymlink ./config.local;
      "git/ignore".source = config.lib.file.mkOutOfStoreSymlink ./ignore;
    };
  };
}
