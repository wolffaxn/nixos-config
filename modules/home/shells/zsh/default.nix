{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.shells.zsh;
in
{
  options.${namespace}.shells.zsh = {
    enable = mkBoolOpt false "Whether or not to enable zsh shell";
  };

  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      zsh
    ];

    home.file = {
      ".zshenv".source = config.lib.file.mkOutOfStoreSymlink ./zshenv_home;
    };

    xdg.configFile = {
      "zsh/site-functions".source = config.lib.file.mkOutOfStoreSymlink ./site-functions;
      "zsh/functions.zsh".source = config.lib.file.mkOutOfStoreSymlink ./functions.zsh;
      "zsh/.zlogin".source = config.lib.file.mkOutOfStoreSymlink ./zlogin;
      "zsh/.zshenv".source = config.lib.file.mkOutOfStoreSymlink ./zshenv;
      "zsh/.zshrc".source = config.lib.file.mkOutOfStoreSymlink ./zshrc;
    };
  };
}
