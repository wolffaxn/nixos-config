{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    zsh
    antibody
  ];

  home.file = {
    ".zshenv".source = config.lib.file.mkOutOfStoreSymlink ./zshenv;
  };
  xdg.configFile = {
    "zsh/aliases.zsh".source = config.lib.file.mkOutOfStoreSymlink ./aliases.zsh;
    "zsh/zlogin".source = config.lib.file.mkOutOfStoreSymlink ./zlogin;
    "zsh/zshrc".source = config.lib.file.mkOutOfStoreSymlink ./zshrc;
  };
}
