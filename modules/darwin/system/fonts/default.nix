{ config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.system.fonts;
in
{
  options.${namespace}.system.fonts = {
    enable = mkBoolOpt false "Whether or not to install fonts";
  };

  config = mkIf cfg.enable {

    fonts = {
      packages = with pkgs; [
        # see https://www.nerdfonts.com/font-downloads
        (nerdfonts.override {
          fonts = [
            "FiraCode"
            "FiraMono"
            "Go-Mono"
            "Hack"
            "Hasklig"
            "JetBrainsMono"
            "Meslo"
            "Mononoki"
            "SourceCodePro"
            "SpaceMono"
            "Ubuntu"
            "UbuntuMono"
          ];
        })
      ];
    };
  };
}
