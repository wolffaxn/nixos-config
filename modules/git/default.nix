{ config, pkgs, ... }: {

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
}
