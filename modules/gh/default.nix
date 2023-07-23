{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    gh
  ];

  xdg.configFile."gh/config.yml" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config.yml;
  };
}
