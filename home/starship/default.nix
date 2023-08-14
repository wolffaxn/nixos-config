{ config, lib, pkgs, ... }: {

  programs.starship.enable = true;

  xdg.configFile."starship.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink ./starship.toml;
  };
}
