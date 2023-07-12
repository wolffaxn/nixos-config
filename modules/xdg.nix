{ config, pkgs, ... }: let
  inherit (pkgs.stdenv.hostPlatform) isDarwin isLinux;
  inherit (config.xdg) cacheHome configHome dataHome;
  inherit (config.home) homeDirectory;
in {
  home = rec {
    sessionVariables = {
      GOPATH = "${dataHome}/go";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "${sessionVariables.GOPATH}/bin"
    ];
  };

  xdg = {
    enable = true;

    cacheHome = "${homeDirectory}/.cache";
    configHome = "${homeDirectory}/.config";
    dataHome = "${homeDirectory}/.local/share";

    userDirs.enable = isLinux;
  };

  home.packages = with pkgs; [
    xdg-utils
  ];
}
