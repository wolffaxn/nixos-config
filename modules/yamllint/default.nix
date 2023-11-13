{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    yamllint
  ];

  xdg.configFile."yamllint/config" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config.yml;
  };
}
