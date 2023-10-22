{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    zellij
  ];

  xdg.configFile."zellij/config.kdl" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config.kdl;
  };
}
