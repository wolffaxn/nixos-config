{ config, pkgs, ... }: {

  xdg.configFile = {
    "yabai/yabairc".source = config.lib.file.mkOutOfStoreSymlink ./yabairc;
  };
}
