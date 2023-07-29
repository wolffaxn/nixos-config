{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    alacritty
  ];

  xdg.configFile = {
    "alacritty.yml".source = config.lib.file.mkOutOfStoreSymlink ./alacritty.yml;
  };
}
